import 'dart:async';

import 'package:cliveott/utils/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:video_player/video_player.dart';

import '../../../utils/colors.dart';
import '../../../utils/landscape.dart';
import '../category/category_content.dart';
import 'package:flutter/services.dart';
import 'package:is_tv/is_tv.dart';

class SliderVideos extends StatefulWidget {
  SliderVideos({
    super.key,
    this.index,
  });
  final int? index;
  // final String? name;

  @override
  State<SliderVideos> createState() => _SliderVideosState();
}

class _SliderVideosState extends State<SliderVideos> {
  VideoPlayerController? _controller;
  var selectedindex = 0;
  var url = [
    'https://cherritech.us/ott/upload/source/Ratatouille.mp4',
    "https://cherritech.us/ott/upload/source/Disneys Encanto _ Official Trailer.mp4",
    'https://cherritech.us/ott/upload/source/Marvel Studios Doctor Strange in the Multiverse of Madness _ Official Trailer.mp4',
    'https://cherritech.us/ott/upload/source/Ratatouille.mp4',
    "https://cherritech.us/ott/upload/source/Disneys Encanto _ Official Trailer.mp4",
    'https://cherritech.us/ott/upload/source/Marvel Studios Doctor Strange in the Multiverse of Madness _ Official Trailer.mp4',
  ];

  List videosfiles = [
    'assets/videos/video2.mp4',
    'assets/videos/video1.mp4',
    'assets/videos/video3.mp4',
    'assets/videos/video2.mp4',
    'assets/videos/video2.mp4',
    'assets/videos/video1.mp4',
  ];
  bool? _isTV;
  final _isTVPlugin = IsTV();
  int _buttonClickCount = 0;
  bool _showWidget = false;
  Future<void> initPlatformState() async {
    bool? isTV;

    try {
      isTV = await _isTVPlugin.check() ?? false;
    } on PlatformException {
      isTV = false;
    }

    if (!mounted) return;

    setState(() {
      _isTV = isTV ?? false;
    });
  }

  void _handleButtonClick() {
    setState(() {
      _buttonClickCount++;
      if (_buttonClickCount % 1 == 0) {
        _showWidget = true;
        Timer(Duration(seconds: 3), () {
          setState(() {
            _showWidget = false;
          });
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();

    _controller = VideoPlayerController.network(url[widget.index!])
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller!.play();
        });
      });
  }

  bool _isButtonPressed = false;

  var shouldShow = true;
  var _opacity = 0.0;
  @override
  Widget build(BuildContext context) {
    final isMuted = _controller!.value.volume == 0;
    return Scaffold(
      backgroundColor: black,
      // appBar: AppBar(
      //   backgroundColor: black,
      //   toolbarHeight: 10,
      // ),
      // appBar: _controller!.value.isPlaying
      //     ? null
      //     : AppBar(
      //         backgroundColor: Colors.black,
      //         title: Text(widget.name!),
      //       ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: _controller!.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _isTV == true ? 18 / 9 : 9 / 16,
                      child: InkWell(
                          focusColor: Colors.blue,
                          onTap: () {
                            _handleButtonClick();
                            setState(() {
                              _showWidget = true;
                              if (_controller!.value.isPlaying) {
                                _controller!.pause();
                              } else {
                                // If the video is paused, play it.
                                _controller!.play();
                              }
                            });
                          },
                          child: VideoPlayer(_controller!)),
                    )
                  : Container(),
            ),

            // _showWidget
            //     ? InkWell(
            //         focusColor: Colors.red,
            //         onTap: () {
            //           setState(() {
            //             _controller!.value.isPlaying
            //                 ? _controller!.pause()
            //                 : _controller!.play();
            //           });
            //         },
            //         child: Icon(
            //           _controller!.value.isPlaying
            //               ? Icons.pause
            //               : Icons.play_arrow,
            //           size: 50,
            //           color: screenbackground,
            //         ),
            //       )
            //     : Container(),

            _showWidget
                ? Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: Container(
                      //   height: 100.h,
                      width: 1000.0.w,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 241, 234, 234)
                              .withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            focusColor: Colors.red,
                            onTap: () {
                              setState(() {
                                _controller!.value.isPlaying
                                    ? _controller!.pause()
                                    : _controller!.play();
                              });
                            },
                            child: Container(
                              child: Icon(
                                _controller!.value.isPlaying
                                    ? Icons.stop
                                    : Icons.play_arrow,
                                size: 35,
                                color: screenbackground,
                              ),
                            ),
                          ),
                          _controller != null &&
                                  _controller!.value.isInitialized
                              ? InkWell(
                                  focusColor: Colors.red,
                                  onTap: () {
                                    setState(() {
                                      _controller!.setVolume(isMuted ? 1 : 0);
                                    });
                                  },
                                  child: Icon(
                                    isMuted
                                        ? Icons.volume_off
                                        : Icons.volume_up_outlined,
                                    size: 30,
                                    color: screenbackground,
                                  ))
                              : Container(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 10,
                                width: 20,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.red),
                              ),
                              Container(
                                height: 50,
                                child: Center(
                                  child: Text(
                                    'Live',
                                    style: toptitleStylebold,
                                  ),
                                ),
                              ),
                              Container(
                                  height: 40.h,
                                  width: 100.w,
                                  child:
                                      Image.asset('assets/images/clive1.png')),
                              SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                focusColor: Colors.red,
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Lansdscape(
                                      controller: _controller,
                                    ),
                                  ));
                                },
                                child: Container(
                                  child: Icon(
                                    Icons.fullscreen,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                : Container(),
            CategoryContent()
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }
}
