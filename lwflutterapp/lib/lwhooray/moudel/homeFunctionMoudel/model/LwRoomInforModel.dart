class LwRoomInforModel {
  Result result;
  Status status;

  LwRoomInforModel({this.result, this.status});

  LwRoomInforModel.fromJson(Map<String, dynamic> json) {
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
  String houseShouDingId;
  int houseStatus;
  String huXing;
  double rent;
  String templateId;
  String fangNo;
  String iosMianJi;
  String unit;
  String houseItemName;
  List<dynamic> roomTypePeizhi;
  String iosRent;
  String louNo;
  String chaoXiang;
  String kezuTime;
  double mianJi;
  List<dynamic> fee;

  Result(
      {this.houseShouDingId,
      this.houseStatus,
      this.huXing,
      this.rent,
      this.templateId,
      this.fangNo,
      this.iosMianJi,
      this.unit,
      this.houseItemName,
      this.roomTypePeizhi,
      this.iosRent,
      this.louNo,
      this.chaoXiang,
      this.kezuTime,
      this.mianJi,
      this.fee});

  Result.fromJson(Map<String, dynamic> json) {
    houseShouDingId = json['houseShouDingId'];
    houseStatus = json['houseStatus'];
    huXing = json['huXing'];
    rent = json['rent'];
    templateId = json['templateId'];
    fangNo = json['fangNo'];
    iosMianJi = json['iosMianJi'];
    unit = json['unit'];
    houseItemName = json['houseItemName'];
    // if (json['roomTypePeizhi'] != null) {
    //   roomTypePeizhi = new List<Map>();
    //   json['roomTypePeizhi'].forEach((v) {
    //     roomTypePeizhi.add(new RoomTypePeizhi.fromJson(v));
    //   });
    // }
    roomTypePeizhi = json['roomTypePeizhi'];
    iosRent = json['iosRent'];
    louNo = json['louNo'];
    chaoXiang = json['chaoXiang'];
    kezuTime = json['kezuTime'];
    mianJi = json['mianJi'];
    fee = json['fee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['houseShouDingId'] = this.houseShouDingId;
    data['houseStatus'] = this.houseStatus;
    data['huXing'] = this.huXing;
    data['rent'] = this.rent;
    data['templateId'] = this.templateId;
    data['fangNo'] = this.fangNo;
    data['iosMianJi'] = this.iosMianJi;
    data['unit'] = this.unit;
    data['houseItemName'] = this.houseItemName;
    // if (this.roomTypePeizhi != null) {
    //   data['roomTypePeizhi'] =
    //       this.roomTypePeizhi.map((v) => v.toJson()).toList();
    // }
    data['roomTypePeizhi'] = this.roomTypePeizhi;
    data['iosRent'] = this.iosRent;
    data['louNo'] = this.louNo;
    data['chaoXiang'] = this.chaoXiang;
    data['kezuTime'] = this.kezuTime;
    data['mianJi'] = this.mianJi;
    data['fee'] = this.fee;
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

