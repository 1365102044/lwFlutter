
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:lwflutterapp/lwhooray/model/model.dart';

/// 轮播图
Widget SwiperWidget(BuildContext context,List<MyBanner> bannerlist){

  Widget widget;

  if (bannerlist.length == 0) {
    return Container();
  }

  widget = bannerlist.length > 0 ? new Swiper(
    itemCount: bannerlist.length,
    loop: true,
    autoplay: true,
    duration: 500,
    autoplayDelay: 5000,
    itemBuilder: (BuildContext context,int index){
      return new Image.network(bannerlist[index].image,fit: BoxFit.cover,);
    },
    /// 小圆点
    pagination: SwiperPagination(
      builder: DotSwiperPaginationBuilder(
        color: Colors.grey,
        activeColor: Colors.red,
        size: 7,
        activeSize: 7,
        space: 5,
      ),
    ),
  ):Container(
    height: 200,
  );
  /// 一定要设置高度
  return Container(
    child: widget,
    height: 200,
  );

}