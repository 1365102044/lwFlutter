import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeMoudel/widgets/HomePageWidgets.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeMoudel/widgets/LwHomeSwiperWidget.dart';
import 'package:lwflutterapp/lwhooray/moudel/houseMoudel/LwHuXingDeatilPage.dart';
import 'package:lwflutterapp/lwhooray/moudel/houseMoudel/LwHuXingListPage.dart';
import 'package:lwflutterapp/lwhooray/moudel/houseMoudel/model/LwHouseDeatilModel.dart';

Widget houseDeatilSwiperWidget(
    BuildContext context, List<lwSwiperModel> bannerList, String itemName,int itemStatus) {
  return Container(
    child: Stack(
      alignment: const FractionalOffset(0.8, 0.8),
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              child: LwSwiperWidget(context, bannerList),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Card(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                      child: lwTitle(itemName),
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                      child: lwDescTitle('保障：100%真是房源 佣金：100%免佣金'),
                      alignment: Alignment.centerLeft,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          child: Image.asset('assets/house/choujianzhong.png'),  
          height: (itemStatus == 4) ? 160 : 0,
          width: 100,
        ),
      ],
    ),
  );
}

Widget aboutUsWidget(
  BuildContext context,
  String phone,
  String addres,
) {
  return Container(
    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
    child: Card(
      child: Container(
        child: Column(
          children: <Widget>[
            houseInforTitleWidget('联系我们'),
            iconLeftTextRightWidget(
                context, 'assets/house/phoneicon.png', '客服电话:' + phone),
            Divider(),
            iconLeftTextRightWidget(
                context, 'assets/house/locationicon.png', addres),
          ],
        ),
      ),
    ),
  );
}

Widget basicsInforWidget(BuildContext context, List<Map<String,String>>datas) {
  return Container(
    padding: EdgeInsets.all(5),
    child: Card(
      child: Column(
        children: <Widget>[
          houseInforTitleWidget('基础设施'),
          JiuGongGeForIconTextWidget(context, datas),
        ],
      ),
    ),
  );
}

/// 九宫格，图片路径：文字
Widget JiuGongGeForIconTextWidget(BuildContext context,List<Map<String,String>>datas){
return Container(
            child: GridView(
              physics: NeverScrollableScrollPhysics(),//禁止滚动
              shrinkWrap: true,// 解决嵌套问题的冲突
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1.1,//宽高比
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              children: List.generate(datas.length, (index) {
                return Container(
                  child: lwIconTopTextBottomWidget(
                      context,
                      datas[index].values.first,
                      datas[index].keys.first,
                      iconH: 25,
                      iconW: 25),
                );
              }),
            ),
          );
}

Widget moreHuxingWidget(BuildContext context,List<RoomTypeArr> huxingItems){
  return Container(
    padding: EdgeInsets.all(5),
    child: Card(
      child: Column(
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: houseInforTitleWidget('户型'),
                )
              ),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  alignment: Alignment.centerRight,
                  width: 100,
                  height: 30,
                  child: Text('更多'),
                ),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LwHuXingListPage(huxingItems),
                    ));
                },
              )
            ],
          ),
        ),
      Container(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: huxingItems.length,
          itemBuilder: (BuildContext context,int index){
            return HomeRowItemWidget(context, huxingItems[index].picObj.big, huxingItems[index].roomTypeName, '',callBackBlock: (){
              print('-----------点击了项目详情中的 户型 items');
              Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => lwHuXingDeatilPage(huxingItems[index].id),));
              
            });
          },  
        ),
      )
      ],
    ),
    )
  );
}

Widget zhouBianWidget(String text){
  return Container(
    padding: EdgeInsets.all(5),
    child:Card(
      child:Column(
        children: <Widget>[
          houseInforTitleWidget('周边介绍'),
          Container(
            padding: EdgeInsets.all(5),
            child: lwDescTitle(text,textcolor:Colors.black,fontsize: 13,maxline: 10),
          )
        ],
      ),
    ),
  );
}

Widget iconLeftTextRightWidget(
    BuildContext context, String iconName, String text) {
  return Container(
    child: Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          child: Image.asset(iconName),
          width: 25,
          height: 25,
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Text(
            text,
          ),
        )
      ],
    ),
  );
}

Widget houseInforTitleWidget(String text) {
  return Container(
    child: Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
          color: Colors.red,
          width: 1,
          height: 20.0,
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: lwTitle(text),
        ),
      ],
    ),
  );
}
