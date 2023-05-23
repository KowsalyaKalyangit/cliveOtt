import 'package:flutter/material.dart';

import 'entertainment.dart';
import 'lifesstyle/lifestyle_page.dart';
import 'music_live.dart';
import 'news_page.dart';
import 'others_page.dart';

class LiveChannels extends StatefulWidget {
  const LiveChannels({super.key});

  @override
  State<LiveChannels> createState() => _LiveChannelsState();
}

class _LiveChannelsState extends State<LiveChannels> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Live TV '),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // EntertainmentPage(),
              MusicLivePage(),
              NewsPage(),
              OthersPage(),
            ],
          ),
        ),
      ),
    );
  }
}
