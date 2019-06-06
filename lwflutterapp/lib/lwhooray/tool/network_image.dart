// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui show Codec;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:crypto/crypto.dart';
import 'package:path_provider/path_provider.dart';

/// Fetches the given URL from the network, associating it with the given scale.
///
/// The image will be cached regardless of cache headers from the server.
///
/// See also:
///
///  * [Image.network] for a shorthand of an [Image] widget backed by [NetworkImage].
// TODO(ianh): Find some way to honour cache headers to the extent that when the
// last reference to an image is released, we proactively evict the image from
// our cache if the headers describe the image as having expired at that point.
class NetworkImage extends ImageProvider<NetworkImage> {
  /// Creates an object that fetches the image at the given URL.
  ///
  /// The arguments must not be null.
  
  static final CacheFileImage _cacheFileImage = CacheFileImage();
  
  const NetworkImage(this.url, {this.scale = 1.0, this.headers})
      : assert(url != null),
        assert(scale != null);

  /// The URL from which the image will be fetched.
  final String url;

  /// The scale to place in the [ImageInfo] object of the image.
  final double scale;

  /// The HTTP headers that will be used with [HttpClient.get] to fetch image from network.
  final Map<String, String> headers;

  @override
  Future<NetworkImage> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture<NetworkImage>(this);
  }

  @override
  ImageStreamCompleter load(NetworkImage key) {
    return MultiFrameImageStreamCompleter(
      codec: _loadAsync(key),
      scale: key.scale,
      informationCollector: (StringBuffer information) {
        information.writeln('Image provider: $this');
        information.write('Image key: $key');
      },
    );
  }

  static final HttpClient _httpClient = HttpClient();

  Future<ui.Codec> _loadAsync(NetworkImage key) async {
    assert(key == this);

    /// 新增代码块start
    /// 从缓存目录中查找图片是否存在
    final Uint8List cacheBytes = await _cacheFileImage.getFileBytes(key.url);
    if (cacheBytes != null) {
      return PaintingBinding.instance.instantiateImageCodec(cacheBytes);
    }

    /// 新增代码块end

    final Uri resolved = Uri.base.resolve(key.url);
    final HttpClientRequest request = await _httpClient.getUrl(resolved);
    headers?.forEach((String name, String value) {
      request.headers.add(name, value);
    });
    final HttpClientResponse response = await request.close();
    if (response.statusCode != HttpStatus.ok)
      throw Exception(
          'HTTP request failed, statusCode: ${response?.statusCode}, $resolved');

    final Uint8List bytes = await consolidateHttpClientResponseBytes(response);
    if (bytes.lengthInBytes == 0)
      throw Exception('NetworkImage is an empty file: $resolved');

    /// 新增代码块start
    /// 将下载的图片数据保存到指定缓存文件中
    await _cacheFileImage.saveBytesToFile(key.url, bytes);

    /// 新增代码块end

    return PaintingBinding.instance.instantiateImageCodec(bytes);
  }

  @override
  bool operator ==(dynamic other) {
    if (other.runtimeType != runtimeType) return false;
    final NetworkImage typedOther = other;
    return url == typedOther.url && scale == typedOther.scale;
  }

  @override
  int get hashCode => hashValues(url, scale);

  @override
  String toString() => '$runtimeType("$url", scale: $scale)';
}

class CacheFileImage {

  /// 获取url字符串的MD5值
  static String getUrlMd5(String url) {
    var content = new Utf8Encoder().convert(url);
    var digest = md5.convert(content);
    return digest.toString();
  }

  /// 获取图片缓存路径
  Future<String> getCachePath() async {
    Directory dir = await getApplicationDocumentsDirectory();
    Directory cachePath = Directory("${dir.path}/imagecache/");
    if(!cachePath.existsSync()) {
      cachePath.createSync();
    }
    return cachePath.path;
  }

  /// 判断是否有对应图片缓存文件存在
  Future<Uint8List> getFileBytes(String url) async {
    String cacheDirPath = await getCachePath();
    String urlMd5 = getUrlMd5(url);
    File file = File("$cacheDirPath/$urlMd5");
    // print("读取文件:${file.path}");
    if(file.existsSync()) {
      return await file.readAsBytes();
    }

    return null;
  }

  /// 将下载的图片数据缓存到指定文件
  Future saveBytesToFile(String url, Uint8List bytes) async {
    String cacheDirPath = await getCachePath();
    String urlMd5 = getUrlMd5(url);
    File file = File("$cacheDirPath/$urlMd5");
    if(!file.existsSync()) {
      file.createSync();
      await file.writeAsBytes(bytes);
    }
  }
}