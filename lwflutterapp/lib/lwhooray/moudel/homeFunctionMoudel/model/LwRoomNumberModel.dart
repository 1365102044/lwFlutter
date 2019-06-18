class LwRoomNumberModel {
  Result result;
  Status status;

  LwRoomNumberModel({this.result, this.status});

  LwRoomNumberModel.fromJson(Map<String, dynamic> json) {
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
  List<RoomModel> list;

  Result({this.list});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = new List<RoomModel>();
      json['list'].forEach((v) {
        list.add(new RoomModel.fromJson(v));
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

class RoomModel {
  String houseId;
  String kezuTime;
  String fangNo;
  int status;

  RoomModel({this.houseId, this.kezuTime, this.fangNo, this.status});

  RoomModel.fromJson(Map<String, dynamic> json) {
    houseId = json['houseId'];
    kezuTime = json['kezuTime'];
    fangNo = json['fangNo'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['houseId'] = this.houseId;
    data['kezuTime'] = this.kezuTime;
    data['fangNo'] = this.fangNo;
    data['status'] = this.status;
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

