import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeMoudel/widgets/HomePageWidgets.dart';

Widget huxingListItemWidget(
  String picurl,
  String title,
  String hx,
  double mj,
  String price, {
  Function callBackBlock,
}) {
  return GestureDetector(
    child: Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            child: Image.network(
              picurl,
              fit: BoxFit.cover,
            ),
            width: 100,
            height: 100,
          ),
          Container(
            child: huxingInforWidget(title, hx, mj),
          ),
          Expanded(
            child: Container(
              child: Text(
                price + '元/月起',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            ),
          ),
        ],
      ),
    ),
    onTap: callBackBlock,
  );
}

Widget huxingInforWidget(String title, String hx, double mj) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start, // 列或行的居左 右
      children: <Widget>[
        Container(
          child: lwTitle(title == null ? '' : title),
          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
        ),
        Container(
          child: lwDescTitle(hx, textcolor: Colors.black),
          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
          // alignment: Alignment.centerLeft,
        ),
        Container(
          child: lwDescTitle('面积：' + mj.toString() + '㎡',
              textcolor: Colors.black, maxline: 1),
          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
          // alignment: Alignment.centerLeft,
        ),
      ],
    ),
  );
}
