import 'package:amap_base_map/amap_base_map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwBaseModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwLocalDataUtils.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwUtils.dart';
import 'package:lwflutterapp/lwhooray/widgets/CustomWebView.dart';

class LwFindPage extends StatefulWidget {
  @override
  _LwFindPageState createState() => _LwFindPageState();
}

class _LwFindPageState extends State<LwFindPage> {
  TextEditingController controller = TextEditingController();
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  var urlString = "https://www.appblog.cn";
  @override
  void initState() {
    super.initState();
    //监听页面状态改变
    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged wvs) {
      print(wvs.type);
    });
    //监听页面滚动事件
    flutterWebviewPlugin.onScrollYChanged.listen((double offsetY) {
      print('offsetY: $offsetY');
    });
    flutterWebviewPlugin.onScrollXChanged.listen((double offsetX) {
      print('offsetX: $offsetX');
    });
  }

  launchUrl() {
    setState(() {
      urlString = controller.text;
      flutterWebviewPlugin.reloadUrl(urlString);
    });
  }

  Widget build(BuildContext context) {
//    return WebviewScaffold(
//        appBar: new AppBar(
//          title: new Text('WebView Demo'),
//        ),
//        url: 'http://www.appblog.cn',
//    );
    return WebviewScaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: false,
          controller: controller,
          textInputAction: TextInputAction.go,
          onSubmitted: (url) => launchUrl(),
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Enter Url Here",
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: () => launchUrl(),
          )
        ],
      ),
      url: urlString,
      withZoom: false,
    );
  }
}

// http://pms.hntpsjwy.com/wechatApps/weixin/homeCenter/find.html
