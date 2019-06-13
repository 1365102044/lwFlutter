class lwHuXingDeatilModelResponse {
  Result result;
  Status status;

  lwHuXingDeatilModelResponse({this.result, this.status});

  lwHuXingDeatilModelResponse.fromJson(Map<String, dynamic> json) {
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
  double roomTypeArea;
  String iosMinZujin;
  HuXing huXing;
  ZhuangXiu zhuangXiu;
  String roomTypeName;
  String roomTypeIntro;
  List<Pic> pic;
  double minZujin;
  int kezuNum;
  String itemId;
  String itemName;
  int shi;
  List<RoomTypePeizhi> roomTypePeizhi;
  List<Chaoxiang> chaoxiang;
  int collectionStatus;
  double minPrice;
  int itemStatus;
  String iosMaxZujin;
  int ting;
  String id;
  double rentPrice;
  String itemPhone;
  String iosRoomTypeArea;
  double maxZujin;

  Result(
      {this.roomTypeArea,
      this.iosMinZujin,
      this.huXing,
      this.zhuangXiu,
      this.roomTypeName,
      this.roomTypeIntro,
      this.pic,
      this.minZujin,
      this.kezuNum,
      this.itemId,
      this.itemName,
      this.shi,
      this.roomTypePeizhi,
      this.chaoxiang,
      this.collectionStatus,
      this.minPrice,
      this.itemStatus,
      this.iosMaxZujin,
      this.ting,
      this.id,
      this.rentPrice,
      this.itemPhone,
      this.iosRoomTypeArea,
      this.maxZujin});

  Result.fromJson(Map<String, dynamic> json) {
    roomTypeArea = json['roomTypeArea'] as double;
    iosMinZujin = json['iosMinZujin'];
    huXing =
        json['huXing'] != null ? new HuXing.fromJson(json['huXing']) : null;
    zhuangXiu = json['zhuangXiu'] != null
        ? new ZhuangXiu.fromJson(json['zhuangXiu'])
        : null;
    roomTypeName = json['roomTypeName'];
    roomTypeIntro = json['roomTypeIntro'];
    if (json['pic'] != null) {
      pic = new List<Pic>();
      json['pic'].forEach((v) {
        pic.add(new Pic.fromJson(v));
      });
    }
    minZujin = json['minZujin'] as double;
    kezuNum = json['kezuNum'];
    itemId = json['itemId'];
    itemName = json['itemName'];
    shi = json['shi'];
    if (json['roomTypePeizhi'] != null) {
      roomTypePeizhi = new List<RoomTypePeizhi>();
      json['roomTypePeizhi'].forEach((v) {
        roomTypePeizhi.add(new RoomTypePeizhi.fromJson(v));
      });
    }
    if (json['chaoxiang'] != null) {
      chaoxiang = new List<Chaoxiang>();
      json['chaoxiang'].forEach((v) {
        chaoxiang.add(new Chaoxiang.fromJson(v));
      });
    }
    collectionStatus = json['collectionStatus'];
    minPrice = json['minPrice'];
    itemStatus = json['itemStatus'];
    iosMaxZujin = json['iosMaxZujin'];
    ting = json['ting'];
    id = json['id'];
    rentPrice = json['rentPrice'];
    itemPhone = json['itemPhone'];
    iosRoomTypeArea = json['iosRoomTypeArea'];
    maxZujin = json['maxZujin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roomTypeArea'] = this.roomTypeArea;
    data['iosMinZujin'] = this.iosMinZujin;
    if (this.huXing != null) {
      data['huXing'] = this.huXing.toJson();
    }
    if (this.zhuangXiu != null) {
      data['zhuangXiu'] = this.zhuangXiu.toJson();
    }
    data['roomTypeName'] = this.roomTypeName;
    data['roomTypeIntro'] = this.roomTypeIntro;
    if (this.pic != null) {
      data['pic'] = this.pic.map((v) => v.toJson()).toList();
    }
    data['minZujin'] = this.minZujin;
    data['kezuNum'] = this.kezuNum;
    data['itemId'] = this.itemId;
    data['itemName'] = this.itemName;
    data['shi'] = this.shi;
    if (this.roomTypePeizhi != null) {
      data['roomTypePeizhi'] =
          this.roomTypePeizhi.map((v) => v.toJson()).toList();
    }
    if (this.chaoxiang != null) {
      data['chaoxiang'] = this.chaoxiang.map((v) => v.toJson()).toList();
    }
    data['collectionStatus'] = this.collectionStatus;
    data['minPrice'] = this.minPrice;
    data['itemStatus'] = this.itemStatus;
    data['iosMaxZujin'] = this.iosMaxZujin;
    data['ting'] = this.ting;
    data['id'] = this.id;
    data['rentPrice'] = this.rentPrice;
    data['itemPhone'] = this.itemPhone;
    data['iosRoomTypeArea'] = this.iosRoomTypeArea;
    data['maxZujin'] = this.maxZujin;
    return data;
  }
}

class HuXing {
  String id;
  String type;
  String value;
  String key;
  String mark;

  HuXing({this.id, this.type, this.value, this.key, this.mark});

  HuXing.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    value = json['value'];
    key = json['key'];
    mark = json['mark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['value'] = this.value;
    data['key'] = this.key;
    data['mark'] = this.mark;
    return data;
  }
}

class ZhuangXiu {
  String id;
  String type;
  String value;
  String key;
  String mark;

  ZhuangXiu({this.id, this.type, this.value, this.key, this.mark});

  ZhuangXiu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    value = json['value'];
    key = json['key'];
    mark = json['mark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['value'] = this.value;
    data['key'] = this.key;
    data['mark'] = this.mark;
    return data;
  }
}

class Pic {
  String small;
  String big;
  String ctId;
  String middle;
  String tblSubId;
  String etId;
  int isDelete;
  String gcid;
  String tblId;
  int type;
  int indexNumber;
  String et;
  String ct;
  String name;
  String subType;
  String id;
  String fileType;

  Pic(
      {this.small,
      this.big,
      this.ctId,
      this.middle,
      this.tblSubId,
      this.etId,
      this.isDelete,
      this.gcid,
      this.tblId,
      this.type,
      this.indexNumber,
      this.et,
      this.ct,
      this.name,
      this.subType,
      this.id,
      this.fileType});

  Pic.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    big = json['big'];
    ctId = json['ctId'];
    middle = json['middle'];
    tblSubId = json['tblSubId'];
    etId = json['etId'];
    isDelete = json['isDelete'];
    gcid = json['gcid'];
    tblId = json['tblId'];
    type = json['type'];
    indexNumber = json['indexNumber'];
    et = json['et'];
    ct = json['ct'];
    name = json['name'];
    subType = json['subType'];
    id = json['id'];
    fileType = json['fileType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['big'] = this.big;
    data['ctId'] = this.ctId;
    data['middle'] = this.middle;
    data['tblSubId'] = this.tblSubId;
    data['etId'] = this.etId;
    data['isDelete'] = this.isDelete;
    data['gcid'] = this.gcid;
    data['tblId'] = this.tblId;
    data['type'] = this.type;
    data['indexNumber'] = this.indexNumber;
    data['et'] = this.et;
    data['ct'] = this.ct;
    data['name'] = this.name;
    data['subType'] = this.subType;
    data['id'] = this.id;
    data['fileType'] = this.fileType;
    return data;
  }
}

class RoomTypePeizhi {
  String peizhi;

  RoomTypePeizhi({this.peizhi});

  RoomTypePeizhi.fromJson(Map<String, dynamic> json) {
    peizhi = json['peizhi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['peizhi'] = this.peizhi;
    return data;
  }
}

class Chaoxiang {
  String chaoxiang;

  Chaoxiang({this.chaoxiang});

  Chaoxiang.fromJson(Map<String, dynamic> json) {
    chaoxiang = json['chaoxiang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chaoxiang'] = this.chaoxiang;
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