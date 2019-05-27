
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:lwflutterapp/lwhooray/model/model.dart';
import 'package:lwflutterapp/lwhooray/widgets/BaseModuleWidget.dart';

Widget ListItemNewsWidget(BuildContext context,Feed feed){
  Widget widget;

  widget = new Column(
    children: <Widget>[
      TitleLableWidget(context,feed),
      FirstLineWidget(context,feed),
      LineWidget(context,feed),
      Container(
        height: 0.5,
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        color: Colors.grey,
      ),
      LineWidget(context,feed),
      BottomLineWidget(context,feed.post),
    ],
  );
  return widget;
}

Widget BottomLineWidget(BuildContext context,Post post){
  return Row(
    children: <Widget>[
      Container(
        child: ListBottomWidget(context,post),
        padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
      ),
      Expanded(
        child: Container(
          alignment: Alignment.centerRight,
          child: DescriptionLable(context, '查看详情>>'),
          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
        )
      ),
    ],
  );
}

Widget LineWidget(BuildContext context,Feed feed){
  return Row(
    children: <Widget>[
      Container(
        height: 30,
        width: 30,
        child: Image.asset('yellowDot.png'),
      ),
      Expanded(
        child: Container(
          child: DescriptionLable(context,feed.newsList[1].description,fontSize: 13),
          padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
        ),
      )
    ],
  );
}

Widget FirstLineWidget(BuildContext context,Feed feed){
  return Row(
    children: <Widget>[
      Container(
        width: 30,
        height: 30,
        child: Image.asset('yellowDot.png'),
        // padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
      ),
      Container(
        width: 200,
        height: 40,
        padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
        child: DescriptionLable(context,feed.newsList[0].description,fontSize:13),
      ),
      Expanded(
        child: Container(
          height: 80,
          alignment: Alignment.centerRight,
          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: Image.network(feed.image,fit: BoxFit.fitHeight,),
        ),
      )
    ],
  );
}

Widget TitleLableWidget(BuildContext context,Feed feed){
  return Row(
    children: <Widget>[
      Container(
        width: 40,
        height: 40,
        child: CircleAvatar(
          backgroundColor: Colors.red,
          backgroundImage:NetworkImage(feed.post.column.icon),
        ),
        padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
      ),
      Padding(
        child: TitleWidget(context,feed.post.column.name,),
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      ),
    ],
  );
}