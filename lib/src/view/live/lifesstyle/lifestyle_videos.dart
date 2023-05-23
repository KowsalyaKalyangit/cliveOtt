import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/landscape.dart';

class LifeStyleVideos extends StatefulWidget {
  LifeStyleVideos({super.key, this.index, this.name});
  final int? index;
  final String? name;

  @override
  State<LifeStyleVideos> createState() => _LifeStyleVideosState();
}

class _LifeStyleVideosState extends State<LifeStyleVideos> {
  VideoPlayerController? _controller;
  var url = [
    'https://livectv.phando.com/8076/playlist.m3u8',
    'https://17f510c554f64f82a337896666d59b8f.mediatailor.us-east-1.amazonaws.com/v1/master/44f73ba4d03e9607dcd9bebdcb8494d86964f1d8/Samsung-gb_TravelXP/playlist.m3u8',
    'https://95eryw39dwn4-hls-live.wmncdn.net/Ayushu/271ddf829afeece44d8732757fba1a66.sdp/playlist.m3u8',
  ];

  List videosfiles = [
    'assets/videos/video2.mp4',
    'assets/videos/video1.mp4',
    'assets/videos/video3.mp4',
    'assets/videos/video2.mp4',
    'assets/videos/video2.mp4',
    'assets/videos/video1.mp4',
  ];
  int _buttonClickCount = 0;
  bool _showWidget = false;

  void _handleButtonClick() {
    setState(() {
      _buttonClickCount++;
      if (_buttonClickCount % 1 == 0) {
        _showWidget = true;
        Timer(Duration(seconds: 5), () {
          _showWidget = false;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();

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
      // appBar: _controller!.value.isPlaying
      //     ? null
      //     : AppBar(
      //         backgroundColor: Colors.black,
      //         title: Text(widget.name!),
      //       ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: _controller!.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: 16 / 8,
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
            // _showWidget
            //     ? Padding(
            //         padding: const EdgeInsets.only(left: 20.0, right: 20),
            //         child: Container(
            //           //height: 40.h,
            //           width: 1000.0.w,
            //           decoration: BoxDecoration(
            //               color: Color.fromARGB(255, 241, 234, 234)
            //                   .withOpacity(0.2),
            //               borderRadius: BorderRadius.circular(20)),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceAround,
            //             children: [
            //               InkWell(
            //                 focusColor: Colors.red,
            //                 onTap: () {
            //                   setState(() {
            //                     _controller!.value.isPlaying
            //                         ? _controller!.pause()
            //                         : _controller!.play();
            //                   });
            //                 },
            //                 child: Container(
            //                   child: Icon(
            //                     _controller!.value.isPlaying
            //                         ? Icons.stop
            //                         : Icons.play_arrow,
            //                     size: 35,
            //                     color: screenbackground,
            //                   ),
            //                 ),
            //               ),

            //               _controller != null &&
            //                       _controller!.value.isInitialized
            //                   ? InkWell(
            //                       focusColor: Colors.red,
            //                       onTap: () {
            //                         setState(() {
            //                           _controller!.setVolume(isMuted ? 1 : 0);
            //                         });
            //                       },
            //                       child: Icon(
            //                         isMuted
            //                             ? Icons.volume_off
            //                             : Icons.volume_up_outlined,
            //                         size: 30,
            //                         color: screenbackground,
            //                       ))
            //                   : Container(),

            //               // Container(
            //               //   width: 280.h,
            //               //   child: VideoProgressIndicator(
            //               //     _controller!,
            //               //     allowScrubbing: true,
            //               //     colors: const VideoProgressColors(
            //               //       backgroundColor: Colors.red,
            //               //       // bufferedColor: Colors.yellow,
            //               //       playedColor: Color(0xff18BAE8),
            //               //     ),
            //               //   ),
            //               // ),

            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
            //                 children: [
            //                   Container(
            //                     height: 10,
            //                     width: 20,
            //                     decoration: BoxDecoration(
            //                         shape: BoxShape.circle, color: Colors.red),
            //                   ),
            //                   Container(
            //                     height: 50,
            //                     child: Center(
            //                       child: Text(
            //                         'Live',
            //                         style: toptitleStylebold,
            //                       ),
            //                     ),
            //                   ),
            //                   Container(
            //                       height: 40.h,
            //                       width: 100.w,
            //                       child:
            //                           Image.asset('assets/images/clive1.png')),
            //                   SizedBox(
            //                     width: 20,
            //                   ),
            //                   InkWell(
            //                     focusColor: Colors.red,
            //                     onTap: () {
            //                       Navigator.of(context).push(MaterialPageRoute(
            //                         builder: (context) => Lansdscape(
            //                           controller: _controller,
            //                         ),
            //                       ));
            //                     },
            //                     child: Container(
            //                       child: Icon(
            //                         Icons.fullscreen,
            //                         color: Colors.white,
            //                         size: 30,
            //                       ),
            //                     ),
            //                   ),
            //                 ],
            //               )
            //             ],
            //           ),
            //         ),
            //       )
            //     : Container(),
            _showWidget
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    height: 50.h,
                    width: double.infinity,
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
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.blue,
                            child: Icon(
                              _controller!.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              size: 30,
                              color: screenbackground,
                            ),
                          ),
                        ),
                        Image.asset('assets/images/clive1.png'),
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
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              child: Icon(
                                Icons.fullscreen,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
    _showWidget = false;
  }
}
