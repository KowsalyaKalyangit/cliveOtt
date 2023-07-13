import 'package:chewie/chewie.dart';
import 'package:cliveott/src/view/category/category_like_videos.dart';
import 'package:cliveott/utils/colors.dart';
import 'package:cliveott/utils/responsive.dart';
import 'package:cliveott/utils/textstyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flick_video_player/flick_video_player.dart';

class MobileCategoryVideo extends StatefulWidget {
  const MobileCategoryVideo({super.key, this.tvurl, this.tvtitle});
  final String? tvurl;
  final String? tvtitle;

  @override
  State<MobileCategoryVideo> createState() => _MobileCategoryVideoState();
}

class _MobileCategoryVideoState extends State<MobileCategoryVideo> {
  FlickManager? flickManager;
  List addimage = [
    'assets/images/ads2.jpg',
  ];

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(
        widget.tvurl!,
      ),
    );
  }

  @override
  void dispose() {
    flickManager!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: black1,
        appBar: AppBar(
          backgroundColor: black,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10.0.wp, top: 2.0.hp),
              child: Icon(
                Icons.search,
                size: 25,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 5.0.wp, top: 2.0.hp),
              child: Icon(
                Icons.notifications,
                size: 25,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 25.0.hp,
                child: FlickVideoPlayer(
                  //  flickVideoWithControls: FlickPortraitControls(),
                  flickVideoWithControls: FlickVideoWithControls(
                    controls: FlickPortraitControls(
                      progressBarSettings: FlickProgressBarSettings(
                          height: 0, curveRadius: 0, handleRadius: 0),
                    ),
                  ),

                  flickManager: flickManager!,
                  preferredDeviceOrientationFullscreen: [
                    DeviceOrientation.landscapeRight
                  ],
                ),
              ),
              SizedBox(
                height: 2.0.hp,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Text(
                  widget.tvtitle.toString(),
                  style: GoogleFonts.ibmPlexSans(
                      textStyle: TextStyle(
                          letterSpacing: 0.2,
                          fontSize: 20.00,
                          color: screenbackground,
                          fontWeight: FontWeight.w600)),
                ),
              ),
              SizedBox(
                height: 1.0.hp,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.remove_red_eye,
                            color: screenbackground,
                            size: 20,
                          ),
                          Text(
                            '17 views',
                            style: categorytext,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      '|',
                      style: toptitleStylebold,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.access_time_rounded,
                            color: screenbackground,
                          ),
                          Text(
                            '1hr 51 mins',
                            style: toptitleStyle,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      '|',
                      style: toptitleStylebold,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/imdb.png',
                            width: 5.0.hp,
                          ),
                          // Text(
                          //   '4.8',
                          //   style: toptitleStyle,
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      '|',
                      style: toptitleStylebold,
                    ),
                    SizedBox(
                      width: 40.w,
                    ),
                    Container(
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.white.withOpacity(0.2),
                            child: Text(
                              '16 +',
                              style: datetimecolor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.0.hp,
              ),
              addimage.isEmpty
                  ? Container(
                      height: 0.0.hp,
                      color: Colors.black.withOpacity(0.2),
                    )
                  : Stack(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 25.0.hp,
                              child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: addimage.length,
                                  itemBuilder: ((context, index) {
                                    return Image.asset(
                                        addimage[index].toString());
                                  })),
                            )),
                        Positioned(
                            right: 5,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  addimage.removeAt(0);
                                });
                              },
                              child: addimage.isEmpty
                                  ? Container()
                                  : CircleAvatar(
                                      backgroundColor: Colors.amber[900],
                                      radius: 13,
                                      child: Icon(
                                        Icons.close,
                                        size: 20,
                                      ),
                                    ),
                            ))
                      ],
                    ),
              SizedBox(
                height: 1.0.hp,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '''The Madrigals are an extraordinary family who live hidden in the mountains of Colombia in a charmed place called the Encanto. The magic of the Encanto has blessed every child in the family with a unique gift -- every child except Mirabel.  
               ''',
                  style: categorytext,
                ),
              ),
              Container(
                height: 0.50.hp,
                width: 100.0.wp,
                color: Colors.white.withOpacity(0.1),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Container(
                  height: 0.50.hp,
                  width: 35.0.wp,
                  color: Colors.red,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('More Like Videos',
                    style: GoogleFonts.ibmPlexSans(
                      textStyle: TextStyle(
                          letterSpacing: 0.2,
                          fontSize: 16.00,
                          color: screenbackground,
                          fontWeight: FontWeight.w700),
                    )),
              ),
              CategoryLikeVideos()
            ],
          ),
        ));
  }
}

// String videoUrlLandscape =
//     "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4";
// String videoUrlPortrait =
//     'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4';
// String longVideo =
//     "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";

// String video720 =
//     "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_10mb.mp4";

// String video480 =
//     "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_10mb.mp4";

// String video240 =
//     "https://www.sample-videos.com/video123/mp4/240/big_buck_bunny_240p_10mb.mp4";
