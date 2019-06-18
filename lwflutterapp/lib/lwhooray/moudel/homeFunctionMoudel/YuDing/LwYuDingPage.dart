import 'package:flutter/material.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwBaseModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeFunctionMoudel/YuDing/LwChooseHousePage.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeFunctionMoudel/YuDing/LwYuDingCommitInforPage.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeFunctionMoudel/YuDing/LwZuYueInforPage.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeFunctionMoudel/model/LwRoomInforModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/houseMoudel/event/LwHouseEvent.dart';

class LwYuDingPage extends StatefulWidget {
  @override
  _LwYuDingPageState createState() => _LwYuDingPageState();
}

class _LwYuDingPageState extends State<LwYuDingPage> {
  final List<String> _tabsText = ['预定选房', '预约信息', '确认提交'];
  TabController _tabvc;
  Map _paraMap = {};
  LwRoomInforModel _roomInforModel;
  @override
  void initState() {
    super.initState();
    _tabvc = TabController(
      length: _tabsText.length,
      vsync: ScrollableState(),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: lwAppBar('预定',
          bottomWidget: TabBar(
            controller: _tabvc,
            labelStyle: TextStyle(fontSize: 16),
            unselectedLabelStyle: TextStyle(fontSize: 16),
            labelColor: Colors.red,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.red,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.fromLTRB(0, 40, 0, 0),
            isScrollable: false,
            tabs: _tabsText.map((v) {
              return Text(v);
            }).toList(),
          )),
      body: Container(
        color: LWCOLOR.LWCOLOR_BACKGROUND,
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: TabBarView(
          controller: _tabvc,
          children: <Widget>[
            LwYuDingChooseHousePage(
                (int index, Map map, LwRoomInforModel roomInfor) {
              setState(() {
                _paraMap.addAll(map);
                _tabvc.index = index;
                _roomInforModel = roomInfor;
                print(
                    '**lw***********_paraMap11*************LwYuDingChooseHousePage');
                print(map);
                print(_paraMap);
                print('*************_paraMap***********lw**');
              });
            }),
            LwZuYueInforPage(
              (int index, Map map) {
                setState(() {
                  // _paraMap.addAll(map);
                  _tabvc.index = index;
                  print(
                      '**lw***********_paraMap11*************LwZuYueInforPage');
                  print(map);
                  print(_paraMap);
                  print('*************_paraMap***********lw**');
                });
              },
              roomInforModel: _roomInforModel,
            ),
            LwYuDingCommitInforPage(),
          ],
        ),
      ),
    );
  }
}
