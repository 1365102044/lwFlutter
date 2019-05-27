import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix1;
import 'package:flutter/painting.dart';

class LwD3 extends StatefulWidget {
  @override
  _LwD3State createState() => _LwD3State();
}

class _LwD3State extends State<LwD3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('布局'),
      ),
      // body: Container(
      //   child: Column(
      //     children: <Widget>[
      //       _getRowWidget(),
      //       _getColumsWidget(),
      //       _getHeaderIconWidget(),
      //       // _getCardWidget(),
      //       // _getContainerWidget(),

      //     ],
      //   ),
      // ),
      // body: _getGridViewWidget(),
      body: _getNaviPushOrPop(context),
    );
  }
}

Widget _getNaviPushOrPop(BuildContext context) {
  return RaisedButton(
    child: Text('跳转控制器'),
    onPressed: () {
      // 隐式路由，需要先注册路由路径，再更加路径名跳转
      Navigator.of(context).pushNamed('/demo1');

      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (context) => JackClass(),
      //   ),
      // );
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => JackClass(),
      //     ));
    },
  );
}

//  GridView 网格列表
Widget _getGridViewWidget() {
  return GridView(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, // 列数
      crossAxisSpacing: 5.0, // 左右的间距
      childAspectRatio: 0.7, // 宽高比
      mainAxisSpacing: 2, // 上下的间距
    ),
    children: <Widget>[
      new Image.network(
          'http://img5.mtime.cn/mt/2018/10/22/104316.77318635_180X260X4.jpg',
          fit: BoxFit.cover),
      new Image.network(
          'http://img5.mtime.cn/mt/2018/10/10/112514.30587089_180X260X4.jpg',
          fit: BoxFit.cover),
      new Image.network(
          'http://img5.mtime.cn/mt/2018/11/13/093605.61422332_180X260X4.jpg',
          fit: BoxFit.cover),
      new Image.network(
          'http://img5.mtime.cn/mt/2018/11/07/092515.55805319_180X260X4.jpg',
          fit: BoxFit.cover),
      new Image.network(
          'http://img5.mtime.cn/mt/2018/11/21/090246.16772408_135X190X4.jpg',
          fit: BoxFit.cover),
      new Image.network(
          'http://img5.mtime.cn/mt/2018/11/17/162028.94879602_135X190X4.jpg',
          fit: BoxFit.cover),
      new Image.network(
          'http://img5.mtime.cn/mt/2018/11/19/165350.52237320_135X190X4.jpg',
          fit: BoxFit.cover),
      new Image.network(
          'http://img5.mtime.cn/mt/2018/11/16/115256.24365160_180X260X4.jpg',
          fit: BoxFit.cover),
      new Image.network(
          'http://img5.mtime.cn/mt/2018/11/20/141608.71613590_135X190X4.jpg',
          fit: BoxFit.cover),
    ],
  );
}

// 自定义数据的列表 （横向时 使用container 包裹）
Widget _getCustomListViewWidget() {
  return ListView.builder(
    itemCount: 3,
    itemBuilder: (context, index) {
      return Container(
        height: 100,
        child: _listViewWidget(),
      );
    },
  );
}

// 静态列表 （横向时 使用container 包裹）
Widget _listViewWidget() {
  return ListView(
    scrollDirection: Axis.horizontal,
    children: <Widget>[
      Container(
        width: 200,
        height: 200,
        color: Colors.red,
      ),
      Container(
        width: 300,
        color: Colors.blue,
      ),
      Container(
        width: 120,
        color: Colors.green,
      ),
      Container(
        width: 300,
        color: Colors.yellow,
      ),
    ],
  );
}

