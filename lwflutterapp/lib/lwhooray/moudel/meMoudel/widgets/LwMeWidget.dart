import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeMoudel/widgets/HomePageWidgets.dart';

// Widget meMainWidget(BuildContext context) {
//   return Container(
//     color: Colors.white,
//     child: ListView.separated(
//       itemCount: 8,
//       scrollDirection: Axis.vertical,
//       itemBuilder: (context, index) {
//         if (index == 0) {
//           return meHeaderInforWidget(
//               context,
//               'https://b-gold-cdn.xitu.io/v3/static/img/flutter.851314d.png',
//               '18801040890');
//         } else if (index == 1) {
//           return Container(
//             height: 30.0,
//             child: Text('常用功能'),
//             alignment: Alignment.centerLeft,
//             padding: EdgeInsets.fromLTRB(15, 0, 0, 5),
//           );
//         } else if (index == 2) {
//           return Container(
//             child: meFunctionRowWidget(context, [
//               '账单',
//               '合同',
//               '保修',
//               '保洁'
//             ], [
//               'assets/me/func_icon/zhangdan.png',
//               'assets/me/func_icon/hetong.png',
//               'assets/me/func_icon/baoxiu.png',
//               'assets/me/func_icon/baojie.png'
//             ]),
//           );
//         } else if (index == 3) {
//           return Container(
//             child: meFunctionRowWidget(context, [
//               '水表',
//               '电表',
//               '智能门锁',
//               '缴费'
//             ], [
//               'assets/me/func_icon/shuibiao.png',
//               'assets/me/func_icon/dianbiao.png',
//               'assets/me/func_icon/zhinengmensuo.png',
//               'assets/me/func_icon/jiaofei.png'
//             ]),
//           );
//         } else if (index == 4) {
//           return Container(
//             width: MediaQuery.of(context).size.width,
//             height: 100.0,
//             child: Image.asset(
//               'assets/me/mine_ad.png',
//               fit: BoxFit.fitWidth,
//             ),
//           );
//         } else if (index == 5) {
//           return Container(
//             child: meFunctionRowWidget(context, [
//               '我的预约',
//               '我的预定',
//               '我的优惠券',
//               '我的收藏',
//             ], [
//               'assets/me/func_icon/yuyue.png',
//               'assets/me/func_icon/yuding.png',
//               'assets/me/func_icon/youhuiquan.png',
//               'assets/me/func_icon/soucang.png'
//             ]),
//           );
//         } else if (index == 6) {
//           return Container(
//             child: lwTextLeftIconRightRowItemWidget(
//                 context, '服务评价', 'assets/home/arrow_right.png'),
//           );
//         } else if (index == 7) {
//           return Container(
//             child: lwTextLeftIconRightRowItemWidget(
//                 context, '投诉建议', 'assets/home/arrow_right.png'),
//           );
//         }
//       },
//       separatorBuilder: (context,index){
//         return Container(
//           color: Color(0xfff5f5f5),
//           height: (index == 0 || index == 5 || index == 3) ? 5.0:0.0,
//         );
//       },
//     ),
//   );
// }

/// 行的item （左文字，右图标）
Widget lwTextLeftIconRightRowItemWidget(
    BuildContext context, String text, String iconName,
    {textcolor: Colors.black, double fontsize: 15}) {
  return Container(
    height: 50.0,
    child: Row(
      children: <Widget>[
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: TextStyle(
                color: textcolor,
                fontSize: fontsize,
              ),
            ),
          ),
        ),
        Container(
          width: 10.0,
          height: 15.0,
          child: Image.asset(iconName),
        )
      ],
    ),
  );
}

/// 每一个行的widget
Widget meFunctionRowWidget(BuildContext context, List textList, List iconList) {
  return Container(
    color: Colors.white,
    child: Row(
    children: <Widget>[
      Expanded(
        child: GestureDetector(
          child: lwIconTopTextBottomWidget(context, textList[0], iconList[0],
            fontsize: 13),
            onTap: (){
              print('---------${textList[0]}');
            },
        ),
      ),
      Expanded(
        child: GestureDetector(
          child: lwIconTopTextBottomWidget(context, textList[1], iconList[1],
            fontsize: 13),
            onTap: (){
              print('---------${textList[1]}');
            },
        ),
      ),
      Expanded(
       child: GestureDetector(
          child: lwIconTopTextBottomWidget(context, textList[2], iconList[2],
            fontsize: 13),
            onTap: (){
              print('---------${textList[2]}');
            },
        ),
      ),
      Expanded(
       child: GestureDetector(
          child: lwIconTopTextBottomWidget(context, textList[3], iconList[3],
            fontsize: 13),
            onTap: (){
              print('---------${textList[3]}');
            },
        ),
      ),
    ],
  ),
  );
}

/// 我的头部 信息
Widget meHeaderInforWidget(
    BuildContext context, String picurl, String accoutName) {
  return Container(
    child: Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 140.0,
          child: Image.asset(
            'assets/me/me_top_bg.png',
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned(
            top: 30.0,
            left: 20.0,
            width: MediaQuery.of(context).size.width - 20,

            /// 设置宽度
            child: Container(
              child: Row(
                children: <Widget>[
                  Container(
                    height: 80.0,
                    width: 80.0,
                    // color: Colors.red,
                    child: CircleAvatar(
                      radius: 80.0,
                      backgroundImage: (picurl == '' || picurl == null)
                          ? AssetImage('assets/me/accountDefultIcon.png')
                          : NetworkImage(picurl),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 30,
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        accoutName,
                        style: TextStyle(
                          fontSize: 17,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ),
            )),
        Positioned(
          right: 10.0,
          top: 30.0,
          child: Container(
            alignment: Alignment.topRight,
            width: 80.0,
            height: 30.0,
            padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
            child: GestureDetector(
              child: Text(
                '设置',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                print('---------你点击了设置');
              },
            ),
          ),
        ),
      ],
    ),
  );
}
