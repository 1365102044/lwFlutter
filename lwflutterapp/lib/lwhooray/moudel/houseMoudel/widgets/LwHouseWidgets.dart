import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeMoudel/widgets/HomePageWidgets.dart';

Widget houseColumsItemWidget(BuildContext context,String picurl,String title,String desc,String price){
  return Container(
    color: Colors.white,
    child: Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 150.0,
          child: Image.network(
            picurl,
            fit: BoxFit.fitWidth,
          ),
        ),
        Container(
          height: 60.0,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                alignment: Alignment.topLeft,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      alignment: Alignment.topLeft,
                      child: lwTitle(title, fontsize: 15,),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                      alignment: Alignment.topLeft,
                      child: lwTextRightIconLeftWidget(context, desc, 'assets/house/location_icon.jpg'),
                    )
                  ],
                ),
              ),
              ),
              Container(
                alignment: Alignment.topRight,
                color: Colors.red,
                height: 20.0,
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Text(price+'元/每月起',style:TextStyle(color: Colors.white,),
              ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget lwTextRightIconLeftWidget(
    BuildContext context, String text, String iconName,{double iconW =16.0,double iconH =16.0,double fontsize:12,textcolor:Colors.grey,int maxlines = 1}) {
  return Row(
    children: <Widget>[
      Container(
        padding: EdgeInsets.fromLTRB(1, 0, 0, 0),
        child: Image.asset(iconName),
        height: iconH,
        width: iconW,
      ),
      Container(
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        child: Text(text, 
                    style: TextStyle(fontSize: fontsize, color: textcolor,),
                    maxLines: maxlines,
        ),
      ),
    ],
  );
}
