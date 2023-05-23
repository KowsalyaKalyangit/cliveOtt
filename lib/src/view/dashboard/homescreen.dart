// import 'package:cliveott/src/view/dashboard/homepage.dart';
// import 'package:cliveott/src/view/live/clive_tabs.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_windowmanager/flutter_windowmanager.dart';
// import 'package:get/get.dart';

// import '../../../utils/colors.dart';

// import '../../../utils/common_function/helper_class.dart';
// import '../login/login_page.dart';
// import 'image_slider.dart';
// import 'sliding_banner.dart';

// class Homescreen extends StatefulWidget {
//   const Homescreen({super.key});

//   @override
//   State<Homescreen> createState() => _HomescreenState();
// }

// class _HomescreenState extends State<Homescreen> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//   Future<void> disableScreenShot() async {
//     await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
//   }

//   @override
//   void initState() {
//     disableScreenShot();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: Helper.of(context).onWillPop,
//       child: Scaffold(
//           key: _scaffoldKey,
//           drawer: Drawer(
//             backgroundColor: black,
//             child: Column(children: [
//               UserAccountsDrawerHeader(
//                 decoration: BoxDecoration(color: black),
//                 accountName: Text(
//                   "CLive OTT",
//                   style: TextStyle(fontSize: 18),
//                 ),
//                 accountEmail: Text(
//                   "Watch now",
//                   style: TextStyle(color: Colors.red[900]),
//                 ),
//                 //currentAccountPictureSize: Size.square(50),
//                 currentAccountPicture: CircleAvatar(
//                   backgroundColor: black,
//                   backgroundImage: AssetImage('assets/images/clive.png'),
//                 ),
//               ),
//               ListTile(
//                 leading: const Icon(
//                   Icons.home,
//                   color: screenbackground,
//                 ),
//                 title: InkWell(
//                   focusColor: Colors.blue,
//                   onTap: () {
//                     Get.back();
//                     Get.to(Homescreen());
//                   },
//                   child: Text(
//                     ' Home ',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//               ListTile(
//                 leading: const Icon(
//                   Icons.movie,
//                   color: screenbackground,
//                 ),
//                 title: InkWell(
//                   focusColor: Colors.blue,
//                   onTap: () {
//                     Get.back();
//                   },
//                   child: Text(
//                     'Movies',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//               ListTile(
//                 leading:
//                     const Icon(Icons.sports_baseball, color: screenbackground),
//                 title: InkWell(
//                   focusColor: Colors.blue,
//                   onTap: () {
//                     Get.back();
//                   },
//                   child: Text(
//                     'Sports',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//               ListTile(
//                 leading: const Icon(
//                   Icons.live_tv,
//                   color: screenbackground,
//                 ),
//                 title: InkWell(
//                   focusColor: Colors.blue,
//                   onTap: () {
//                     Get.back();
//                     Get.to(HomeScreen());
//                   },
//                   child: Text(
//                     'Live Tv',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//               ListTile(
//                 leading: const Icon(
//                   Icons.settings,
//                   color: screenbackground,
//                 ),
//                 title: InkWell(
//                   focusColor: Colors.blue,
//                   onTap: () {
//                     Get.back();
//                   },
//                   child: Text(
//                     'Settings',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//               ListTile(
//                 leading: const Icon(
//                   Icons.login,
//                   color: screenbackground,
//                 ),
//                 title: InkWell(
//                   focusColor: Colors.blue,
//                   onTap: () {
//                     Get.to(LoginPage());
//                   },
//                   child: Text(
//                     'Login ',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),

//                 //UserAccountDrawerHeader
//               )
//             ]),
//           ),
//           appBar: AppBar(
//             backgroundColor: Colors.black.withOpacity(0.2),
//             title: Text('Home'),
//             leading: InkWell(
//                 focusColor: Colors.red,
//                 onTap: () {
//                   _scaffoldKey.currentState!.openDrawer();
//                 },
//                 child: Icon(Icons.list)),
//             centerTitle: true,
//             actions: [
//               Padding(
//                 padding: const EdgeInsets.only(right: 18.0, top: 10),
//                 child: Icon(
//                   Icons.search,
//                   size: 30,
//                 ),
//               )
//             ],
//           ),
//           body: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CarouselDemo(),
//                 SizedBox(
//                   height: 10.0.h,
//                 ),
//                 HomePage()
//               ],
//             ),
//           )),
//     );
//   }
// }

import 'package:cliveott/src/view/live/lifesstyle/lifestyle_page.dart';
import 'package:cliveott/src/view/live/movies/movie.dart';
import 'package:cliveott/src/view/live/music_live.dart';
import 'package:cliveott/src/view/live/news_page.dart';
import 'package:cliveott/src/view/live/others_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/colors.dart';

