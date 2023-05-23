import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';

class CategoryListData extends StatefulWidget {
  final int? index;
  CategoryListData({super.key, this.index});

  @override
  State<CategoryListData> createState() => _CategoryListDataState();
}

class _CategoryListDataState extends State<CategoryListData> {
  var movieList = [
    'assets/images/movies/movie1.jpg',
    'assets/images/movies/movie2.jpg',
    'assets/images/movies/movie3.jpg',
    'assets/images/movies/movie4.jpg',
    'assets/images/movies/movie5.jpg',
    'assets/images/movies/movie6.jpg',
    'assets/images/movies/movie7.jpg',
    'assets/images/movies/movie1.jpg',
    'assets/images/movies/movie2.jpg',
    'assets/images/movies/movie3.jpg',
  ];
  var cateList = [
    'assets/images/movies/cate2.jpg',
    'assets/images/movies/cate3.jpg',
    'assets/images/movies/cate4.jpg',
    'assets/images/movies/cate1.jpg',
    'assets/images/movies/cate6.jpg',
    'assets/images/movies/cate5.jpg',
    'assets/images/movies/cate7.jpg',
    'assets/images/movies/cate2.jpg',
    'assets/images/movies/cate3.jpg',
    'assets/images/movies/cate4.jpg',
  ];
  var cateNameList = [
    'Encanto',
    'Frozen',
    'Luca',
    '300',
    'Black Adams',
    'Aquaman',
    'Man vs Bee',
    'Encanto',
    'Frozen',
    'Luca',
  ];
  var movieNameList = [
    '300',
    'Man vs Bee',
    'Aquaman',
    'Black Adams',
    'Encanto',
    'Luca',
    'Frozen',
    '300',
    'Man vs Bee',
    'Aquaman',
  ];

  @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 220.0.h,
            width: 1000.w,
            color: con2,
          ),
          InkWell(
            focusColor: Colors.blue,
            onTap: () {},
            child: Container(
              height: 250.0.h,
              // width: 1000.0.w,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cateList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              cateList[index],
                              // height: 150.0.h,
                              // width: 150.0.w,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.0.h,
                        ),
                        Text(
                          'Trailer',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            cateNameList[index],
                            // style: toptitleStylebold,
                          ),
                        )
                      ],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
