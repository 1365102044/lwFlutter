class lwHuXingInforModel {
  Result result;
  Status status;

  lwHuXingInforModel({this.result, this.status});

  lwHuXingInforModel.fromJson(Map<String, dynamic> json) {
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
  List<HuXingModel> list;

  Result({this.list});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = new List<HuXingModel>();
      json['list'].forEach((v) {
        list.add(new HuXingModel.fromJson(v));
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

class HuXingModel {
  String roomTypeName;
  String roomTypeId;

  HuXingModel({this.roomTypeName, this.roomTypeId});

  HuXingModel.fromJson(Map<String, dynamic> json) {
    roomTypeName = json['roomTypeName'];
    roomTypeId = json['roomTypeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roomTypeName'] = this.roomTypeName;
    data['roomTypeId'] = this.roomTypeId;
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