import '../../../utils/common_function/constants.dart';
import '../../../utils/textstyles.dart';
import '../../controller/force_update_controller.dart';
import '../dashboard/sliding_banner.dart';
import '../live/devotional/devotional_page.dart';
import '../live/entertainment.dart';
import '../live/live_channels_only.dart';
import '../live/premium/premium.dart';
import '../live/religious/religious.dart';
import '../login/login_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double? _progress;
  var url1 =
      'https://templates.cherritech.us/cherri-construction-template/assets/apk/app-release.apk';
  ForceUpdate forceUpdatecontroller = Get.put(ForceUpdate());
  String? _version;
  String? _buildNumber;
  String? _buildSignature;
  String? _appName;
  String? _packageName;
  String? _installerStore;
  _launchURL() async {
    final Uri url = Uri.parse(
        'https://templates.cherritech.us/cherri-construction-template/assets/apk/app-release.apk');
    if (!await launchUrl(url)) {
      print(url);
      throw Exception('Could not launch $url');
    }
  }

  @override
  void initState() {
    forceUpdatecontroller.getGameController();
    super.initState();
    _getAppVersion();
  }

  showdialogFunc() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          "Update Clive OTT?",
          style: heading,
        ),
        content: Text(
          '''Clive recommends that you update to the latest version. You can keep using this app using this app while downloading the update''',
          style: subcategorystyle,
        ),
        actions: <Widget>[
          _progress != null
              ? const CircularProgressIndicator()
              : InkWell(
                
                  onTap: () {
                    FileDownloader.downloadFile(
                        url: url1.trim(),
                        onProgress: (name, progress) {
                          setState(() {
                            _progress = progress;
                          });
                        },
                        onDownloadCompleted: (value) {
                          print('path  $value ');
                          setState(() {
                            _progress = null;
                          });
                        });
                  },
                  child: Container(
                    height: 40,
                    width: 85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xff01875f)
                    ),
                    child: Center(child: Text('update',style: categorytext,))),
                )
        ],
      ),
    );
  }

  void _getAppVersion() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();

    final version = packageInfo.version;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var version1 = sharedPreferences.getString(Constants.version);
    // final buildNumber = packageInfo.buildNumber;
    // final buildSignature = packageInfo.buildSignature;
    // final appName = packageInfo.appName;
    // final packageName = packageInfo.packageName;
    // final installerStore = packageInfo.installerStore;

    setState(() {
      _version = version;
      // _buildNumber = buildNumber;
      // _buildSignature = buildSignature;
      // _appName = appName;
      // _packageName = packageName;
      // _installerStore = installerStore;

      if (_version.toString() != version1.toString()) {
        showdialogFunc();
        print(version1);
        print(_version.toString());
      } else {
        print('printeyyy');
        print(forceUpdatecontroller.orderID.toString());
      }
    });
  }

  var selectedindex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
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
                focusColor: Colors.blue.withOpacity(0.4),
                onTap: () {
                  Get.back();
                  //Get.to(Homescreen());
                },
                child: Container(
                  width: 30.0.w,
                  height: 30.h,
                  child: Text(
                    ' Home ',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.live_tv,
                color: screenbackground,
              ),
              title: InkWell(
                focusColor: Colors.blue.withOpacity(0.4),
                onTap: () {
                  Get.back();
                  Get.to(LiveChannels());
                },
                child: Container(
                  width: 30.0.w,
                  height: 30.h,
                  child: Text(
                    'Live Tv',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.login,
                color: screenbackground,
              ),
              title: InkWell(
                focusColor: Colors.blue.withOpacity(0.4),
                onTap: () {
                  Get.to(LoginPage());
                },
                child: Container(
                  width: 30.0.w,
                  height: 30.h,
                  child: Text(
                    'Login ',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              //UserAccountDrawerHeader
            ),
            // ListTile(
            //   leading: const Icon(
            //     Icons.login,
            //     color: screenbackground,
            //   ),
            //   title: InkWell(
            //     focusColor: Colors.blue.withOpacity(0.4),
            //     onTap: () {

            //     },
            //     child: Container(
            //       width: 30.0.w,
            //       height: 30.h,
            //       child: Text(
            //         'Appversion ',
            //         style: TextStyle(color: Colors.white),
            //       ),
            //     ),
            //   ),

            //   //UserAccountDrawerHeader
            // )
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/images/clive.png',
                height: 30.0.w,
              ),

              InkWell(
                  onTap: () {
                    setState(() {
                      selectedindex = 0;
                    });
                  },
                  focusColor: Colors.blue.withOpacity(0.4),
                  child: Container(
                      width: 80.0.w,
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
                      width: 80.0.w, child: Center(child: Text('Live Tv')))),
              InkWell(
                  onTap: () {
                    setState(() {
                      selectedindex = 2;
                    });
                  },
                  focusColor: Colors.blue.withOpacity(0.4),
                  child: Container(
                      width: 80.0.w, child: Center(child: Text('Movies')))),
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
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/background.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CarouselDemo(),
                        Text('Version : ${_version ?? '-'}'),
                        Obx(() => Text(forceUpdatecontroller.orderID.value)),
                        Premium(),
                        EntertainmentPage(),
                        // MusicLivePage(),
                        NewsPage(),
                        // OthersPage()
                      ],
                    ),
                  ),
                ),
              )
            : selectedindex == 1
                ? SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/category/background.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
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
                            Religious(),
                            DevotionalPage(),
                            OthersPage()
                          ],
                        ),
                      ),
                    ),
                  )
                : MoviesPage());
  }
}
