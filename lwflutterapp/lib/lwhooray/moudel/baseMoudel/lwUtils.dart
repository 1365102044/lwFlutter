import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'package:lwflutterapp/lwhooray/tool/network_image.dart' as network;

class lwUtils {
  /// 弹框提示----------
  static showAlertDialog(BuildContext context, String title, String msg,
      {Function callblack, bool barrierDismissible}) {
    showDialog(
        // 设置点击 dialog 外部不取消 dialog，默认能够取消
        barrierDismissible: true,
        context: context,
        builder: (context) => AlertDialog(
              title: Center(
                child: Text(title),
              ),
              titleTextStyle: TextStyle(color: Colors.black), // 标题文字样式
              content: SingleChildScrollView(
                child: Container(
                  child: Text(msg),
                ),
              ),
              contentTextStyle: TextStyle(color: Colors.grey), // 内容文字样式
              backgroundColor: Colors.white,
              elevation: 8.0, // 投影的阴影高度
              semanticLabel: 'Label', // 这个用于无障碍下弹出 dialog 的提示
              shape: Border.all(),
              // dialog 的操作按钮，actions 的个数尽量控制不要过多，否则会溢出 `Overflow`
              actions: <Widget>[
                GestureDetector(
                  child: Container(
                    width:250,
                    // color: Colors.red,
                    alignment: Alignment.center,
                    child: Text('知道了',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  ),
                  onTap: () {
                    if(callblack != null){callblack();}
                    Navigator.pop(context);
                  },
                )
              ],
            ));
  }
}

Image lwImageWithNetWork(String url, {BoxFit customfit = BoxFit.cover}) {
  return Image(
    image: network.NetworkImage(url),
    fit: customfit,
  );
}
