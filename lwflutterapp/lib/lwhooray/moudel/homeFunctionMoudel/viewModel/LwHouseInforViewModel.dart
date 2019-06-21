import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwBaseModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwLocalDataUtils.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeFunctionMoudel/model/LwRoomInforModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeFunctionMoudel/model/LwRoomNumberModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeFunctionMoudel/model/lwHuXingInforModel.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeFunctionMoudel/model/lwProjectsInforModel.dart';
import 'package:lwflutterapp/lwhooray/other/api.dart';
import 'package:lwflutterapp/lwhooray/tool/networkUtils.dart';

class LwHouseInforViewModel {
  List<ListModel> projectList = [];
  List<HuXingModel> huxingList = [];
  List<RoomModel> roomnumberList = [];
  LwRoomInforModel roomInforModel;
  

  /// 获取项目列表信息
  getProjectInfor({Function callBackBlcok}) async {
    String cityid = await lwLocalDataUtils.getCurrentCityId();

    LwNetworkUtils.requestDataWithPost(
        LWAPI.HOUSE_PROJECT_LIST_INFOR_BY_CITYID_URL,
        {'cityId': cityid ?? 'd94bba14-dec1-11e5-bcc3-00163e1c066c'},
        (Response response) {
      lwProjectsInforModel res =
          lwProjectsInforModel.fromJson(jsonDecode(response.data));
      projectList.clear();
      projectList.addAll(res.result.list);
      if (callBackBlcok != null) {
        callBackBlcok(projectList);
      }
    }, (ErrorModel error) {});
  }

  /// 获取户型列表数据
  getHuXingInforByProjectId(String projectId, {Function callBackBlcok}) async {
    LwNetworkUtils.requestDataWithPost(
        LWAPI.HOUSE_HUXING_LIST_INFOR_BY_ITEMID_URL,
        {'houseItemId': projectId ?? ''}, (Response response) {
      lwHuXingInforModel res =
          lwHuXingInforModel.fromJson(jsonDecode(response.data));
      huxingList.clear();
      huxingList.addAll(res.result.list);
      if (callBackBlcok != null) {
        callBackBlcok(huxingList);
      }
    }, (ErrorModel error) {});
  }

  /// 根据户型，获取房号
  getRoomNumber(String roomTypeId, {Function callBackBlcok}) {
    LwNetworkUtils.requestDataWithPost(
        LWAPI.HOUSE_GET_FANGJIANNUMBER_LIST_INFOR_URL,
        {'roomTypeId': roomTypeId ?? ''}, (Response response) {
      LwRoomNumberModel res =
          LwRoomNumberModel.fromJson(jsonDecode(response.data));
      roomnumberList.addAll(res.result.list);
      if (callBackBlcok != null) {
        callBackBlcok(roomnumberList);
      }
    }, (ErrorModel error) {});
  }

  /// 获取房间信息
  getRoomInforByHouseId(String houseId, {Function callBackBlcok}) {
    LwNetworkUtils.requestDataWithPost(
        LWAPI.HOUSE_GET_ROOM_INFOR_BY_HOUSEID_URL, {'houseId': houseId ?? ''},
        (Response response) {
      roomInforModel = LwRoomInforModel.fromJson(jsonDecode(response.data));
      if (callBackBlcok != null) {
        callBackBlcok(roomInforModel);
      }
    }, (ErrorModel error) {});
  }

  // /// 选择门店
  // chooseProject() {
  //   List<String> datasProjectName = [];
  //   _projectList.forEach((v) {
  //     datasProjectName.add(v.houseItemName);
  //   });
  //   lwShowAlertList(context, '选择门店', datasProjectName,
  //       callBlackBlock: (int index) {
  //     getHuXingInforByProjectId(_projectList[index].id, callBackBlcok:(huxings) {
  //       // setState(() {
  //       //   _huxingList.addAll(huxings);
  //       // });
  //     });
  //     _paramMap['itemId'] = _projectList[index].id;
  //     setState(() {
  //       _mendianText = _projectList[index].houseItemName;
  //       _huxingText = '请选择户型';
  //       _paramMap['roomTypeId'] = '';
  //     });
  //   });
  // }
}
