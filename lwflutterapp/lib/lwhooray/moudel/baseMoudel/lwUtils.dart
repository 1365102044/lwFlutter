import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:path/path.dart';

import 'package:lwflutterapp/lwhooray/tool/network_image.dart' as network;
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

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
                    width: 250,
                    // color: Colors.red,
                    alignment: Alignment.center,
                    child: Text(
                      '知道了',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () {
                    if (callblack != null) {
                      callblack();
                    }
                    Navigator.pop(context);
                  },
                )
              ],
            ));
  }

  /// 日期选择器
  static lwShowDetePicker(BuildContext context,
      {showTitleActions = true,
      minTime = '',
      onChanged(String date),
      Function onConfirm(String date)}) {
    String nowtime = DateTime.now().toString();
    List datelist = nowtime.split(' ');
    List yearmothday = datelist[0].toString().split('-');
    List hms = datelist[1].toString().split(':');
    minTime = (minTime == '')
        ? DateTime((int.parse(yearmothday[0]) - 1), int.parse(yearmothday[1]),
            int.parse(yearmothday[2]))
        : '';
    DatePicker.showDatePicker(context,
        showTitleActions: showTitleActions,
        minTime: minTime,
        maxTime: DateTime(
            2119, int.parse(yearmothday[1]), int.parse(yearmothday[2])),
        onChanged: (date) {
      String onchangedate = date.toString().split(' ').first;
      if (onChanged != null) {
        onChanged(onchangedate);
      }
    }, onConfirm: (date) {
      String confimdate = date.toString().split(' ').first;
      if (onConfirm != null) {
        onConfirm(confimdate);
      }
    }, currentTime: DateTime.now(), locale: LocaleType.zh);
  }

  /// popmenu 下拉菜单(x 位置不容易控制)
  static lwpopMenuWidget(BuildContext context,List datas, double left, double top,{Function callBlackBlock}) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(-500, top+10, 200, 100),
      items: popItem(datas),
    ).then((newValue){
      if(callBlackBlock != null){
        callBlackBlock(newValue);
      }
    });
  }

 static List<PopupMenuItem<String>> popItem(List datas){
  List<PopupMenuItem<String>> list = [];
  datas.forEach((v){
    list.add(PopupMenuItem<String>(
          height: 40,
          child: Container(
            alignment: Alignment.center,
            child: Text(v),
          ),
          value: v,
        ));
  });
  return list;
}
}



/// 图片加载 （磁盘缓存）
Image lwImageWithNetWork(String url, {BoxFit customfit = BoxFit.cover}) {
  return Image(
    // color: Colors.grey,
    image: network.NetworkImage(url),
    fit: customfit,
  );
}

class lwUtilsFrame {
  // GlobalKey _anchorKey;
  RenderBox _renderBox;
  var _widgetFrame;

  lwUtilsFrame init(GlobalKey anchorKey) {
    /// 获取控件的坐标
    _renderBox = anchorKey.currentContext.findRenderObject();
    _widgetFrame = _renderBox.localToGlobal(Offset.zero);
    var offset = _renderBox.localToGlobal(Offset(0.0, _renderBox.size.height));
    print('==============lwUtilsFrame');
    print(_renderBox);
    print(_renderBox.size);
    print(_widgetFrame);
    print(offset);
    print('==============lwUtilsFrame');
    return this;
  }

  /// x坐标
  double getX() {
    return _widgetFrame.dx;
  }

  /// y坐标
  double getY() {
    return _widgetFrame.dy;
  }

  /// 宽度
  double getWidth() {
    return _renderBox.size.width;
  }

  /// 高度
  double getHeight() {
    return _renderBox.size.height;
  }

  /// 最大Y
  double getMaxY() {
    double maxy = _renderBox.size.height + _widgetFrame.dy;
    print('============maxy');
    print(maxy);
    return maxy;
  }

  /// 最大X
  double getMaxX() {
    return _renderBox.size.width + _widgetFrame.dx;
  }
}
