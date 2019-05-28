import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

Widget lwFillButton(String text, Function onTap,
    {backColor = Colors.red, textcolor = Colors.white, double fontsize = 15}) {
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
        color: backColor),
    onTap: onTap,
  );
}

Widget lwTextField(TextEditingController controller,String placeholder,{keyboardType = TextInputType.text,List<TextInputFormatter> inputFormatters}){
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
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
    ),
  );
}