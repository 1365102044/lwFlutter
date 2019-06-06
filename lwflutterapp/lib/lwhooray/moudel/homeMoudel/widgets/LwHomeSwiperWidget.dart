import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:lwflutterapp/lwhooray/moudel/baseMoudel/lwUtils.dart';


class lwSwiperModel{
  String picUrl;
  lwSwiperModel(this.picUrl);
}

/// 轮播图
Widget LwSwiperWidget (BuildContext context,List<lwSwiperModel>bannerList){
  Widget widget;

  widget = bannerList.length >0 ? Swiper(
    itemCount: bannerList.length,
    scrollDirection: Axis.horizontal,
    loop: true,
    duration: 500,
    autoplay: true,
    itemBuilder: (BuildContext context,int index){
      return lwImageWithNetWork(bannerList[index].picUrl);
    },
    pagination: SwiperPagination(
      builder: DotSwiperPaginationBuilder(
        color: Colors.green,
        activeColor: Colors.yellow,
        size: 5.0,
        activeSize: 5.0,
        space: 5.0,
      )
    ),
  ):Container(
    height: 150.0,
  );
  return Container(
    child: widget,
    height: 150.0,
  );
}
