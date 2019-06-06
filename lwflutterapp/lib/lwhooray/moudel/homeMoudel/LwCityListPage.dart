import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lwflutterapp/lwhooray/model/model.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwBaseModel.dart';

import 'model/LwCityListModel.dart';
import 'package:lpinyin/lpinyin.dart';

class LwCityPage extends StatefulWidget {
  List<CityList> cityList = [];
  LwCityPage(this.cityList);
  @override
  _LwCityPageState createState() => _LwCityPageState();
}

class _LwCityPageState extends State<LwCityPage> {
  List<CityList> _cityInfors = [];
  @override
  void initState() {
    super.initState();
    List<String> temPinyins = [];
    Map<String, List<CityList>> temMap = {};
    if (widget.cityList != null && widget.cityList.length != 0) {
      widget.cityList.forEach((CityList model) {
        String firstPinYin = PinyinHelper.getFirstWordPinyin(model.name);
        if (firstPinYin.length > 0) {
          String oneStr = firstPinYin.substring(0, 1);
          temPinyins.add(oneStr);
          if (temMap[oneStr].runtimeType != List) {
            temMap[oneStr] = [];
          }
          (temMap[oneStr] as List).add(model);
        }
      });
    }

    /// 排序
    temPinyins.sort((s1, s2) => s1.compareTo(s2));
    setState(() {
      _cityInfors.insert(0, CityList(name: '当前城市：北京', type: 1));
      temPinyins.forEach((key) {
        _cityInfors.add(CityList(name: key, type: 1));
        _cityInfors.addAll(temMap[key]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: lwAppBar('城市列表'),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
        child: ListView.builder(
          itemCount: _cityInfors.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    alignment: Alignment.centerLeft,
                    height: 40,
                    child: Text(_cityInfors[index].name),
                    color: Colors.white,
                  ),
                  onTap: () {
                    CityList model = _cityInfors[index];
                    if (model.type == 1) {
                      return;
                    }
                    print('**********点击了：${model.name}');
                    print('**********点击了：${context}');
                    lwNotification(model).dispatch(context);
                    Navigator.pop(context,model);
                  },
                ),
                Divider(),
              ],
            );
          },
        ),
      ),
    );
  }
}


class lwNotification extends Notification{
  CityList cityModel;
  lwNotification(this.cityModel);
}