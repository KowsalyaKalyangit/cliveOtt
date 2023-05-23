import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/textstyles.dart';
import '../category/category_videos.dart';

import '../category/categoryone_list.dart';

class Categorylist extends StatefulWidget {
  const Categorylist({super.key});

  @override
  State<Categorylist> createState() => _CategorylistState();
}

class _CategorylistState extends State<Categorylist> {
  var movieList = [
    'https://cherritech.us/ott/upload/source/poster-do.jpg',
    'https://cherritech.us/ott/upload/source/thumbnail/encanto.jpg',
    'https://cherritech.us/ott/upload/source/red .jpg',
    'https://cherritech.us/ott/upload/source/SPIDER-MAN_ .jpg',
    'https://cherritech.us/ott/upload/source/thumbnail/Disney and Pixar’s.jpg',
    'https://cherritech.us/ott/upload/source/thumbnail/black Adam.jpg',
    'https://cherritech.us/ott/upload/source/fanstatic Beast.jpg',
    'https://cherritech.us/ott/upload/source/poster-do.jpg',
    'https://cherritech.us/ott/upload/source/thumbnail/encanto.jpg',
  ];
  var cateList = [
    'https://cherritech.us/ott/upload/source/Ms.Marvel.png',
    'https://cherritech.us/ott/upload/source/bean vs bee.jpg',
    'https://cherritech.us/ott/upload/source/vikings.jpg',
    'https://cherritech.us/ott/upload/source/Ms.Marvel.png',
    'https://cherritech.us/ott/upload/source/bean vs bee.jpg',
    'https://cherritech.us/ott/upload/source/vikings.jpg',
  ];
  var cateNameList = [
    'Ms. Marvel',
    'Man vs Bee',
    'Vikings',
    'Ms. Marvel',
    'Man vs Bee',
    'Vikings',
  ];
  var movieNameList = [
    'Doctor Stranger',
    'Encanto',
    'Turning Red',
    'Spiderman',
    'Luca',
    'Black Adam',
    'Fantastic Beasts',
    'Doctor Stranger',
    'Encanto',
  ];
  var selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 160.0.h,
          // width: 1000.0.w,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cateList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  focusColor: Colors.blue,
                  onTap: () {
                    Get.to(CategoryVideos(
                      index: index,
                    ));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(cateList[index],
                              height: 120.0.h,
                              width: 180.0.w,
                              fit: BoxFit.fill),
                        ),
                      ),
                      SizedBox(
                        height: 1.0.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          cateNameList[index],
                          style: toptitleStylebold,
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),

        //2nd category
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Container(
            height: 30.0.h,
            width: 1000.0.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Latest Movies',
                  style: toptitleStylebold,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10.0.h,
        ),
        Container(
          height: 270.0.h,
          width: 1000.0.w,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movieList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  focusColor: Colors.blue,
                  onTap: () {
                    Get.to(CategoryVideosone(index: index));
                  },
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              movieList[index],
                              height: 200.0.h,
                              // width: 130.0.w,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movieNameList[index],
                                style: categoryitems,
                              ),
                              Text(
                                '2hrs 3mins',
                                style: categoryitems,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
