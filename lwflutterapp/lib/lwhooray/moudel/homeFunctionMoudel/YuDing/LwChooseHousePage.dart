import 'package:flutter/material.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwBaseModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeFunctionMoudel/model/LwRoomInforModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeFunctionMoudel/viewModel/LwHouseInforViewModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwUtils.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeFunctionMoudel/widgets/LwYuDingWidgets.dart';
import 'package:lwflutterapp/lwhooray/moudel/houseMoudel/event/LwHouseEvent.dart';

class LwYuDingChooseHousePage extends StatefulWidget {
  Function callBackBlock;
  LwYuDingChooseHousePage(this.callBackBlock);
  @override
  _LwYuDingChooseHousePageState createState() =>
      _LwYuDingChooseHousePageState();
}

class _LwYuDingChooseHousePageState extends State<LwYuDingChooseHousePage> with AutomaticKeepAliveClientMixin{
  bool get wantKeepAlive => true;
  Function _callBackBlock;
  List<String> _leftTextList = ['房源项目', '选择房型', '选择房号'];
  List<String> _rightTextList = ['请选择房源项目', '请选择房型', '请选择房号'];
  LwHouseInforViewModel _viewModel;
  LwRoomInforModel _roomInforModel;
  Map<String, String> _paramMap = {'itemId': '', 'roomTypeId': ''};
  @override
  void initState() {
    super.initState();
    _callBackBlock = widget.callBackBlock;
    _viewModel = LwHouseInforViewModel();
    _viewModel.getProjectInfor();
  }

  _handleTapEvents(int index) {
    switch (index) {
      case 0:
        chooseProject();
        break;
      case 1:
        choosehuXing();
        break;
      case 2:
        chooseRoomNumber();
        break;
      default:
    }
  }

  /// 选择门店
  chooseProject() {
    List<String> datasProjectName = [];
    _viewModel.projectList.forEach((v) {
      datasProjectName.add(v.houseItemName);
    });
    lwShowAlertList(context, '选择门店', datasProjectName,
        callBlackBlock: (int index) {
      _viewModel.getHuXingInforByProjectId(_viewModel.projectList[index].id);
      _paramMap['itemId'] = _viewModel.projectList[index].id;
      setState(() {
        _rightTextList[0] = _viewModel.projectList[index].houseItemName;
        _rightTextList[1] = '请选择户型';
        _rightTextList[2] = '请选择房号';
        _paramMap['roomTypeId'] = '';
        _paramMap['houseId'] = '';
      });
    });
  }

  /// 选择户型
  choosehuXing() {
    if (_paramMap['itemId'] == '') {
      lwUtils.showAlertDialog(
        context,
        '请选择门店',
        '未选择门店',
      );
      return;
    }
    List<String> datasHuXingName = [];
    _viewModel.huxingList.forEach((v) {
      datasHuXingName.add(v.roomTypeName);
    });
    lwShowAlertList(context, '选择户型', datasHuXingName,
        callBlackBlock: (int index) {
      _viewModel.getRoomNumber(
        _viewModel.huxingList[index].roomTypeId,
      );
      setState(() {
        _paramMap['roomTypeId'] = _viewModel.huxingList[index].roomTypeId;
        _paramMap['houseId'] = '';
        _rightTextList[1] = _viewModel.huxingList[index].roomTypeName;
        _rightTextList[2] = '请选择房号';
      });
    });
  }

  /// 选择房号
  chooseRoomNumber() {
    if (_paramMap['itemId'] == '') {
      lwUtils.showAlertDialog(
        context,
        '请选择门店',
        '未选择门店',
      );
      return;
    }
    if (_paramMap['roomTypeId'] == '') {
      lwUtils.showAlertDialog(
        context,
        '请选择户型',
        '未选择户型',
      );
      return;
    }
    List<String> datasRoomNumberName = [];
    _viewModel.roomnumberList.forEach((v) {
      datasRoomNumberName.add(v.fangNo);
    });
    lwShowAlertList(context, '选择户型', datasRoomNumberName,
        callBlackBlock: (int index) {
      _viewModel.getRoomInforByHouseId(_viewModel.roomnumberList[index].houseId,
          callBackBlcok: (roomInfor) {
        setState(() {
          _roomInforModel = roomInfor;
        });
      });
      setState(() {
        _paramMap['houseId'] = _viewModel.roomnumberList[index].houseId;
        _rightTextList[2] = _viewModel.roomnumberList[index].fangNo;
      });
    });
  }

  List<Map<String, String>> getDatas() {
    List<Map<String, String>> datas = [];
    _roomInforModel.result.roomTypePeizhi.forEach((m) {
      String v = m.values.first;
      if (v != null) {
        datas.add({'assets/house/sheshi/'+v+'.png': v});
      }
    });
    return datas;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: LWCOLOR.LWCOLOR_BACKGROUND,
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: (_roomInforModel == null) ? 1 : 2,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return getTopCardWidget();
                    } else {
                      return getChooseHouseRoomInforWidget(
                          context,
                          _roomInforModel.result.huXing,
                          _roomInforModel.result.iosMianJi,
                          _roomInforModel.result.chaoXiang,
                          _roomInforModel.result.iosRent,
                          getDatas());
                    }
                  },
                ),
              ),
            ),
            Container(
              child: getBottomBtnWidget(context, ['下一步'],callBackBlock: (text){
                _callBackBlock(1,_paramMap,_roomInforModel);
              }),
            )
          ],
        ),
      ),
    );
  }

  Widget getTopCardWidget() {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Card(
        child: ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Container(
                child: cellArrowWidget(
              _leftTextList[index],
              rightText: _rightTextList[index],
              callBackBlock: () => _handleTapEvents(index),
            ));
          },
        ),
      ),
    );
  }
}
