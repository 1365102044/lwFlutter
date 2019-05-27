
import 'package:flutter/material.dart';
import 'package:lwflutterapp/lwhooray/model/model.dart';
import 'package:lwflutterapp/lwhooray/widgets/BaseModuleWidget.dart';

Widget ListItemImageTopWidget(BuildContext context,Feed feed){
  return Column(
    children: <Widget>[
      Padding(padding: EdgeInsets.only(top: 10)),
      Container(
        width: MediaQuery.of(context).size.width,
        height: 170,
        alignment: Alignment.center,
        child: new Image.network(feed.image,fit: BoxFit.fitWidth,),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.fromLTRB(15, 15, 15, 8),
        child: TitleWidget(context, feed.post.title),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.fromLTRB(15, 0, 15, 20),
        child: DescriptionLable(context, feed.post.description),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(15, 0, 0, 5),
        child: ListBottomWidget(context,feed.post),
      ),
    ],
  );

}