import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwBaseModel.dart';
import 'baseMoudel/lwLocalDataUtils.dart';
import 'findMoudel/LwFindPage.dart';
import 'homeMoudel/LwHomePage.dart';
import 'houseMoudel/LwHousePage.dart';
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
    platform.setMethodCallHandler((MethodCall call) {
      if (call.method == 'routes') {
        if (call.arguments.toString() == 'house') {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => LwHousePage(null),
          ));
        }
      }
    });
  }

  _checkLoginStatus() async {
    await lwLocalDataUtils().isLoginStatue(context);
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

    // controller.addListener(() {
    //   if (controller.indexIsChanging) {
    //     if (controller.index == 3) {
    //       _checkLoginStatus();
    //     }
    //     print('=====点击的第${controller.index}个tabbar');
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: new TabBarView(
          controller: controller,
          physics: NeverScrollableScrollPhysics(),
          children: [
            new LwHomePage(),
            new LwHousePage(null),
            new LwFindPage(),
            new LwMePage(),
          ],
        ),
        bottomNavigationBar: new Material(
          color: Colors.white,
          child: lwTabBarWidget(
              context,
              controller,
              {
                '首页': 'home_tab_n',
                '房源': 'house_tab_n',
                '发现': 'find_tab_n',
                '我的': 'me_tab_n'
              },
              onTap: (index) {
                if (index == 3) {
                  // _checkLoginStatus();
                }
                // print('+++++++++++++=index:${index.toString()}');
              }),
        ),
      ),
      // routes: <String, WidgetBuilder>{

      // },
    );
  }
}
