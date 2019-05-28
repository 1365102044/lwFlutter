import 'package:flutter/material.dart';
import 'find.dart';
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
  TabController controller;
  @override
  void initState() {
    //初始化，理论上只有初始化一次，
    super.initState();
    controller = new TabController(length: 4, vsync: this);

    controller.addListener(
      (){
        
        if(controller.indexIsChanging){
        print('------------${controller.index.toString()}'); 
        if (controller.index == 2) {
          // controller.index = 1;
        }
        print('=====${controller.index}');
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

    controller.index  = 0;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      body: new TabBarView(
        controller: controller,
        children: [
          new LwHomePage(),
          new LwHousePage(),
          new LwLoginPage(),
          new LwMePage(),
        ],
      ),
      bottomNavigationBar: new Material(
          color: Colors.blue,
          child: Container(
              height: 70,
              child: new TabBar(
                controller:
                    controller, //标签选择变化控制器(如果和TabBarView一起使用注意和TabBarView使用同一个controller)
                isScrollable: false, //是否可以滑动 (发现未起作用)
                indicatorColor: Colors.white, //按钮底部的指示器颜色（下划线颜色）
                indicatorWeight: 0.1, //按钮底部的指示器高度
                // indicatorPadding: EdgeInsets.all(10), //按钮底部的指示器距离底部的距离
                // indicatorSize: TabBarIndicatorSize.label, //按钮底部的指示器宽度
                labelColor: Colors.orange, // 选中的标签的颜色
                labelStyle: new TextStyle(fontSize: 15), // 选中的标签的颜色
                unselectedLabelColor: Colors.white, // 未选中的标签的颜色
                unselectedLabelStyle: new TextStyle(fontSize: 12), // 未选中的标签的样式
                // labelPadding: EdgeInsets.all(0),
                tabs: //一系列标签控件(和TabBarView一起使用注意和TabBarView的长度一样)
                    [
                  new Tab(
                    text: '首页',
                    icon: Icon(Icons.home),
                  ),
                  new Tab(
                    text: '房源',
                    icon: Icon(Icons.hourglass_empty),
                  ),
                  new Tab(
                    text: '发现',
                    icon: Icon(Icons.important_devices),
                  ),
                  new Tab(
                    text: '我的',
                    icon: Icon(Icons.monetization_on),
                  )
                ],
              ))),
      ),
    );
     
  }
}
