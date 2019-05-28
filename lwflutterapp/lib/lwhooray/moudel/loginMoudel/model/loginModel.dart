import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:lwflutterapp/lwhooray/moudel/homeMoudel/model/LwHomeModel.dart';
part 'loginModel.g.dart';
@JsonSerializable()
class LwloginResultModel {
  String password;
  String nickname;
  @JsonKey(name: 'id')
  String customid;
  String token;
  String phone;
  String sfzNo;
  LwloginResultModel(this.password, this.nickname, this.customid, this.token,
      this.phone, this.sfzNo);

  factory LwloginResultModel.fromJson(dynamic json) {
    if (json == null) {
      return null;
    } else if (json.runtimeType == String) {
      json = jsonDecode(json as String);
    }
    return _$LwloginResultModelFromJson(json);
  }
  Map<String, dynamic> toJson() => _$LwloginResultModelToJson(this);
}

@JsonSerializable()
class LwLoginResponse {
  Status status;
  LwloginResultModel result;
  LwLoginResponse(this.status, this.result);
  factory LwLoginResponse.fromJson(dynamic json) {
    if (json == null) {
      return null;
    } else if (json.runtimeType == String) {
      json = jsonDecode(json as String);
    }
    return _$LwLoginResponseFromJson(json);
  }
  Map<String, dynamic> toJson() => _$LwLoginResponseToJson(this);
}
