import 'package:dio/dio.dart';
import 'package:lwflutterapp/lwhooray/model/model.dart';
import 'package:lwflutterapp/lwhooray/other/api.dart';

enum RequestMethod {
  GET,
  POST,
}

class LwNetworkUtils {
  /// 获取数据 返回对应的模型对象
  static getDataWithModel(
      RequestMethod method,
      String url,
      Map<String, dynamic> param,
      Type model,
      Function successCallBlock,
      Function errorCallBlock) async {
    await _requestData(method, url, param, (Response response) {
      Reslut reslut = Reslut.fromJson(response.data);
      if (successCallBlock != null) {
        successCallBlock(reslut);
      }
    }, errorCallBlock);
  }

  /// 获取数据 返回response
  static _requestData(
      RequestMethod method,
      String url,
      Map<String, dynamic> param,
      Function successCallBlock,
      Function errorCallBlock) async {
    await _request(method, url, param, successCallBlock, errorCallBlock);
  }

  /// post 请求数据
  static requestDataWithPost(String url, Map<String, dynamic> param,
      Function successCallBlock, Function errorCallBlock) async {
    await _request(
        RequestMethod.POST, url, param, successCallBlock, errorCallBlock);
  }

  /// get 请求数据
  static requestDataWithGet(String url, Map<String, dynamic> param,
      Function successCallBlock, Function errorCallBlock) async {
    await _request(
        RequestMethod.GET, url, param, successCallBlock, errorCallBlock);
  }

  static _request(RequestMethod method, String url, Map<String, dynamic> param,
      Function successCallBlock, Function errorCallBlock) async {
    /// 配置基本參數
    Dio dio = Dio();
    dio.options.baseUrl = LWAPI.LW_API_BASE_URL;
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 60*1000;
    
    /// 默认参数
    param['gcid'] = '0371070';

    ErrorModel errorModel = ErrorModel(url, param, 0, null);
    try {
      Response response;
      if (method == RequestMethod.GET) {
        if (param != null && param.isNotEmpty) {
          StringBuffer sb = new StringBuffer("?");
          param.forEach((key, value) {
            sb.write('$key' + '=' + '$value' + '&');
          });
          String paramString = sb.toString();
          paramString = paramString.substring(0, paramString.length - 1);
          url += paramString;
        }
        response = await dio.get(url);
      } else if (method == RequestMethod.POST) {
        if (param != null && param.isNotEmpty) {
          response = await dio.post(url, data: param);
        } else {
          response = await dio.post(url);
        }
      }
      errorModel.statusCode = response.statusCode;

      if (errorModel.statusCode < 0) {
        errorModel.msg = '网络请求的状态码错误';
        _handlerError(errorModel, errorCallBlock);
        return;
      }
      if (successCallBlock != null) {
        successCallBlock(response);
      }
    } catch (exception) {
      errorModel.msg = exception.toString();
      _handlerError(errorModel, errorCallBlock);
    }
  }

  // 处理错误信息
  static _handlerError(ErrorModel errorModel, Function errorCallBlock) {
    if (errorCallBlock != null) {
      print('\n\n**********error:${errorModel.descption()}\n\n');
      errorCallBlock(errorModel);
    }
  }
}

// 错误信息
class ErrorModel extends RequestModel {
  int statusCode;
  String msg;
  ErrorModel(String url, Map param, this.statusCode, this.msg)
      : super.initRequestModel(url, param);

  descption() {
    return '\nurl:${this.url} \nparam:${this.param} \ncode:${this.statusCode.toString()}\nmsg:${this.msg}';
  }
}

// 请求信息
class RequestModel {
  String url;
  Map<String, dynamic> param;
  RequestModel.initRequestModel(url, param) {
    this.url = url;
    this.param = param;
  }
}
