import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwBaseModel.dart';
import 'baseMoudel/lwLocalDataUtils.dart';
import 'find.dart';
import 'findMoudel/LwFindPage.dart';
import 'home.dart';
import 'homeMoudel/LwHomePage.dart';
import './house.dart';
import 'houseMoudel/LwHousePage.dart';
import 'loginMoudel/LwLogin.dart';
import 'me.dart';
import 'meMoudel/LwMePage.dart';

class Hoorayapp extends StatefulWidget {
  @override
  HoorayAppSatate createState() => HoorayAppSatate();
}

class HoorayAppSatate extends State<Hoorayapp>
    with SingleTickerProviderStateMixin {
  static const platform = const MethodChannel('samples.flutter.io/battery');

  TabController controller;

  @override
  initState() {
    super.initState();
    controller = new TabController(length: 4, vsync: this);
    platform.setMethodCallHandler((MethodCall call){
      if(call.method == 'routes'){
        if(call.arguments.toString() == 'house'){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => LwHousePage(null),
          ));
        }
      }
    });
  }

  @override
  void dispose() {
    //销毁，只会调用一次。
    controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // 在 initState 之后调用，此时可以获取其他 State
    super.didChangeDependencies();

    // controller.index = 0;

    controller.addListener(() {
      if (controller.indexIsChanging) {
        print('------------${controller.index.toString()}');
        if (controller.index == 3) {
        }
        print('=====${controller.index}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: new TabBarView(
          controller: controller,
          children: [
            new LwHomePage(),
            new LwHousePage(null),
            new LwFindPage(),
            new LwMePage(),
          ],
        ),
        bottomNavigationBar: new Material(
          color: Colors.white,
          child: lwTabBarWidget(context, controller, {
            '首页': 'home_tab_n',
            '房源': 'house_tab_n',
            '发现': 'find_tab_n',
            '我的': 'me_tab_n'
          }),
        ),
      ),
      // routes: <String, WidgetBuilder>{
        
      // },
    );
  }
}
