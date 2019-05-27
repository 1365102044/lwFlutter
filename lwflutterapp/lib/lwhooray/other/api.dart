class LWAPI{
  /**
   * http://47.94.200.244:81/ 培训
   * https://pms.hntpsjwy.com/ 正式
   * http://192.168.1.221 开发
   */
  
  /// 正式环境
  static final String LW_API_PRODUCT_BASE_URL = 'https://pms.hntpsjwy.com/';
  /// 测试环境
  static final String LW_API_CESHI_BASE_URL = 'http://192.168.1.222/';


  /// API的base url
  static final String LW_API_BASE_URL = LW_API_PRODUCT_BASE_URL;
  /// 首页 banner (equipment:2) 设备（1.微信，2.APP）
  static final String HOME_BANNER_URL = 'v2/clientAPP/app/banner_promotion';
  /// 首页 推荐（房源、户型）（cityId：d94bba14-dec1-11e5-bcc3-00163e1c066c）
  static final String HOME_TUIJIAN_URL = 'v2/clientAPP/app/business_recommendation';
  /// 城市列表
  static final String HOME_CITY_DATA_LIST_URL = 'v2/clientAPP/app/get_city_list';

}
