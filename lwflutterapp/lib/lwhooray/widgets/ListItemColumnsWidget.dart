import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:lwflutterapp/lwhooray/model/model.dart';
import 'package:lwflutterapp/lwhooray/tool/CommonUtils.dart';
import 'package:lwflutterapp/lwhooray/tool/networkUtils.dart';
import 'package:lwflutterapp/lwhooray/tool/widgetUtils.dart';
import 'package:lwflutterapp/lwhooray/widgets/BaseModuleWidget.dart';
import 'package:lwflutterapp/lwhooray/widgets/ColumsDeatil.dart';
import 'package:lwflutterapp/lwhooray/widgets/ListItemActivityWidget.dart';
import 'package:lwflutterapp/lwhooray/widgets/ListItemNewsWidget.dart';

class ListItemColumnsWidget extends StatefulWidget {
  int id;
  int showType;
  @override
  _ListItemColumnsWidgetState createState() => _ListItemColumnsWidgetState();
  ListItemColumnsWidget({Key key, @required this.id, this.showType})
      : super(key: key);
}

class _ListItemColumnsWidgetState extends State<ListItemColumnsWidget>
    with AutomaticKeepAliveClientMixin {
  bool get wantKeepAlive => true;

  String lastKey = '0';
  String columsUrl = 'http://app3.qdaily.com/app3/columns/index';
  List<Feed> dataList = [];
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _getColumsData();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getColumsData();
      }
    });
  }

  void _getColumsData() async {
    String temurl = '$columsUrl/${widget.id}/$lastKey.json';
    print('***********url:$temurl');
    LwNetworkUtils.requestDataWithGet(temurl, null, (Response response) {
      Reslut reslut = Reslut.fromJson(response.data);
      if (!reslut.response.hasMore) {
        return;
      }

      setState(() {
        lastKey = reslut.response.lastKey.toString();
        dataList.addAll(reslut.response.feeds);
      });
    }, (ErrorModel errorModel) {
      print('+++++网络请求失败errormodel:${errorModel.descption()}');
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ColumsContainerWiget(
        context, dataList, _scrollController, widget.showType);
  }

  Widget ColumsContainerWiget(BuildContext context, List feedlist,
      ScrollController _scrollerController, int showType) {
    if (feedlist.length == 0) {
      return Container();
    }
    return new Container(
      width: MediaQuery.of(context).size.width,
      height: 320.0,
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        children: <Widget>[
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ColumsDeatil()));
              },
              child: Container(
                height: 50,
                child: ListItemActivityTitleWidget(context, feedlist[0]),
              )),
          Container(
            child: ColumsListViewWidget(
                context, _scrollController, feedlist, showType),
          )
        ],
      ),
    );
  }

  Widget ColumsListViewWidget(BuildContext context,
      ScrollController scrollController, List<Feed> feedlist, int showType) {
    return Flexible(
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        controller: scrollController,
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        itemCount: feedlist.length,
        itemBuilder: (context, index) {
          if (showType == 1) {
            return ColumsListViewItemOneWidget(context, feedlist[index]);
          }
          return ColumnsListViewItemTwoWiget(context, feedlist[index]);
        },
        separatorBuilder: (context, index) {
          return Container(
            width: 8.0,
            color: Colors.white,
          );
        },
      ),
    );
  }

  Widget ColumsListViewItemOneWidget(BuildContext context, Feed feed) {
    return GestureDetector(
      onTap: () {
        WidgetUtils.pushToWebView(context, 'http://www.baidu.com');
      },
      child: Container(
        height: 270.0,
        width: 245.0,
        child: Column(
          children: <Widget>[
            Container(
              child: Image.network(feed.image, fit: BoxFit.fitWidth),
            ),
            Container(
              child: TitleWidget(context, feed.post.title,
                  fontSize: 12, maxLines: 2),
              padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
            ),
            Container(
              child: DescriptionLable(context, feed.post.description,
                  fontSize: 11, maxline: 2),
              padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(5, 0, 0, 5),
                alignment: Alignment.bottomLeft,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconText(
                        context, feed.post.commentCount, 'feedComment.png'),
                    IconText(context, feed.post.commentCount, 'feedPraise.png'),
                    Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    ),
                    DescriptionLable(
                        context,
                        CommonUtils.getNewsTimeStr(
                            feed.post.publishTime * 1000)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ColumnsListViewItemTwoWiget(BuildContext context, Feed feed) {
    return GestureDetector(
      onTap: () {
        WidgetUtils.pushToWebView(context, 'http://www.baidu.com');
      },
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Image.network(
                feed.image,
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              child: TitleWidget(context, feed.post.title),
            ),
            Expanded(
              child: Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 5),
                      child: IconText(
                          context, feed.post.commentCount, 'feedComment.png'),
                    ),
                    Container(
                      child: IconText(
                          context, feed.post.commentCount, 'feedComment.png'),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