// contrainer的使用
Widget _getContainerWidget() {
  return Container(
    alignment: Alignment.topLeft,
    padding: EdgeInsets.fromLTRB(10, 10, 0, 0), // contrainer 内边距（内部组件的外边距）
    margin: EdgeInsets.all(20), // contrainer 外边距
    child: Text('测试所'),
    // width: 300.0,
    height: 200,
    // color: Colors.green,
    decoration: BoxDecoration(
        // 设置边框
        border: Border.all(
            color: Colors.yellow, width: 5, style: BorderStyle.solid),
        // 设置渐变色
        gradient: const LinearGradient(
          colors: [Colors.red, Colors.blue],
        )),
  );
}

Widget _getCardWidget() {
  return Card(
    child: Column(
      children: <Widget>[
        ListTile(
          title: Text('吉林省吉林市昌邑区'),
          subtitle: Text('技术胖:1513938888'),
          leading: Icon(Icons.save),
        ),
        Divider(),
        ListTile(
          title: Text('北京市海淀区中国科技大学'),
          subtitle: Text('胜宏宇:1513938888'),
          leading: Icon(Icons.save),
        ),
        Divider(),
        ListTile(
          title: Text('河南省濮阳市百姓办公楼'),
          subtitle: Text('JSPang:1513938888'),
          leading: Icon(Icons.save),
        ),
        Divider(),
      ],
    ),
  );
}

/**
 * 
 * 浮动 Stack  两个组件的层叠布局
 * 通过 alignment: const FractionalOffset(0.5, 0.8),控制位置
 * 
 * 多个组件层叠布局 使用
 * Positioned(left,right,top,bottom,width,height),
 * 
 */
Widget _getHeaderIconWidget() {
  return Stack(
    alignment: const FractionalOffset(0.5, 0.8),
    children: <Widget>[
      CircleAvatar(
        backgroundImage: NetworkImage(
          'https://www.fotor.com/images2/features/photo_effects/e_bw.jpg',
        ),
        radius: 80,
      ),
      Positioned(
        left: 10,
        top: 20,
        child: Text('Jack',
            style: TextStyle(
                color: Colors.blue,
                fontSize: 22,
                backgroundColor: Colors.grey)),
      ),
      Positioned(
        bottom: 20,
        right: 20,
        child: Text('rose',
            style: TextStyle(
                color: Colors.blue,
                fontSize: 22,
                backgroundColor: Colors.grey)),
      ),
    ],
  );
}

Widget _getColumsWidget() {
  return Column(
    // crossAxisAlignment:CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text('jasldjladjald'),
      Text('jasldjladjald大客户的卡号大师多看哈可视电话'),
      Text('jasldjladjaldad'),
    ],
  );
}

/**
 * Expanded 占用剩余空间
 */
Widget _getRowWidget() {
  return Row(
    children: <Widget>[
      Expanded(
        child: RaisedButton(
          onPressed: () {},
          color: Colors.red,
          child: Text('按钮1'),
        ),
      ),
      Expanded(
        child: RaisedButton(
          onPressed: () {},
          child: Text('按钮2'),
          color: Colors.red,
        ),
      ),
      Expanded(
        child: RaisedButton(
          onPressed: () {},
          child: Text('按钮2'),
          color: Colors.red,
          highlightColor: Colors.blue,
        ),
      ),
    ],
  );
}

class LWRoutsClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RoseClass(),
              ));
        },
        // child: RaisedButton(
        //   onPressed: () {
        //     Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => RoseClass(),
        //         ));
        //   },
        //   child: Text('跳转界面'),
        // )
        child: Text('跳转页面'),
      ),
    );
  }
}

class RoseClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jack'),
      ),
      body: Text('this is RoseClass page!'),
    );
  }
}

class JackClass extends StatefulWidget {
  @override
  _JackClassState createState() => _JackClassState();
  JackClass({Key key}) : super(key: key);
}

class _JackClassState extends State<JackClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jack'),
      ),
      body: GestureDetector(
        child:  Text('this is jack page!'),
        onTap: (){
          Navigator.of(context).pushNamed('/demo1');
        },
      )
    );
  }
}
