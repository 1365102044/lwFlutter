class LwRegionModelResponse {
  Result result;
  Status status;

  LwRegionModelResponse({this.result, this.status});

  LwRegionModelResponse.fromJson(Map<String, dynamic> json) {
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    if (this.status != null) {
      data['status'] = this.status.toJson();
    }
    return data;
  }
}

class Result {
  List<RegionModel> list;

  Result({this.list});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = new List<RegionModel>();
      json['list'].forEach((v) {
        list.add(new RegionModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RegionModel {
  String townName;
  String cityName;
  double lng;
  String cityCode;
  String id;
  String cityId;
  double lat;

  RegionModel(
      {this.townName,
      this.cityName,
      this.lng,
      this.cityCode,
      this.id,
      this.cityId,
      this.lat});

  RegionModel.fromJson(Map<String, dynamic> json) {
    townName = json['townName'];
    cityName = json['cityName'];
    lng = json['lng'];
    cityCode = json['cityCode'];
    id = json['id'];
    cityId = json['cityId'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['townName'] = this.townName;
    data['cityName'] = this.cityName;
    data['lng'] = this.lng;
    data['cityCode'] = this.cityCode;
    data['id'] = this.id;
    data['cityId'] = this.cityId;
    data['lat'] = this.lat;
    return data;
  }
}

class Status {
  String msg;
  String code;

  Status({this.msg, this.code});

  Status.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['code'] = this.code;
    return data;
  }
}

