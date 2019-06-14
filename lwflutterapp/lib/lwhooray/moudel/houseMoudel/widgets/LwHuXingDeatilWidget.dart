import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeMoudel/widgets/HomePageWidgets.dart';

import 'LwHouseDeatilWidget.dart';

Widget huxingInforsWidget(
    BuildContext context, String title, String desc, String price,
    {bool iscollect = false,Function callBlackBlock,}) {
  return Container(
    padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
    child: Card(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: lwTitle(title ?? ''),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                    child: lwDescTitle(desc ?? '', textcolor: Colors.black),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                    child: lwDescTitle('户型灵活，卧室宽敞', textcolor: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 5, 10, 0),
                    width: 30,
                    height: 30,
                    child: Image.asset('assets/house/' +
                        ((iscollect) ? 'collect_s' : 'collect_n') +
                        '.png'),
                  ),
                  onTap: callBlackBlock,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 5, 10, 0),
                  child: Text(
                    price,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget huxingRoomInforWidget(
    BuildContext context, String title, List<Map<String, String>> datas) {
  return Container(
    padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
    child: Card(
      child: Column(
        children: <Widget>[
          Container(
            child: houseInforTitleWidget(title ?? ''),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
            child: JiuGongGeForIconTextWidget(context, datas),
          )
        ],
      ),
    ),
  );
}

Widget huxingOtherInforWidger(BuildContext context, String title, String text,
    {textcolor = Colors.black}) {
  return Container(
    padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
    child: Card(
      child: Column(
        children: <Widget>[
          Container(
            child: houseInforTitleWidget(title ?? ''),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 5, 5, 10),
            alignment: Alignment.centerLeft,
              child:
                  Text(text, style: TextStyle(color: textcolor, fontSize: 13)))
        ],
      ),
    ),
  );
}
