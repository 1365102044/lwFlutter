
import 'package:flutter/material.dart';
import 'package:lwflutterapp/lwhooray/model/model.dart';
import 'BaseModuleWidget.dart';

Widget ListItemImageRightWidget(BuildContext context,Feed feed){
  Widget widget;
  widget = Container(
    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
    child: new Row(
      children: <Widget>[
      // left
      Container(
        width: 200,
        height: 120,
        margin: EdgeInsets.all(0),
        child: new Column(
          children: <Widget>[
            Container(
              child: TitleWidget(context,feed.post.title),
              padding: EdgeInsets.all(10),
              alignment: Alignment.topLeft,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                alignment: Alignment.bottomLeft,
                child: ListBottomWidget(context,feed.post),
              ),
            ),
          ],
        ),
      ),
      // image
      new Expanded(
        child: Container(
          margin: EdgeInsets.only(left: 10,right: 10),
          height: 120,
          child: new Image.network(feed.image,fit: BoxFit.fitWidth,),
        ),
      ),
    ],
    ),
  );
  return widget;
}