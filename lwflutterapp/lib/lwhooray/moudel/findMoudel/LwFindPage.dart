import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwBaseModel.dart';

class LwFindPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '发现',
      home: Scaffold(
        appBar: lwAppBar('发现'),
        body:WebviewScaffold(
          url: 'https://www.baidu.com',
        ),
      ),
    );
  }
}



// http://pms.hntpsjwy.com/wechatApps/weixin/homeCenter/find.html