class LwHouseDeatilModel {
  Result result;
  Status status;

  LwHouseDeatilModel({this.result, this.status});

  LwHouseDeatilModel.fromJson(Map<String, dynamic> json) {
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
  String hiAreaId;
  List<PicArr> picArr;
  double lng;
  int isDelete;
  String gcid;
  String departmentId;
  List<SheshiArr> sheshiArr;
  String mendianPhone;
  String hiItemDesc;
  HiArea hiArea;
  int kezuNum;
  String hiItemName;
  String ct;
  HiCity hiCity;
  String hiZhoubianDesc;
  List<RoomTypeArr> roomTypeArr;
  int itemStatus;
  String id;
  String hiCityId;
  String pics;
  double lat;
  String hiDetailedAddress;

  Result(
      {this.hiAreaId,
      this.picArr,
      this.lng,
      this.isDelete,
      this.gcid,
      this.departmentId,
      this.sheshiArr,
      this.mendianPhone,
      this.hiItemDesc,
      this.hiArea,
      this.kezuNum,
      this.hiItemName,
      this.ct,
      this.hiCity,
      this.hiZhoubianDesc,
      this.roomTypeArr,
      this.itemStatus,
      this.id,
      this.hiCityId,
      this.pics,
      this.lat,
      this.hiDetailedAddress});

  Result.fromJson(Map<String, dynamic> json) {
    hiAreaId = json['hiAreaId'];
    if (json['picArr'] != null) {
      picArr = new List<PicArr>();
      json['picArr'].forEach((v) {
        picArr.add(new PicArr.fromJson(v));
      });
    }
    lng = json['lng'];
    isDelete = json['isDelete'];
    gcid = json['gcid'];
    departmentId = json['departmentId'];
    if (json['sheshiArr'] != null) {
      sheshiArr = new List<SheshiArr>();
      json['sheshiArr'].forEach((v) {
        sheshiArr.add(new SheshiArr.fromJson(v));
      });
    }
    mendianPhone = json['mendianPhone'];
    hiItemDesc = json['hiItemDesc'];
    hiArea =
        json['hiArea'] != null ? new HiArea.fromJson(json['hiArea']) : null;
    kezuNum = json['kezuNum'];
    hiItemName = json['hiItemName'];
    ct = json['ct'];
    hiCity =
        json['hiCity'] != null ? new HiCity.fromJson(json['hiCity']) : null;
    hiZhoubianDesc = json['hiZhoubianDesc'];
    if (json['roomTypeArr'] != null) {
      roomTypeArr = new List<RoomTypeArr>();
      json['roomTypeArr'].forEach((v) {
        roomTypeArr.add(new RoomTypeArr.fromJson(v));
      });
    }
    itemStatus = json['itemStatus'];
    id = json['id'];
    hiCityId = json['hiCityId'];
    pics = json['pics'];
    lat = json['lat'];
    hiDetailedAddress = json['hiDetailedAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hiAreaId'] = this.hiAreaId;
    if (this.picArr != null) {
      data['picArr'] = this.picArr.map((v) => v.toJson()).toList();
    }
    data['lng'] = this.lng;
    data['isDelete'] = this.isDelete;
    data['gcid'] = this.gcid;
    data['departmentId'] = this.departmentId;
    if (this.sheshiArr != null) {
      data['sheshiArr'] = this.sheshiArr.map((v) => v.toJson()).toList();
    }
    data['mendianPhone'] = this.mendianPhone;
    data['hiItemDesc'] = this.hiItemDesc;
    if (this.hiArea != null) {
      data['hiArea'] = this.hiArea.toJson();
    }
    data['kezuNum'] = this.kezuNum;
    data['hiItemName'] = this.hiItemName;
    data['ct'] = this.ct;
    if (this.hiCity != null) {
      data['hiCity'] = this.hiCity.toJson();
    }
    data['hiZhoubianDesc'] = this.hiZhoubianDesc;
    if (this.roomTypeArr != null) {
      data['roomTypeArr'] = this.roomTypeArr.map((v) => v.toJson()).toList();
    }
    data['itemStatus'] = this.itemStatus;
    data['id'] = this.id;
    data['hiCityId'] = this.hiCityId;
    data['pics'] = this.pics;
    data['lat'] = this.lat;
    data['hiDetailedAddress'] = this.hiDetailedAddress;
    return data;
  }
}

class PicArr {
  String small;
  String big;
  String middle;
  String name;
  String id;
  String fileType;

  PicArr(
      {this.small, this.big, this.middle, this.name, this.id, this.fileType});

