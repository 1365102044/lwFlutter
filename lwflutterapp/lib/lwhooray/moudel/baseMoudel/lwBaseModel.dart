import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

Widget lwFillButton(String text, Function onTap,
    {backColor = Colors.red,
    textcolor = Colors.white,
    double fontsize = 15,
    double radius = 0,
    double borderWidth = 0,
    borderColor = Colors.white}) {
  return GestureDetector(
    child: Container(
      child: Text(
        text,
        style: TextStyle(
          color: textcolor,
          fontSize: fontsize,
        ),
      ),
      alignment: Alignment.center,
      // color: backColor,
      decoration: BoxDecoration(
        border: Border.all(width: borderWidth, color: borderColor),
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        color: backColor,
      ),
    ),
    onTap: onTap,
  );
}

Widget lwTextField(
  TextEditingController controller,
  String placeholder, {
  keyboardType = TextInputType.text,
  List<TextInputFormatter> inputFormatters,
  FocusNode contentFocusNode,
}) {
  return Container(
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,

        /// 不能上移的站位文字
        // hintText: placeholder,
        /// 能上移的站位文字
        labelText: placeholder,
        errorText: '',
        // border: InputBorder.none,
      ),
      keyboardType: keyboardType,

      /// 键盘样式
      inputFormatters: inputFormatters,

      /// 过滤器（白名单，黑名单）
      focusNode: contentFocusNode,

      /// 隐藏键盘
    ),
  );
}

Widget lwAppBarWidget(BuildContext context,String title) {
  return AppBar(
    title: Container(
      child: Text(title),
    ),
    actions: <Widget>[],
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        );
      },
    ),
    toolbarOpacity: 0.5, //整个导航栏的不透明度
    centerTitle: true, //标题是否居中，默认为false
    textTheme: TextTheme(), //这个主题的参数比较多,flutter定义了13种不同的字体样式
    iconTheme: IconThemeData(
        color: Colors.yellow,
        opacity: 0.5,
        size: 30), //icon的主题样式,默认的颜色是黑色的，不透明为1，size是24
    brightness: Brightness.light, //控制状态栏的颜色，lignt 文字是灰色的，dark是白色的
    backgroundColor: Colors.blue, //导航栏和状态栏的的颜色
    // elevation: 10, //阴影的高度
    // bottom: PreferredSize(
        // child: Text('bottom'), preferredSize: Size(30, 30)), // 在appbar下面显示的东西
    flexibleSpace: Text('d12321312'),
    titleSpacing: 10, //标题两边的空白区域,
  );
}
