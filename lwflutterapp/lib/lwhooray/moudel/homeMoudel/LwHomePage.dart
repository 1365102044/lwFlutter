import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeMoudel/model/LwHomeModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeMoudel/widgets/HomePageWidgets.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeMoudel/widgets/LwHomeSwiperWidget.dart';
import 'package:lwflutterapp/lwhooray/other/api.dart';
import 'package:lwflutterapp/lwhooray/tool/networkUtils.dart';
import 'dart:convert';

class LwHomePage extends StatefulWidget {
  @override
  _LwHomePageState createState() => _LwHomePageState();
}

class _LwHomePageState extends State<LwHomePage>
    with AutomaticKeepAliveClientMixin {
  bool get wantKeepAlive => true;
  List<BannerPicListModel> _bannerList = [];
  List<RoomTypeListModel> _roomList = [];
  List<ItemListModel> _itemlist = [];

  @override
  void initState() {
    super.initState();

    /// banner 图
    _getBannerList();
    _getTuiJianList();
  }

  void _getTuiJianList() async{
    LwNetworkUtils.requestDataWithPost(LWAPI.HOME_TUIJIAN_URL, {'cityId':'d94bba14-dec1-11e5-bcc3-00163e1c066c'}, (Response response){
      LwResponse lwresponse = LwResponse.fromJson(jsonDecode(response.data));
      setState(() {
        _roomList.addAll(lwresponse.result.roomTypeList);
        _itemlist.addAll(lwresponse.result.itemList);
      });
    
    }, (ErrorModel error){
      print('-----------${error.descption()}');
    });

  }

  /// banner 数据
  void _getBannerList() async {
    LwNetworkUtils.requestDataWithPost(
        LWAPI.HOME_BANNER_URL, {'equipment': '2'}, (Response response) {
      print(response.data.toString());
      LwResponse lwresponse = LwResponse.fromJson(jsonDecode(response.data));
      setState(() {
        _bannerList.addAll(lwresponse.result.bannerPicList);
        print('_bannerList:${_bannerList.toString()}');
      });
    }, (ErrorModel error) {
      print(error.descption());
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: Container(
          child: ListView.separated(
        itemCount: 4,
        itemBuilder: (context, index) {
          
          if (index == 0) {
            return LwSwiperWidget(context, _bannerList);
          } else if (index == 1) {
            return HomeFuncItemsWidget(context);
          } else if (index == 2) {
            print('+++++++++++++$_itemlist');
            return HomeColumsItemWidget(context,_itemlist);
          } else if (index == 3) {
            print('+++++++++++++$_roomList');
            return HomeColumsItemWidget(context,_roomList);
          }
          return Container(
            height: 100.0,
            color: Colors.red,
          );
        },
        separatorBuilder: (context, index) {
          return  Container(
           height: (index == 1 || index == 2) ? 10:0,
           color: Colors.grey, 
          );
        },
      )),
    );
  }
}
