// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LwloginResultModel _$LwloginResultModelFromJson(Map<String, dynamic> json) {
  return LwloginResultModel(
      json['password'] as String,
      json['nickname'] as String,
      json['id'] as String,
      json['token'] as String,
      json['phone'] as String,
      json['sfzNo'] as String);
}

Map<String, dynamic> _$LwloginResultModelToJson(LwloginResultModel instance) =>
    <String, dynamic>{
      'password': instance.password,
      'nickname': instance.nickname,
      'id': instance.customid,
      'token': instance.token,
      'phone': instance.phone,
      'sfzNo': instance.sfzNo
    };

LwLoginResponse _$LwLoginResponseFromJson(Map<String, dynamic> json) {
  return LwLoginResponse(
      json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
      json['result'] == null
          ? null
          : LwloginResultModel.fromJson(json['result']));
}

Map<String, dynamic> _$LwLoginResponseToJson(LwLoginResponse instance) =>
    <String, dynamic>{'status': instance.status, 'result': instance.result};
