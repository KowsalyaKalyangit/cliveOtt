import 'package:cliveott/src/view/subscribe/payment_page.dart';
import 'package:cliveott/src/view/subscribe/subscribe_home_page.dart';
import 'package:cliveott/utils/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  var selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Subscribe'),
      ),
      body: Column(children: [
        SizedBox(
          height: 5.0.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
                focusColor: Colors.blue,
                onTap: () {
                  setState(() {
                    selectedindex = 0;
                    print('ccc');
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 40.0.h,
                    width: 100.0.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[Colors.blue, Colors.black]),
                    ),
                    child: Center(
                      child: Text('Premium',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.white)),
                    ),
                  ),
                )),
            InkWell(
                focusColor: Colors.blue,
                onTap: () {
                  setState(() {
                    selectedindex = 1;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 40.0.h,
                    width: 100.0.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[Colors.blue, Colors.black]),
                    ),
                    child: Center(
                      child: Text('Basics',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.white)),
                    ),
                  ),
                )),
          ],
        ),
        selectedindex == 0
            ? Padding(
                padding: const EdgeInsets.only(left: 0.0, top: 10.0),
                child: Container(
                  height: 500.0.h,

                  //  color: Colors.red,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.block),
                        title: Text('Ad free viewing'),
                      ),
                      ListTile(
                        leading: Icon(Icons.tv),
                        title: Text('Access on mobile + Large screens '),
                      ),
                      ListTile(
                        leading: Icon(Icons.sports_baseball),
                        title:
                            Text('Adds free movies and shows (experts sports)'),
                      ),
                      ListTile(
                        leading: Icon(Icons.device_hub),
                        title:
                            Text('Number of 4 devices that can be logged in'),
                      ),
                      ListTile(
                        leading: Icon(Icons.video_call),
                        title: Text('Max video quality- full HD 2160p'),
                      ),
                      ListTile(
                        leading: Icon(Icons.audiotrack),
                        title: Text('Min audio quality-Dolby Atmos'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                              focusColor: Colors.blue,
                              onTap: () {
                                setState(() {
                                  // selectedindex = 0;
                                  print('ccc');
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 40.0.h,
                                  width: 100.0.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(color: Colors.white)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Premium',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white)),
                                      Text('\u{20B9}899/year',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white)),
                                    ],
                                  ),
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 15.0.h,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(PaymentPage());
                        },
                        child: Container(
                          height: 40.0.h,
                          width: 300.0.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: <Color>[Colors.blue, Colors.black]),
                          ),
                          child: Center(
                              child: Text(
                            'Continue with super',
                            style: toptitleStylebold,
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(left: 0.0, top: 10.0),
                child: Container(
                  height: 500.0.h,

                  //  color: Colors.red,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.block),
                        title: Text('Watch with advertisement'),
                      ),
                      ListTile(
                        leading: Icon(Icons.tv),
                        title: Text('Access restricted to one mobile only '),
                      ),
                      ListTile(
                        leading: Icon(Icons.sports_baseball),
                        title: Text('No offine download'),
                      ),
                      ListTile(
                        leading: Icon(Icons.device_hub),
                        title:
                            Text('Number of 2 devices that can be logged in'),
                      ),
                      ListTile(
                        leading: Icon(Icons.video_call),
                        title: Text('Max video quality- full HD 1080p'),
                      ),
                      ListTile(
                        leading: Icon(Icons.audiotrack),
                        title: Text('Min audio quality- Dolby Atmos'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                              focusColor: Colors.blue,
                              onTap: () {
                                setState(() {
                                  // selectedindex = 1;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 40.0.h,
                                  width: 100.0.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(color: Colors.white)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Premium',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white)),
                                      Text('\u{20B9}1499/year',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white)),
                                    ],
                                  ),
                                ),
                              )),
                          InkWell(
                              focusColor: Colors.blue,
                              onTap: () {
                                setState(() {
                                  // selectedindex = 1;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 40.0.h,
                                  width: 100.0.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(color: Colors.white)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Premium',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white)),
                                      Text('\u{20B9}299/year',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white)),
                                    ],
                                  ),
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 15.0.h,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(PaymentPage());
                        },
                        child: Container(
                          height: 40.0.h,
                          width: 300.0.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: <Color>[Colors.blue, Colors.black]),
                          ),
                          child: Center(
                              child: Text(
                            'Continue with Premium',
                            style: toptitleStylebold,
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              )
      ]),
    );
  }
}
