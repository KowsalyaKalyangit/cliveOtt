import 'package:cliveott/src/view/live/music_live.dart';
import 'package:cliveott/src/view/live/news_page.dart';
import 'package:cliveott/src/view/live/others_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../utils/colors.dart';

import '../dashboard/sliding_banner.dart';
import '../login/login_page.dart';
import 'entertainment.dart';
import 'lifesstyle/lifestyle_page.dart';
import 'live_channels_only.dart';

class CliveTabs extends StatefulWidget {
  const CliveTabs({super.key});

  @override
  State<CliveTabs> createState() => _CliveTabsState();
}

class _CliveTabsState extends State<CliveTabs> {
  var selectedindex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color.fromARGB(255, 197, 201, 204),
        drawer: Drawer(
          backgroundColor: black,
          child: Column(children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: black),
              accountName: Text(
                "CLive OTT",
                style: TextStyle(fontSize: 18),
              ),
              accountEmail: Text(
                "Watch now",
                style: TextStyle(color: Colors.red[900]),
              ),
              //currentAccountPictureSize: Size.square(50),
              currentAccountPicture: CircleAvatar(
                backgroundColor: black,
                backgroundImage: AssetImage('assets/images/clive.png'),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: screenbackground,
              ),
              title: InkWell(
                focusColor: Colors.blue,
                onTap: () {
                  Get.back();
                  //Get.to(Homescreen());
                },
                child: Text(
                  ' Home ',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.live_tv,
                color: screenbackground,
              ),
              title: InkWell(
                focusColor: Colors.blue,
                onTap: () {
                  Get.back();
                  Get.to(LiveChannels());
                },
                child: Text(
                  'Live Tv',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.login,
                color: screenbackground,
              ),
              title: InkWell(
                focusColor: Colors.blue,
                onTap: () {
                  Get.to(LoginPage());
                },
                child: Text(
                  'Login ',
                  style: TextStyle(color: Colors.white),
                ),
              ),

              //UserAccountDrawerHeader
            )
          ]),
        ),
        appBar: AppBar(
          backgroundColor: black,
          leading: InkWell(
              focusColor: Colors.red,
              onTap: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              child: Icon(Icons.list)),
          title: Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/images/clive.png',
                height: 30.0.w,
              ),
              SizedBox(
                width: 20.0.w,
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      selectedindex = 0;
                    });
                  },
                  focusColor: Colors.blue.withOpacity(0.4),
                  child: Container(
                      width: 100.0.w,
                      child: Center(
                          child: Text(
                        'Home',
                      )))),
              InkWell(
                  onTap: () {
                    setState(() {
                      selectedindex = 1;
                    });
                  },
                  focusColor: Colors.blue.withOpacity(0.4),
                  child: Container(
                      width: 100.0.w, child: Center(child: Text('Live TV')))),
              // InkWell(
              //     onTap: () {},
              //     focusColor: Colors.blue.withOpacity(0.4),
              //     child: Container(
              //         height: 50.0.h,
              //         width: 50.0.w,
              //         child: Center(child: Text('Home')))),
              // InkWell(
              //     onTap: () {},
              //     focusColor: Colors.blue.withOpacity(0.4),
              //     child: Container(
              //         height: 50.0.h,
              //         width: 50.0.w,
              //         child: Center(child: Text('Home')))),
            ],
          ),
          //centerTitle: true,
        ),
        body: selectedindex == 0
            ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CarouselDemo(),
                      EntertainmentPage(),
                      MusicLivePage(),
                      NewsPage(),
                      OthersPage()
                    ],
                  ),
                ),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EntertainmentPage(),
                      MusicLivePage(),
                      NewsPage(),
                      LifeStylePage(),
                      OthersPage()
                    ],
                  ),
                ),
              ));
  }
}
