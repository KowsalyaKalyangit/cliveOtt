import 'package:cliveott/src/view/dashboard/categorylist.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/textstyles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Container(
            height: 30.0.h,
            width: 1000.0.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Upcoming Shows',
                  style: toptitleStylebold,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 3.0.h,
        ),
        Categorylist(),
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Container(
            height: 30.0.h,
            width: 1000.0.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Upcoming Shows',
                  style: toptitleStylebold,
                ),
              ],
            ),
          ),
        ),
        Categorylist()
      ],
    );
  }
}