  PicArr.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    big = json['big'];
    middle = json['middle'];
    name = json['name'];
    id = json['id'];
    fileType = json['fileType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['big'] = this.big;
    data['middle'] = this.middle;
    data['name'] = this.name;
    data['id'] = this.id;
    data['fileType'] = this.fileType;
    return data;
  }
}

class SheshiArr {
  int isHave;
  String name;
  String id;
  String iconUrl;
  int type;

  SheshiArr({this.isHave, this.name, this.id, this.iconUrl, this.type});

  SheshiArr.fromJson(Map<String, dynamic> json) {
    isHave = json['isHave'];
    name = json['name'];
    id = json['id'];
    iconUrl = json['iconUrl'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isHave'] = this.isHave;
    data['name'] = this.name;
    data['id'] = this.id;
    data['iconUrl'] = this.iconUrl;
    data['type'] = this.type;
    return data;
  }
}

class HiArea {
  String name;
  String id;

  HiArea({this.name, this.id});

  HiArea.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}

class HiCity {
  String quan;
  String cityCode;
  String name;
  String id;
  String jian;

  HiCity({this.quan, this.cityCode, this.name, this.id, this.jian});

  HiCity.fromJson(Map<String, dynamic> json) {
    quan = json['quan'];
    cityCode = json['cityCode'];
    name = json['name'];
    id = json['id'];
    jian = json['jian'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quan'] = this.quan;
    data['cityCode'] = this.cityCode;
    data['name'] = this.name;
    data['id'] = this.id;
    data['jian'] = this.jian;
    return data;
  }
}

class RoomTypeArr {
  double roomTypeArea;
  HuXing huXing;
  ZhuangXiu zhuangXiu;
  String roomTypeName;
  String roomTypeIntro;
  double minZujin;
  int shi;
  double minPrice;
  double maxMianji;
  int ting;
  PicObj picObj;
  String id;
  double rentPrice;
  double minMianji;
  String iosRoomTypeArea;

  RoomTypeArr(
      {this.roomTypeArea,
      this.huXing,
      this.zhuangXiu,
      this.roomTypeName,
      this.roomTypeIntro,
      this.minZujin,
      this.shi,
      this.minPrice,
      this.maxMianji,
      this.ting,
      this.picObj,
      this.id,
      this.rentPrice,
      this.minMianji,
      this.iosRoomTypeArea});

  RoomTypeArr.fromJson(Map<String, dynamic> json) {
    roomTypeArea = json['roomTypeArea'];
    huXing =
        json['huXing'] != null ? new HuXing.fromJson(json['huXing']) : null;
    zhuangXiu = json['zhuangXiu'] != null
        ? new ZhuangXiu.fromJson(json['zhuangXiu'])
        : null;
    roomTypeName = json['roomTypeName'];
    roomTypeIntro = json['roomTypeIntro'];
    minZujin = json['minZujin'];
    shi = json['shi'];
    minPrice = json['minPrice'] as double;
    maxMianji = json['maxMianji'] as double;
    ting = json['ting'];
    picObj =
        json['picObj'] != null ? new PicObj.fromJson(json['picObj']) : null;
    id = json['id'];
    rentPrice = json['rentPrice'] as double;
    minMianji = json['minMianji'] as double;
    iosRoomTypeArea = json['iosRoomTypeArea'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roomTypeArea'] = this.roomTypeArea;
    if (this.huXing != null) {
      data['huXing'] = this.huXing.toJson();
    }
    if (this.zhuangXiu != null) {
      data['zhuangXiu'] = this.zhuangXiu.toJson();
    }
    data['roomTypeName'] = this.roomTypeName;
    data['roomTypeIntro'] = this.roomTypeIntro;
    data['minZujin'] = this.minZujin;
    data['shi'] = this.shi;
    data['minPrice'] = this.minPrice;
    data['maxMianji'] = this.maxMianji;
    data['ting'] = this.ting;
    if (this.picObj != null) {
      data['picObj'] = this.picObj.toJson();
    }
    data['id'] = this.id;
    data['rentPrice'] = this.rentPrice;
    data['minMianji'] = this.minMianji;
    data['iosRoomTypeArea'] = this.iosRoomTypeArea;
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

class PicObj {
  String small;
  String big;
  String middle;
  String name;
  String id;
  String fileType;

  PicObj(
      {this.small, this.big, this.middle, this.name, this.id, this.fileType});

  PicObj.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    big = json['big'];
    middle = json['middle'];
    name = json['name'];
    id = json['id'];
    fileType = json['fileType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['big'] = this.big;
    data['middle'] = this.middle;
    data['name'] = this.name;
    data['id'] = this.id;
    data['fileType'] = this.fileType;
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

