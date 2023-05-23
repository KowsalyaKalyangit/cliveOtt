import 'package:carousel_slider/carousel_slider.dart';
import 'package:cliveott/src/view/dashboard/slider_videos.dart';
import 'package:cliveott/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../subscribe/subscription_page.dart';

// final List<String> imgList = [
//   'https://cherritech.us/ott/upload/source/6.png',
//   'https://cherritech.us/ott/upload/source/2-slider.png',
//   'https://cherritech.us/ott/upload/source/1.png',
//   'https://cherritech.us/ott/upload/source/6.png',
//   'https://cherritech.us/ott/upload/source/2-slider.png',
//   'https://cherritech.us/ott/upload/source/1.png'
// ];

final List<String> imgList = [
  'assets/category/rajini.jpg',
  'assets/category/rajini1.jpg',
  'assets/category/rajini2.jpg',
  'assets/category/rajini3.jpg',
  'assets/category/rajini4.jpg',
  'assets/category/rajini5.jpg'
];
int _current = 0;
var selectedindex = 0;
final themeMode = ValueNotifier(2);

class CarouselDemo extends StatefulWidget {
  @override
  State<CarouselDemo> createState() => _CarouselDemoState();
}

class _CarouselDemoState extends State<CarouselDemo> {
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) => Column(children: <Widget>[
        CarouselSlider(
          items: imgList.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return InkWell(
                  focusColor: Colors.red,
                  onTap: () {
                    Get.to(SliderVideos(
                      index: selectedindex,
                    ));

                    // Get.to(SubscriptionPage());
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          child: Image.asset(
                            i,
                            fit: BoxFit.fill,
                          ),
                        ),
                      )),
                );
              },
            );
          }).toList(),
          options: CarouselOptions(
            height: 320.0.h,
            aspectRatio: 16 / 9,
            viewportFraction: 0.6,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.2,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                selectedindex = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
                onTap: () => buttonCarouselController.animateToPage(entry.key),
                child: Container(
                  width: 10.00.h,
                  height: 10.00.w,
                  margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.black
                              : Colors.black)
                          .withOpacity(selectedindex == entry.key ? 0.9 : 0.4)
                      // color: selectedindex == entry.key
                      //     ? Colors.grey
                      //     : Colors.black),
                      ),
                ));
          }).toList(),
        ),
      ]);
}
