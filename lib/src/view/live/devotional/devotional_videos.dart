import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/landscape.dart';

class DevotionalVideos extends StatefulWidget {
  DevotionalVideos({super.key, this.index, this.name});
  final int? index;
  final String? name;

  @override
  State<DevotionalVideos> createState() => _DevotionalVideosState();
}

class _DevotionalVideosState extends State<DevotionalVideos> {
  VideoPlayerController? _controller;
  var url = [
    'https://dacastmmd.mmdlive.lldns.net/dacastmmd/2794ced5de1847ebad58529fc65b33de/chunklist_b4628000.m3u8',
    'https://sscloud7.com/hls/mahimaitv.m3u8',
    'https://faithtvlive.livebox.co.in/faithtvhls/live.m3u8',
    'https://2-fss-2.streamhoster.com/pl_118/amlst:203324-1410936/playlist.m3u8',
    'https://livetv.adhisayamtv.org/adhisayamtv/83a062a18a761b948a73ad2ba7747a8f.sdp/playlist.m3u8',
    'https://channel316.livebox.co.in/c316hls/live.m3u8',
    'https://mk9qa7n8qwyb-hls-live.wmncdn.net/nambikkaitv/live.stream/playlist.m3u8',
    'https://account33.livebox.co.in/bibletvhls/live.m3u8',
    'http://rtmp.abnsat.com/hls/abnurdu.m3u8',
    'https://server.iptelevision.in/hls/jebamtv.m3u8',
    // 'https://lifetv.livebox.co.in/lifetvtamilhls/live.m3u8',
    // 'https://jeyamtv.livebox.co.in/JeyamTelevisionhls/JeyamTelevision.m3u8',
    // 'https://joytv.livebox.co.in/joytvhls/live.m3u8',
    // 'http://209.58.160.179/heaventvhls/live.m3u8',
    // 'https://gracetvcgl.livebox.co.in/Gracetvhls/Gracetv.m3u8',
    // 'https://iptelevision.in/hls/ruahtv.m3u8',
    // 'https://f-tx-edge-86.christianworldmedia.com/lordtvministries/mp4:lordtvministries/playlist.m3u8',
    // 'https://tx1.ibctamil.tv/CDN_IBC_Siluvai/tracks-v1a1/mono.m3u8',
    // 'https://sscloud7.com/arktvlive.m3u8',
    // 'https://sscloud7.com/hls/mahimaitv.m3u8',
    // 'https://live.wmncdn.net/shubhavartha/live.stream/index.m3u8',
    // 'https://calvary.livebox.co.in/NireekshanaTVhls/live.m3u8',
    // 'https://6n3yopznd9ok-hls-live.5centscdn.com/RAKSHANA/271ddf829afeece44d8732757fba1a66.sdp/playlist.m3u8',
    // 'https://verbumtv.livebox.co.in/verbumtvhls/live.m3u8',
    // 'https://shashwatha.com/hls/show/newhopetv.m3u8',
    // 'https://lifetv.livebox.co.in/lifetvhls/lifetv.m3u8',
    // 'http://live.adostream.com:1935/gospeltv/gospeltv/chunklist.m3u8',
    // 'https://bigjtv.livebox.co.in/bigjtvhls/live.m3u8',
    // 'https://divineplayout-us2.tulix.tv/live/Stream1/.m3u8',
    // 'https://ewmoy8w4y2a7-hls-live.5centscdn.com/mariantv/d0dbe915091d400bd8ee7f27f0791303.sdp/mono.m3u8',
    // 'https://live.wmncdn.net/harvesttvlive1/bbb19eae240ec100af921d511efc86a0.sdp/index.m3u8',
    // 'https://live.wmncdn.net/harvestenglish/d1796a22d24e8696c7d5d0b5c349fdd2.sdp/index.m3u8',
    // 'https://live.wmncdn.net/harvestusa/d57ffba6564caea2fee3f4085f19a098.sdp/playlist.m3u8',
    // 'https://live.wmncdn.net/harvesttvkuwait/bbb19eae240ec100af921d511efc86a0.sdp/index.m3u8',
    // 'https://live.wmncdn.net/shubhsandeshtv1/live123.stream/index.m3u8',
    // 'http://rtmp.abnsat.com/hls/abntvindia.m3u8',
    // 'http://cdn15.live247stream.com/yeshuaa/tv/playlist.m3u8',
    // 'https://streamer12.vdn.dstreamone.net/jctv/jctv/playlist.m3u8',
    // 'https://streamer12.vdn.dstreamone.net/kingtv/kingtv/playlist.m3u8',
    // 'https://livecdn.live247stream.com/isaac/tv/playlist.m3u8',
    // 'https://livecdn.live247stream.com/fazal/tv/playlist.m3u8',
    // 'https://streamer12.vdn.dstreamone.net/barkattv/dexpo/playlist.m3u8',
    // 'https://livecdn.live247stream.com/btl/tv/playlist.m3u8',
    // 'https://livecdn.live247stream.com/gawahi/tv/playlist.m3u8',
    // 'https://livecdn.live247stream.com/missionasia/tv/playlist.m3u8',
    // 'https://cdn.live247stream.com/joystar/tv/playlist.m3u8',
    // 'https://livecdn.live247stream.com/eternallife/tv/playlist.m3u8',
    // 'https://livecdn.live247stream.com/praise/tv/playlist.m3u8',
    // 'http://rtmp.abnsat.com/hls/abnurdu.m3u8',
    // 'https://livecdn.live247stream.com/thebible/tv/playlist.m3u8'
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
