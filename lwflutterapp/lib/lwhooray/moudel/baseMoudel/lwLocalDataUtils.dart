import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lwflutterapp/lwhooray/moudel/loginMoudel/LwLogin.dart';
import 'package:lwflutterapp/lwhooray/moudel/loginMoudel/model/loginModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// token
final String ACCOUNT_INFOR_TOKE_LOCAL_DATA_KEY = 'ACCOUNT_TOKE_LOCAL_DATA_KEY';
/// phone
final String ACCOUNT_INFOR_PHONE_LOCAL_DATA_KEY = 'ACCOUNT_INFOR_PHONE_LOCAL_DATA_KEY';
/// userID
final String ACCOUNT_INFOR_USERID_LOCAL_DATA_KEY = 'ACCOUNT_INFOR_USERID_LOCAL_DATA_KEY';
/// 密码
final String ACCOUNT_INFOR_PASSWORD_LOCAL_DATA_KEY = 'ACCOUNT_INFOR_PASSWORD_LOCAL_DATA_KEY';
/// nickname
final String ACCOUNT_INFOR_NICKNAME_LOCAL_DATA_KEY = 'ACCOUNT_INFOR_NICKNAME_LOCAL_DATA_KEY';
/// 用户切换到的城市id
final String ACCOUNT_CURRENT_CITY_ID_KEY = 'ACCOUNT_LOCAL_CITY_ID_KEY';
/// 用户切换到的城市 名字
final String ACCOUNT_CURRENT_CITY_NAME_KEY = 'ACCOUNT_LOCAL_CITY_NAME_KEY';

/// 保存本地数据
class lwLocalDataUtils {
  
  /// 保存登录后的账户信息
  static saveAccountInforWithLogin(LwloginResultModel model){
    lwLocalDataUtils.saveData(ACCOUNT_INFOR_TOKE_LOCAL_DATA_KEY,model.token);
    lwLocalDataUtils.saveData(ACCOUNT_INFOR_PHONE_LOCAL_DATA_KEY,model.phone);
    lwLocalDataUtils.saveData(ACCOUNT_INFOR_USERID_LOCAL_DATA_KEY,model.customid);
    lwLocalDataUtils.saveData(ACCOUNT_INFOR_PASSWORD_LOCAL_DATA_KEY,model.password);
    lwLocalDataUtils.saveData(ACCOUNT_INFOR_NICKNAME_LOCAL_DATA_KEY,model.nickname);
  }

  ///  保存数据 String,double,bool,int,List
  static saveData(String key, dynamic data) async {
    if(key == null || data == null) return;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (data.runtimeType == String) {
      sharedPreferences.setString(key, data as String);
    }else if(data.runtimeType == double){
      sharedPreferences.setDouble(key, data as double);
    }else if(data.runtimeType == bool){
      sharedPreferences.setBool(key, data as bool);
    }else if(data.runtimeType == int){
      sharedPreferences.setInt(key, data as int);
    }else if(data.runtimeType == List){
      sharedPreferences.setStringList(key, data as List);
    }
  } 

  static getData(String key,{dynamic valueType}) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // print('------valuetype:$valueType');
    if (valueType.runtimeType == String) {
      // print('--------1----${sharedPreferences.getString(key)}--------$key');
      // String value =  sharedPreferences.getString(key);
      return sharedPreferences.getString(key);
    }else{
      print('--------2');
      return sharedPreferences.getString(key);
    }
  }

  /// 是否登录
  Future<Null> isLoginStatue(BuildContext context) async{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      String account_token = sharedPreferences.getString(ACCOUNT_INFOR_TOKE_LOCAL_DATA_KEY);
      print('+++++++++account_token:$account_token');
      if (account_token != null && account_token != '') {
        print('========已登录登录：$context');
        // return true;
      }else{
        print('========未登录：$context');
        Navigator.push(context, MaterialPageRoute(
           builder: (context) => LwLoginPage(),
        ));
        
        // return false;
      }
  }

  /// 保存城市信息
  static saveCurrentCityInfor(String cityid,String cityname){
    lwLocalDataUtils.saveData(ACCOUNT_CURRENT_CITY_ID_KEY, cityid);
    lwLocalDataUtils.saveData(ACCOUNT_CURRENT_CITY_NAME_KEY, cityname);
  }
  /// 获取当前城市id
static Future<String> getCurrentCityId() async{
  String cityid = '';
   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    cityid =  sharedPreferences.getString(ACCOUNT_CURRENT_CITY_ID_KEY);
    if (cityid == null || cityid == '') {
      cityid = '';
    } 
  return cityid;
}

/// 获取当前城市名
static Future<String> getCurrentCityName() async{
  String cityname = '';
   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    cityname =  sharedPreferences.getString(ACCOUNT_CURRENT_CITY_NAME_KEY);
    print('++++++cityname+++++++befare$cityname');
    if (cityname == null || cityname == '') {
      cityname = '北京';
    } 
    print('++++++cityname++++++after+$cityname');
  return cityname;
}

}