import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwBaseModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeMoudel/model/LwHomeModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/houseMoudel/widgets/LwHuXingListWidget.dart';

import 'model/LwHouseDeatilModel.dart';

class LwHuXingListPage extends StatefulWidget {
  List<dynamic> huxingItems = [];
  LwHuXingListPage(this.huxingItems);
  @override
  _LwHuXingListPageState createState() => _LwHuXingListPageState();
}

class _LwHuXingListPageState extends State<LwHuXingListPage> {
  List<dynamic> _huxingItems = [];
  @override
  void initState() {
    super.initState();

    if (widget.huxingItems != null && widget.huxingItems.length != 0) {
      setState(() {
        _huxingItems.addAll(widget.huxingItems);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: lwAppBar('户型'),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        color: Color(0xfff5f5f5),
        child: ListView.separated(
        itemCount: (_huxingItems == null) ? 0 : _huxingItems.length,
        itemBuilder: (BuildContext context, int index) {
          if (_huxingItems[index].runtimeType == RoomTypeListModel) {
            return huxingListItemWidget(
                _huxingItems[index].roomTypePic.big,
                _huxingItems[index].itemName,
                _huxingItems[index].roomTypeName,
                _huxingItems[index].roomTypeArea,
                _huxingItems[index].iosRoomTypeLowestprice);
          }else if(_huxingItems[index].runtimeType == RoomTypeArr){
            return huxingListItemWidget(
                _huxingItems[index].picObj.big,
                _huxingItems[index].roomTypeName,
                _huxingItems[index].zhuangXiu.key,
                _huxingItems[index].minMianji,
                _huxingItems[index].minZujin.toString());
          }
          else{
            print('------------户型列表没有数据');
            return Container(
              color:Colors.red,
              height: 1,
            );
          }
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            color: Color(0xfff5f5f5),
            height: 10.0,
          );
        },
      ),
      ),
    );
  }
}
