

import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix1;
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lwflutterapp/lwhooray/model/model.dart';
import 'package:lwflutterapp/lwhooray/tool/CommonUtils.dart';

// 标题
Widget TitleWidget(BuildContext context,String text,{double fontSize = 15,maxLines = 3}){
  return new Text(
    text,
    style: new TextStyle(
      fontSize: fontSize,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
  );
}

Widget DescriptionLable(BuildContext context,String text,{double fontSize:12,maxline:1}){
  return new Text(
    text,
    style: new TextStyle(
      color: Color.fromARGB(200, 100, 100, 100),
      fontSize: fontSize,
    ),
    overflow: TextOverflow.ellipsis,
    textAlign: TextAlign.left,
  );
}

Widget IconText(BuildContext context,int text,String imageStr){
  return new Row(
    children: <Widget>[
      Padding(padding: EdgeInsets.only(left: 5,right: 5)),
      new Image.asset(imageStr,fit: BoxFit.fitWidth,width: 12,height: 12,),
      Padding(padding: EdgeInsets.only(left: 2,right: 1)),
      DescriptionLable(context, '$text'),
    ],
  );
}

Widget ListBottomWidget(BuildContext context,Post post){
  return new Row(
    children: <Widget>[
      DescriptionLable(context, post.category.title),
      IconText(context, post.commentCount, 'feedComment.png'),
      IconText(context, post.praiseCount, 'feedPraise.png'),
      DescriptionLable(context, CommonUtils.getNewsTimeStr(post.publishTime * 1000)),
    ],
  );
}

Widget BuildLoadMoreProgressIndicator(BuildContext context){
  return Padding(
    padding: EdgeInsets.all(20),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new SpinKitThreeBounce(color: Color(0xFF24292E)),
          new Container(
            width: 5.0,
          )
        ],
      ),
    ),
  );

}