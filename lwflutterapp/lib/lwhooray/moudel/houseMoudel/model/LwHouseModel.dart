
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