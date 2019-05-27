import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lwflutterapp/demo/d1.dart';
import 'package:lwflutterapp/lwhooray/model/model.dart';
import 'package:lwflutterapp/lwhooray/widgets/CustomWebView.dart';
import 'package:lwflutterapp/lwhooray/widgets/ListItemActivityWidget.dart';
import 'package:lwflutterapp/lwhooray/widgets/ListItemColumnsWidget.dart';
import 'package:lwflutterapp/lwhooray/widgets/ListItemImageRightWidget.dart';
import 'package:lwflutterapp/lwhooray/widgets/ListItemImageTopWidget.dart';
import 'package:lwflutterapp/lwhooray/widgets/ListItemNewsWidget.dart';

import 'networkUtils.dart';

class WidgetUtils {
  static Widget getListItemsWidget(BuildContext context, int index,dynamic data) {
   
    Widget widget;
    // int rowindex = random.nextInt(5);/// between 0 and 4
    // int rowindex = index %4 ;

    if (data.runtimeType == Feed) {
      if(data.indexType != null){
        widget =  ListItemNewsWidget(context,data);
      }else if(data.type == 0){
        widget = ListItemActivityWidget(context,data);
      }else if(data.type == 1){
        widget = ListItemImageRightWidget(context,data);
      }else if(data.type == 2){
        widget = ListItemImageTopWidget(context,data);
      }else{
        widget = Container();
      }
    }else{
      // widget = Container();
      print('***********other-data:${data.toString()}');
      widget = ListItemColumnsWidget(id:data['id'],showType:data["showType"]);
    }

    return GestureDetector(
      child: widget,
      onTap: (){
        WidgetUtils.pushToWebView(context,'https://www.jianshu.com');
      },
    );
  }


  static pushToWebView(BuildContext context,String url) async{
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => CustomWebView(url: url,),
    ));
  }
}
