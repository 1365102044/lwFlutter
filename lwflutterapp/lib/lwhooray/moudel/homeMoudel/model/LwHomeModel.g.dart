// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LwHomeModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Status _$StatusFromJson(Map<String, dynamic> json) {
  return Status(json['code'] as String, json['msg'] as String);
}

Map<String, dynamic> _$StatusToJson(Status instance) =>
    <String, dynamic>{'msg': instance.msg, 'code': instance.code};

Reslut _$ReslutFromJson(Map<String, dynamic> json) {
  return Reslut((json['bannerPicList'] as List)
      ?.map((e) => e == null
          ? null
          : BannerPicListModel.fromJson(e as Map<String, dynamic>))
      ?.toList())
    ..roomTypeList = (json['roomTypeList'] as List)
        ?.map((e) => e == null
            ? null
            : RoomTypeListModel.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..itemList = (json['itemList'] as List)
        ?.map((e) => e == null
            ? null
            : ItemListModel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ReslutToJson(Reslut instance) => <String, dynamic>{
      'bannerPicList': instance.bannerPicList,
      'roomTypeList': instance.roomTypeList,
      'itemList': instance.itemList
    };

LwResponse _$LwResponseFromJson(Map<String, dynamic> json) {
  return LwResponse(
      json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
      json['result'] == null
          ? null
          : Reslut.fromJson(json['result'] as Map<String, dynamic>));
}

Map<String, dynamic> _$LwResponseToJson(LwResponse instance) =>
    <String, dynamic>{'status': instance.status, 'result': instance.result};

BannerPicListModel _$BannerPicListModelFromJson(Map<String, dynamic> json) {
  return BannerPicListModel(json['picUrl'] as String, json['name'] as String,
      json['picBindLink'] as String);
}

Map<String, dynamic> _$BannerPicListModelToJson(BannerPicListModel instance) =>
    <String, dynamic>{
      'picUrl': instance.picUrl,
      'name': instance.name,
      'picBindLink': instance.picBindLink
    };

RoomTypeListModel _$RoomTypeListModelFromJson(Map<String, dynamic> json) {
  return RoomTypeListModel(
      json['itemName'] as String,
      json['roomTypeId'] as String,
      json['iosRoomTypeLowestprice'] as String,
      json['roomTypePic'] == null
          ? null
          : RoomTypePicModel.fromJson(
              json['roomTypePic'] as Map<String, dynamic>));
}

Map<String, dynamic> _$RoomTypeListModelToJson(RoomTypeListModel instance) =>
    <String, dynamic>{
      'itemName': instance.itemName,
      'roomTypeId': instance.roomTypeId,
      'iosRoomTypeLowestprice': instance.iosRoomTypeLowestprice,
      'roomTypePic': instance.roomTypePic
    };

ItemListModel _$ItemListModelFromJson(Map<String, dynamic> json) {
  return ItemListModel(
      json['itemName'] as String,
      json['itemAddress'] as String,
      json['itemId'] as String,
      json['itemPic'] == null
          ? null
          : ItemPicModel.fromJson(json['itemPic'] as Map<String, dynamic>),
      json['roomTypeName'] as String);
}

Map<String, dynamic> _$ItemListModelToJson(ItemListModel instance) =>
    <String, dynamic>{
      'itemName': instance.itemName,
      'itemAddress': instance.itemAddress,
      'itemId': instance.itemId,
      'roomTypeName': instance.roomTypeName,
      'itemPic': instance.itemPic
    };

RoomTypePicModel _$RoomTypePicModelFromJson(Map<String, dynamic> json) {
  return RoomTypePicModel(json['big'] as String);
}

Map<String, dynamic> _$RoomTypePicModelToJson(RoomTypePicModel instance) =>
    <String, dynamic>{'big': instance.big};

ItemPicModel _$ItemPicModelFromJson(Map<String, dynamic> json) {
  return ItemPicModel(json['big'] as String);
}

Map<String, dynamic> _$ItemPicModelToJson(ItemPicModel instance) =>
    <String, dynamic>{'big': instance.big};
