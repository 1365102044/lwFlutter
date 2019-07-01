import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwLocalDataUtils.dart';
import 'package:lwflutterapp/lwhooray/moudel/meMoudel/widgets/LwMeWidget.dart';

class LwMePage extends StatefulWidget {
  @override
  _LwMePageState createState() => _LwMePageState();
}

class _LwMePageState extends State<LwMePage>
    with AutomaticKeepAliveClientMixin {
  bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
    print('**lw**********initState.mepage**************');
    print('***************initState.mepage*********lw**');
  }

  _checkLoginStatus() async {
    await lwLocalDataUtils().isLoginStatue(context);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Container(
        color: Color(0xfff5f5f5),
        child: ListView.separated(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          itemCount: 8,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            if (index == 0) {
              return meHeaderInforWidget(context, '', '18801040890');
            } else if (index == 1) {
              return Container(
                color: Colors.white,
                height: 50.0,
                child: Text('常用功能'),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
              );
            } else if (index == 2) {
              return Container(
                child: meFunctionRowWidget(context, [
                  '账单',
                  '合同',
                  '保修',
                  '保洁'
                ], [
                  'assets/me/func_icon/zhangdan.png',
                  'assets/me/func_icon/hetong.png',
                  'assets/me/func_icon/baoxiu.png',
                  'assets/me/func_icon/baojie.png'
                ]),
              );
            } else if (index == 3) {
              return Container(
                child: meFunctionRowWidget(context, [
                  '水表',
                  '电表',
                  '智能门锁',
                  '缴费'
                ], [
                  'assets/me/func_icon/shuibiao.png',
                  'assets/me/func_icon/dianbiao.png',
                  'assets/me/func_icon/zhinengmensuo.png',
                  'assets/me/func_icon/jiaofei.png'
                ]),
              );
            } else if (index == 4) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: 100.0,
                child: Image.asset(
                  'assets/me/mine_ad.png',
                  fit: BoxFit.fitWidth,
                ),
              );
            } else if (index == 5) {
              return Container(
                child: meFunctionRowWidget(context, [
                  '我的预约',
                  '我的预定',
                  '我的优惠券',
                  '我的收藏',
                ], [
                  'assets/me/func_icon/yuyue.png',
                  'assets/me/func_icon/yuding.png',
                  'assets/me/func_icon/youhuiquan.png',
                  'assets/me/func_icon/shoucang.png'
                ]),
              );
            } else if (index == 6) {
              return GestureDetector(
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: lwTextLeftIconRightRowItemWidget(
                      context, '服务评价', 'assets/home/arrow_right.png'),
                ),
                onTap: () {
                  print('------------服务评价');
                },
              );
            } else if (index == 7) {
              return GestureDetector(
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: lwTextLeftIconRightRowItemWidget(
                      context, '投诉建议', 'assets/home/arrow_right.png'),
                ),
                onTap: () {
                  print('------------投诉建议');
                },
              );
            }
          },
          separatorBuilder: (context, index) {
            return Container(
              color: Color(0xfff5f5f5),
              height: (index == 0 || index == 5 || index == 3)
                  ? 5.0
                  : ((index == 6 || index == 1) ? 1.0 : 0.0),
            );
          },
        ),
      ),
    );
  }
}
