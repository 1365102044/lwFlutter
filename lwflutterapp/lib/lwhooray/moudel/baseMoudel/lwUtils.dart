
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class lwUtils{

 static showAlertDialog(BuildContext context,String title,String msg,Function callblack) {
    showDialog(
        // 设置点击 dialog 外部不取消 dialog，默认能够取消
        barrierDismissible: true,
        context: context,
        builder: (context) => AlertDialog(
              title: Text(title),
              titleTextStyle: TextStyle(color: Colors.black), // 标题文字样式
              content: Text(msg),
              contentTextStyle: TextStyle(color: Colors.grey), // 内容文字样式
              backgroundColor: Colors.white,
              elevation: 8.0, // 投影的阴影高度
              semanticLabel: 'Label', // 这个用于无障碍下弹出 dialog 的提示
              shape: Border.all(),
              // dialog 的操作按钮，actions 的个数尽量控制不要过多，否则会溢出 `Overflow`
              actions: <Widget>[
                
                FlatButton(onPressed: () => Navigator.pop(context), child: Text('知道了')),
                
                // FlatButton(onPressed: decrease, child: Text('点我减少')),
                // // 点击关闭 dialog，需要通过 Navigator 进行操作
                // FlatButton(onPressed: () => Navigator.pop(context), 
                //            child: Text('你点我试试.')),
              ],
            ));
  }

}