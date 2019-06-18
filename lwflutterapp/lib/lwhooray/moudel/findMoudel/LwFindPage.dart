import 'package:amap_base_map/amap_base_map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwBaseModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwLocalDataUtils.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwUtils.dart';
import 'package:lwflutterapp/lwhooray/widgets/CustomWebView.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LwFindPage extends StatefulWidget {
  @override
  _LwFindPageState createState() => _LwFindPageState();
}

class _LwFindPageState extends State<LwFindPage> {
  String _url = 'http://pms.hntpsjwy.com/wechatApps/weixin/homeCenter/find.html';
  String url1 = 'http://www.baidu.com';
  WebViewController _webviewVC;
  bool _canBackBool = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: lwAppBar('发现',leadingWidget: getBackWidget()),
      body: Container(
        child: WillPopScope(
          onWillPop: () async{
            bool res = await _webviewVC.canGoBack();
            setState(() {
              _canBackBool = res;
            });
            if(res){
              _webviewVC.goBack();
            }
            res = !res;
            return Future.value(res);
          },
          child: WebView(
            onWebViewCreated: (WebViewController vc){
              _webviewVC = vc;
              _webviewVC.loadUrl(url1);
            },
            onPageFinished: (ur){
              setState(() {
              _canBackBool = !(ur == url1);
              print('+++++++++++++=$ur');
              print(_canBackBool);
            });
            },
          ),
        ),
      ),
    );
  }

  Widget getBackWidget(){
  return Container(
    // print('**lw***********_canBackBool*************');
    // print(_canBackBool);
    // print('*************_canBackBool***********lw**');
    height: _canBackBool ? 30:0.0,
    width: _canBackBool ? 30:0.0,

    child: GestureDetector(
        child: Icon(Icons.arrow_back_ios),
        onTap: (){
          _webviewVC.goBack();
        },
      ),
  );
  }
}

