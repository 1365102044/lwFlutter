import 'package:flutter/material.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwBaseModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwUtils.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeFunctionMoudel/YuDing/LwChooseHousePage.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeFunctionMoudel/YuDing/LwYuDingCommitInforPage.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeFunctionMoudel/YuDing/LwZuYueInforPage.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeFunctionMoudel/model/LwRoomInforModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/houseMoudel/event/LwHouseEvent.dart';
import 'package:lwflutterapp/lwhooray/tool/lwProgressDialog.dart';

class LwYuDingPage extends StatefulWidget {
  @override
  _LwYuDingPageState createState() => _LwYuDingPageState();
}

class _LwYuDingPageState extends State<LwYuDingPage> {
  final List<String> _tabsText = ['预定选房', '预约信息', '确认提交'];
  TabController _tabvc;
  Map _paraMap = {};
  LwRoomInforModel _roomInforModel;
  int _currentIndex = 0;
  bool _isloading = false;
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
              indicatorPadding: EdgeInsets.only(top: 10),
              onTap: (int index) {
                _tabvc.index = _currentIndex;
              },
              tabs: _tabsText.map((v) {
                return Text(v);
              }).toList(),
            )),
        body: WillPopScope(
          child: lwProgressDialog(
            loading: _isloading,
            child: Container(
              color: LWCOLOR.LWCOLOR_BACKGROUND,
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),

                /// 禁止滚动
                controller: _tabvc,
                children: <Widget>[
                  LwYuDingChooseHousePage(
                      (int index, Map map, LwRoomInforModel roomInfor) {
                    setState(() {
                      _currentIndex = 1;
                      _paraMap.addAll(map);
                      _tabvc.index = index;
                      _roomInforModel = roomInfor;
                    });
                  }),
                  LwZuYueInforPage(
                    (int index, Map map) {
                      setState(() {
                        _paraMap.addAll(map);
                        _tabvc.index = index;
                        _currentIndex = 2;
                      });
                    },
                    roomInforModel: _roomInforModel,
                  ),
                  LwYuDingCommitInforPage(_paraMap, (index) {
                    setState(() {
                      if (index == 1) {
                        _tabvc.index = _currentIndex = index;
                      } else {
                        setState(() {
                          _isloading = true;
                        });
                        Future.delayed(Duration(seconds: 3), () {
                          setState(() {
                            _isloading = false;
                          });
                          Navigator.pop(context);
                        });
                      }
                    });
                  }),
                ],
              ),
            ),
          ),
          onWillPop: () {
            lwUtils.showAlertDialog(context, '提示', '确定退出预定 ？', btnText: '确定',
                callblack: () {
              Navigator.pop(context);
            });
          },
        ));
  }
}
