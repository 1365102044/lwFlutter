
import 'package:flutter/material.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwBaseModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwUtils.dart';

class LwMapFindHousePage extends StatefulWidget {
  @override
  
  _LwMapFindHousePageState createState() => _LwMapFindHousePageState();
}


class _LwMapFindHousePageState extends State<LwMapFindHousePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: lwAppBar('地图找房'),
      body: Container(
        child: lwMapUtil().showMapView(context,compassEnabled: true),
      ),
    );
  }
}