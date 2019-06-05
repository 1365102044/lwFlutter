
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeMoudel/model/LwHomeModel.dart';
part 'LwHouseModel.g.dart';

@JsonSerializable()
class HouseResultModel{
  List<HouseListModel> list;
  HouseResultModel(List<HouseListModel> list);
  factory HouseResultModel.fromJson(Map<String,dynamic> json) => _$HouseResultModelFromJson(json);
  Map<String, dynamic> toJson() => _$HouseResultModelToJson(this); 
}

@JsonSerializable()
class HouseListModel {
  String itemName;
  String houseItemAddress;
  String iosDedicated;
  int itemStatus;
  PicObjModel picObj;
  @JsonKey(name:'id')
  String customid;
  HouseListModel(this.itemName,this.houseItemAddress,this.iosDedicated,this.itemStatus,this.customid,this.picObj);
  factory HouseListModel.fromJson(Map<String,dynamic> json) => _$HouseListModelFromJson(json);
  Map<String, dynamic> toJson() => _$HouseListModelToJson(this);
  
}

@JsonSerializable()
class PicObjModel extends LwPicModel{
  PicObjModel(String big) : super(big);
  factory PicObjModel.fromJson(Map<String,dynamic> json) => _$PicObjModelFromJson(json);
  Map<String, dynamic> toJson() => _$PicObjModelToJson(this); 
}

/// 项目详情
// @JsonSerializable()
// class HouseDeatilResponse {
//   HouseDeatilResult result;
// }
// @JsonSerializable()
// class HouseDeatilResult {
//   picArrModel picArr;
//   sheshiArrModel sheshiArr;
//   String hiItemDesc;
//   String hiZhoubianDesc;
//   double itemStatus;
//   String hiDetailedAddress;
//   double lat;
//   double lng;
//   String departmentId;
//   String hiItemName;
//   String mendianPhone;

//   HouseDeatilResult(this.picArr,this.sheshiArr,this.hiItemDesc,this.hiZhoubianDesc,
//   this.itemStatus,this.hiDetailedAddress,this.lat,this.lng,this.departmentId,this.hiItemName,
//   this.mendianPhone);
// }

// @JsonSerializable()
// class picArrModel extends PicObjModel{
//   picArrModel(String big) : super(big);
//   factory picArrModel.fromJson(dynamic json) {if (json == null) {return null;} else if (json.runtimeType == String) {json = jsonDecode(json as String);}return _$picArrModelFromJson(json);}
//   Map<String, dynamic> toJson() => _$picArrModelToJson(this);
 
// }
// class sheshiArrModel{
//   String name;
//   String iconUrl;
//   @JsonKey(name:'id')
//   String customId;

// }