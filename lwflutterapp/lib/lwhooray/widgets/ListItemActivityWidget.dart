import 'package:flutter/material.dart';
import 'package:lwflutterapp/lwhooray/model/model.dart';
import 'package:lwflutterapp/lwhooray/widgets/BaseModuleWidget.dart';

Widget ListItemActivityWidget(BuildContext context,Feed feed) {
  return Column(
    children: <Widget>[
      Container(
        height: 50,
        child: ListItemActivityTitleWidget(context,feed),
      ),
      Stack(
        alignment: const FractionalOffset(0.07, 0.83),
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              feed.image,
              fit: BoxFit.cover,
            ),
            height: 170,
          ),
          Container(
            child: Image.network(
              feed.post.category.imageLab,
              width: 30,
              height: 30,
            ),
          )
        ],
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        child: TitleWidget(context, feed.post.title),
        margin: EdgeInsets.fromLTRB(15, 10, 15, 8),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        child: DescriptionLable(context, feed.post.description),
        margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
      ),
    ],
  );
}

Widget ListItemActivityTitleWidget(BuildContext context,Feed feed) {
  return Row(
    children: <Widget>[
      Container(
        width: 40,
        height: 40,
        padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
              feed.post.column.icon),
        ),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: TitleWidget(context, feed.post.column.name),
      ),
      Expanded(
        child: Container(
          width: 30,
          height: 30,
          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
          alignment: Alignment.centerRight,
          child: Image.asset('toolbarShare.png'),
        ),
      ),
    ],
  );
}
