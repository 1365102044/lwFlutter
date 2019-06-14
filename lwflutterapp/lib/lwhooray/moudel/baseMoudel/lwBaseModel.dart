import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:lwflutterapp/lwhooray/moudel/find.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeMoudel/widgets/HomePageWidgets.dart';
import 'package:lwflutterapp/main.dart';

class LWCOLOR {
  /// 背景色
  static final Color LWCOLOR_BACKGROUND = Color(0xfff5f5f5);
}

Widget lwFillButton(String text, Function onTap,
    {backColor = Colors.red,
    textcolor = Colors.white,
    double fontsize = 15,
    double radius = 0,
    double borderWidth = 0,
    borderColor = Colors.white}) {
  return GestureDetector(
    child: Container(
      child: Text(
        text,
        style: TextStyle(
          color: textcolor,
          fontSize: fontsize,
        ),
      ),
      alignment: Alignment.center,
      // color: backColor,
      decoration: BoxDecoration(
        border: Border.all(width: borderWidth, color: borderColor),
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        color: backColor,
      ),
    ),
    onTap: onTap,
  );
}

Widget lwTextField(
  TextEditingController controller,
  String placeholder, {
  keyboardType = TextInputType.text,
  List<TextInputFormatter> inputFormatters,
  FocusNode contentFocusNode,
}) {
  return Container(
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,

        /// 不能上移的站位文字
        // hintText: placeholder,
        /// 能上移的站位文字
        labelText: placeholder,
        errorText: '',
        // border: InputBorder.none,
      ),
      keyboardType: keyboardType,

      /// 键盘样式
      inputFormatters: inputFormatters,

      /// 过滤器（白名单，黑名单）
      focusNode: contentFocusNode,

      /// 隐藏键盘
    ),
  );
}

Widget lwAppBarForHomePageWidget(BuildContext context, String title) {
  return AppBar(
    title: Container(
      child: Text(title),
    ),
    actions: <Widget>[],
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        );
      },
    ),
    toolbarOpacity: 0.5, //整个导航栏的不透明度
    centerTitle: true, //标题是否居中，默认为false
    textTheme: TextTheme(), //这个主题的参数比较多,flutter定义了13种不同的字体样式
    iconTheme: IconThemeData(
        color: Colors.yellow,
        opacity: 0.5,
        size: 30), //icon的主题样式,默认的颜色是黑色的，不透明为1，size是24
    brightness: Brightness.light, //控制状态栏的颜色，lignt 文字是灰色的，dark是白色的
    backgroundColor: Colors.blue, //导航栏和状态栏的的颜色
    // elevation: 10, //阴影的高度
    // bottom: PreferredSize(
    // child: Text('bottom'), preferredSize: Size(30, 30)), // 在appbar下面显示的东西
    flexibleSpace: Text('d12321312'),
    titleSpacing: 10, //标题两边的空白区域,
  );
}

Widget lwAppBar(String title, {Widget leadingWidget}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(color: Colors.black),
    ),
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(
      color: Colors.grey,
    ),
    leading: leadingWidget,
    brightness: Brightness.light,/// 白底黑字
    // automaticallyImplyLeading: false,
  );
}

Widget lwTabBarWidget(
    BuildContext context, TabController tabbarcontrolelr, Map datas) {
  return Container(
    height: 56,
    child: TabBar(
      controller:
          tabbarcontrolelr, //标签选择变化控制器(如果和TabBarView一起使用注意和TabBarView使用同一个controller)
      isScrollable: false, //是否可以滑动 (发现未起作用)
      indicatorColor: Colors.white, //按钮底部的指示器颜色（下划线颜色）
      indicatorWeight: 0.1, //按钮底部的指示器高度
      indicatorPadding: EdgeInsets.all(10), //按钮底部的指示器距离底部的距离
      // indicatorSize: TabBarIndicatorSize.label, //按钮底部的指示器宽度
      labelColor: Colors.orange, // 选中的标签的颜色
      labelStyle: new TextStyle(fontSize: 12), // 选中的标签的颜色
      unselectedLabelColor: Colors.black, // 未选中的标签的颜色
      unselectedLabelStyle: new TextStyle(fontSize: 12), // 未选中的标签的样式
      // labelPadding: EdgeInsets.all(0),
      tabs: getTabsWidget(context, datas),
    ),
  );
}

List<Widget> getTabsWidget(BuildContext context, Map datas) {
  List<Widget> widgets = [];
  datas.forEach((k, v) {
    widgets.add(tabsItemsWidget(context, 'assets/tabbar/' + v + '.png', k));
  });
  return widgets;
}

Widget tabsItemsWidget(BuildContext context, String iconName, String itemName) {
  return Container(
    child: Column(
      children: <Widget>[
        Container(
          width: 25,
          height: 25,
          margin: EdgeInsets.fromLTRB(0, 4, 0, 0),
          child: Image.asset(iconName),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 4, 0, 0),
          child: Text(itemName),
        )
      ],
    ),
  );
}

Widget cellArrowWidget(String leftText,
    {String rightText, bool isHaveRightIcon, Function callBackBlock}) {
  return GestureDetector(
    child: Container(
      color: Colors.white,
      height: 50,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(
                    leftText,
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
                Expanded(
                    child: Container(
                  child: Text(
                    rightText,
                    textAlign: TextAlign.end,
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                )),
                Container(
                  width: isHaveRightIcon ? 22 : 0,
                  height: isHaveRightIcon ? 22 : 0,
                  child: Image.asset('assets/home/arrow_right.png'),
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                ),
              ],
            ),
          ),
          Divider(
            height: 0.5,
            color: Colors.grey,
          ),
        ],
      ),
    ),
    onTap: callBackBlock,
  );
}

lwShowAlertList(BuildContext context, String title, List<String> datas,
    {Function callBlackBlock(int index)}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(title),
          ),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.4,
            child: ListView.builder(
              itemCount: datas.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    child: GestureDetector(
                  child: Column(
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        alignment: Alignment.centerLeft,
                        child: Text(datas[index]),
                        height: 30,
                      ),
                      Divider(),
                    ],
                  ),
                  onTap: () {
                    callBlackBlock(index);
                    Navigator.of(context).pop();
                  },
                ));
              },
            ),
          ),
        );
      });
}

// Widget lwImageWidget(){

// }