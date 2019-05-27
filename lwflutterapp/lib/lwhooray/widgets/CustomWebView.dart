import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class CustomWebView extends StatefulWidget {
  String url;
  @override
  _CustomWebViewState createState() => _CustomWebViewState();
  CustomWebView({Key key, this.url}) : super(key: key);
}

class _CustomWebViewState extends State<CustomWebView> {
  String _url = 'https://www.jianshu.com/';
  @override
  void initState() {
    super.initState();
    // setState(() {
    //   url = widget.url;  
    // });
    
    print('url:${_url}');
  }

  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
          appBar: AppBar(
            title: new Text('详情'),
          ),
          url: _url,
          withZoom: true,
          withLocalStorage: true,
        );
  }
}
