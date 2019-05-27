import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lwflutterapp/lwhooray/tool/networkUtils.dart';
import 'package:lwflutterapp/lwhooray/tool/widgetUtils.dart';
import 'package:lwflutterapp/lwhooray/widgets/BaseModuleWidget.dart';
import 'package:lwflutterapp/lwhooray/widgets/ListItemImageTopWidget.dart';
import '../widgets/ListItemImageRightWidget.dart';
import '../model/model.dart';
import 'package:lwflutterapp/lwhooray/widgets/SwiperWidget.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with AutomaticKeepAliveClientMixin{
  String pageUrl = 'http://app3.qdaily.com/app3/homes/index_v2/';
  dynamic lastKey = '0';
  final ScrollController _scrollController = new ScrollController();
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    getData();

    ///判断当前滑动位置是不是到达底部，触发加载更多回调
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        getData();
        print('*******************');
      }
    });
  }

  List<dynamic> dataList = [];
  List<MyBanner> banners = [];
  getData() async {
    if (lastKey == '0') {
      dataList = [];
    }
    print('+++++++++++++++++++key:${lastKey}');
    LwNetworkUtils.requestDataWithGet('$pageUrl$lastKey.json', null,
        (Response response) {
      Reslut reslut = Reslut.fromJson(response.data);
      print(reslut);
      if (!reslut.response.hasMore) {
        return;
      }

      /// 更新lastkey
      lastKey = reslut.response.lastKey;
      setState(() {
        if (reslut.response.banners != null) {
          banners = reslut.response.banners;
        }
        List<dynamic> datafeeds = [];
        datafeeds.addAll(reslut.response.feeds);
        if (reslut.response.columns != null) {
          reslut.response.columns.forEach((MyColumn colunm) {
            datafeeds.insert(colunm.location,
                {"id": colunm.id, "showType": colunm.showType});
          });
        }
        dataList.addAll(datafeeds);
      });
    }, (ErrorModel errormodel) {
      print('++++++++++++error:${errormodel.descption()}');
    });
  }

  /// item的个数
  _getItemCount() {
    int count = dataList.length > 0 ? dataList.length + 2 : dataList.length + 1;
    return count;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return 
      // 如果是新页面，会自带返回按键
      Scaffold(
        appBar: new AppBar(
          title: new Text('首页'),
        ),
        //一个ListView，20个Item
        body: RefreshIndicator(
          child: ListView.separated(
            physics: const AlwaysScrollableScrollPhysics(),//下来刷新 确保滚动视图始终可以滚
            itemCount: _getItemCount(),
            controller: _scrollController,
            itemBuilder: (context, index) {
              if (index == 0) {
                return SwiperWidget(context, banners);
              } else if(index < dataList.length + 1){
                return WidgetUtils.getListItemsWidget(
                    context, index, dataList[index - 1]);
              }else{
                return _buildProgressIndicator();
              }
            },
            separatorBuilder: (BuildContext context, int idex) {
              return Container(
                height: 5,
                color: Color.fromARGB(50, 183, 187, 197),
              );
            },
          ),
          onRefresh: () {
            final Completer<void> completer = Completer<void>();
            Timer(const Duration(seconds: 1), () {
              completer.complete();
            });
            return completer.future.then((_) {
              lastKey = '0';
              getData();
            });
          },
        ),
      );
  }

  
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}

///上拉加载更多
Widget _buildProgressIndicator() {
  ///是否需要显示上拉加载更多的loading
  Widget bottomWidget = new Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
    ///loading框
    new SpinKitThreeBounce(color: Color(0xFF24292E)),
    new Container(
      width: 5.0,
    ),
  ]);
  return new Padding(
    padding: const EdgeInsets.all(20.0),
    child: new Center(
      child: bottomWidget,
    ),
  );
}





/**

  _itemsdemo1() {
    return Card(
      child: new FlatButton(
        onPressed: () {
          print('heheheh');
        },
        child: new Row(
          children: <Widget>[
            new Image.asset('images/icon1.jpg'),
            new Image.asset('images/icon2.jpg'),
          ],
        ),
      ),
    );
  }

// 构建一个cell
  _itemDemo(int index) {
    return new Container(
      child: new Card(
        child: new FlatButton(
          onPressed: () {
            print('点击了--${index.toString()}');
          },
          child: new Padding(
            padding: new EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 10),
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Container(
                  child: new Text(
                    '这是描述',
                    style: new TextStyle(color: Colors.grey, fontSize: 17),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  margin: EdgeInsets.only(top: 6, bottom: 2),
                  alignment: Alignment.topLeft,
                ),
                new Image.network(
                    'https://p1.ssl.qhimgs1.com/bdr/612__/t011b338f4426c82011.jpg'),
                new Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                new Image.asset('images/icon2.jpg'),
                new Padding(
                  padding: EdgeInsets.all(10),
                ),
                new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _getBottomItem(Icons.star, '100'),
                    _getBottomItem(Icons.link, '1002'),
                    _getBottomItem(Icons.subject, '323'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 返回一个 居中带图标和文字的item
  _getBottomItem(IconData icon, String text) {
    return new Expanded(
      flex: 1,
      child: new Center(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(
              icon,
              size: 16,
              color: Colors.grey,
            ),
            // 间隔
            new Padding(
              padding: new EdgeInsets.only(left: 5),
            ),
            new Text(
              text,
              style: new TextStyle(fontSize: 15, color: Colors.grey),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
 * 
 *  */