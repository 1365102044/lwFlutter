// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LwHouseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HouseResultModel _$HouseResultModelFromJson(Map<String, dynamic> json) {
  return HouseResultModel((json['list'] as List)
      ?.map((e) =>
          e == null ? null : HouseListModel.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$HouseResultModelToJson(HouseResultModel instance) =>
    <String, dynamic>{'list': instance.list};

HouseListModel _$HouseListModelFromJson(Map<String, dynamic> json) {
  return HouseListModel(
      json['itemName'] as String,
      json['houseItemAddress'] as String,
      json['iosDedicated'] as String,
      json['itemStatus'] as int,
      json['id'] as String,
      json['picObj'] == null
          ? null
          : PicObjModel.fromJson(json['picObj'] as Map<String, dynamic>));
}

Map<String, dynamic> _$HouseListModelToJson(HouseListModel instance) =>
    <String, dynamic>{
      'itemName': instance.itemName,
      'houseItemAddress': instance.houseItemAddress,
      'iosDedicated': instance.iosDedicated,
      'itemStatus': instance.itemStatus,
      'picObj': instance.picObj,
      'id': instance.customid
    };

PicObjModel _$PicObjModelFromJson(Map<String, dynamic> json) {
  return PicObjModel(json['big'] as String);
}

Map<String, dynamic> _$PicObjModelToJson(PicObjModel instance) =>
    <String, dynamic>{'big': instance.big};
