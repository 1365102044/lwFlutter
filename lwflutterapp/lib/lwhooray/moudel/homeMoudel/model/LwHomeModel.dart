import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'LwHomeModel.g.dart';

@JsonSerializable()
class Status {
  String msg;
  String code;
  Status(this.code, this.msg);
  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);
  Map<String,dynamic> toJson() => _$StatusToJson(this);
}

@JsonSerializable()
class Reslut {
  List<BannerPicListModel> bannerPicList;
  List<RoomTypeListModel> roomTypeList;
  List<ItemListModel> itemList;
  Reslut(this.bannerPicList);
  factory Reslut.fromJson(Map<String,dynamic> json) => _$ReslutFromJson(json);
  Map<String,dynamic> toJson() => _$ReslutToJson(this);
}

@JsonSerializable()
class LwResponse {
  Status status;
  Reslut result;
  LwResponse(this.status, this.result);
  factory LwResponse.fromJson(Map<String, dynamic> json) => _$LwResponseFromJson(json);
  Map<String,dynamic> toJson() => _$LwResponseToJson(this);
}

/// banner 数据模型
@JsonSerializable()
class BannerPicListModel {
  String picUrl;
  String name;
  String picBindLink;
  BannerPicListModel(this.picUrl, this.name, this.picBindLink);
  factory BannerPicListModel.fromJson(Map<String,dynamic> json) => _$BannerPicListModelFromJson(json);
  Map<String, dynamic> toJson() => _$BannerPicListModelToJson(this);
}

@JsonSerializable()
class RoomTypeListModel{
  String itemName;
  String roomTypeId;
  String iosRoomTypeLowestprice;
  RoomTypePicModel roomTypePic;
  RoomTypeListModel(this.itemName,this.roomTypeId,this.iosRoomTypeLowestprice,this.roomTypePic);

  factory RoomTypeListModel.fromJson(Map<String,dynamic> json) => _$RoomTypeListModelFromJson(json);
  Map<String, dynamic> toJson() => _$RoomTypeListModelToJson(this);
}

@JsonSerializable()
class ItemListModel{
  String itemName;
  String itemAddress;
  String itemId;
  String roomTypeName;
  ItemPicModel itemPic;
  ItemListModel(this.itemName,this.itemAddress,this.itemId,this.itemPic,this.roomTypeName);
  factory ItemListModel.fromJson(Map<String,dynamic> json) => _$ItemListModelFromJson(json);
  Map<String, dynamic> toJson() => _$ItemListModelToJson(this);
}

@JsonSerializable()
class RoomTypePicModel{
  String big;
  RoomTypePicModel(this.big);
  factory RoomTypePicModel.fromJson(Map<String,dynamic> json) => _$RoomTypePicModelFromJson(json);
  Map<String, dynamic> toJson() => _$RoomTypePicModelToJson(this);
  
}
@JsonSerializable()
class ItemPicModel{
  String big;
  ItemPicModel(this.big);
  factory ItemPicModel.fromJson(Map<String,dynamic> json) => _$ItemPicModelFromJson(json);
  Map<String, dynamic> toJson() => _$ItemPicModelToJson(this);

}