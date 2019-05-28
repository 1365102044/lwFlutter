import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

Widget lwFillButton(String text, Function onTap,
    {backColor = Colors.red, textcolor = Colors.white, double fontsize = 15,double radius = 0,double borderWidth = 0,borderColor=Colors.white}) {
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
            border: Border.all(width: borderWidth,color: borderColor),
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            color: backColor,
        ),
        ),
    onTap: onTap,
  );
}

Widget lwTextField(TextEditingController controller,String placeholder,{keyboardType = TextInputType.text,List<TextInputFormatter> inputFormatters,FocusNode contentFocusNode,}){
  return Container(
    child: TextField(
      controller: controller,
      decoration: InputDecoration(fillColor: Colors.white,
      filled: true,
      /// 不能上移的站位文字
      // hintText: placeholder,
      /// 能上移的站位文字
      labelText: placeholder,
      errorText: '',
      // border: InputBorder.none,
      ),
      keyboardType: keyboardType,  /// 键盘样式
      inputFormatters: inputFormatters, /// 过滤器（白名单，黑名单）
      focusNode: contentFocusNode, /// 隐藏键盘
    ),
  );
}

