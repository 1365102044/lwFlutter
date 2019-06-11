class lwProjectsInforModel {
  Result result;
  Status status;

  lwProjectsInforModel({this.result, this.status});

  lwProjectsInforModel.fromJson(Map<String, dynamic> json) {
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
  List<ListModel> list;

  Result({this.list});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = new List<ListModel>();
      json['list'].forEach((v) {
        list.add(new ListModel.fromJson(v));
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

class ListModel {
  String houseItemName;
  int itemStatus;
  String id;

  ListModel({this.houseItemName, this.itemStatus, this.id});

  ListModel.fromJson(Map<String, dynamic> json) {
    houseItemName = json['houseItemName'];
    itemStatus = json['itemStatus'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['houseItemName'] = this.houseItemName;
    data['itemStatus'] = this.itemStatus;
    data['id'] = this.id;
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

