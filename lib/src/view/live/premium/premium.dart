import 'package:cliveott/src/view/live/music/music_videos.dart';
import 'package:cliveott/src/view/live/premium/premium_video.dart';

import 'package:cliveott/utils/colors.dart';

import 'package:cliveott/utils/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Premium extends StatefulWidget {
  const Premium({super.key});

  @override
  State<Premium> createState() => _PremiumState();
}

class _PremiumState extends State<Premium> with TickerProviderStateMixin {
  List tvname = [
    'Deepam TV',
    'Neeyam TV',
    'Madha TV',
    'Divayavani TV',
    'Captain TV',
    'Malar TV',
    'Malaimurasu',
    'News 7',
    'Polimer TV',
    'Sangamamam TV',
    'TV 5',
    'Vasanth TV',
    'Puthiyathalaimurai'
  ];
  var selectedindex = 0;
  bool isHover = false;

  Widget gridCard({required GridItem card}) => Container(
          child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(children: [
          Expanded(
              child: InkWell(
                  focusColor: Colors.blue,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        card.spaceImg,
                      )))),
          SizedBox(
            height: 5.0.h,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  card.spaceName,
                  style: subcategorystyle,
                ),
              )
            ],
          ),
        ]),
      ));
  @override
  void initState() {
    super.initState();
  }

  List<GridItem> card = [
    GridItem(
      spaceImg: ('assets/premium/deepam.jpg'),
      spaceName: 'Deepam TV',
    ),
    GridItem(
      spaceImg: ('assets/premium/neeyam.jpg'),
      spaceName: 'Neeyam TV',
    ),
    GridItem(
      spaceImg: ('assets/premium/madha.jpg'),
      spaceName: 'Madha TV',
    ),
    GridItem(
      spaceImg: ('assets/premium/divyavani.jpg'),
      spaceName: 'Diyavani TV',
    ),
    GridItem(
      spaceImg: ('assets/premium/captain.jpg'),
      spaceName: 'Captain TV',
    ),
    GridItem(
      spaceImg: ('assets/premium/malar.jpg'),
      spaceName: 'Malar TV',
    ),
    GridItem(
      spaceImg: ('assets/premium/malai.jpg'),
      spaceName: 'Malaimurasu TV',
    ),
    GridItem(
      spaceImg: ('assets/premium/news7.jpg'),
      spaceName: 'News 7',
    ),
    GridItem(
      spaceImg: ('assets/premium/polimer.jpg'),
      spaceName: 'Polimer TV',
    ),
    GridItem(
      spaceImg: ('assets/premium/sangamam.jpg'),
      spaceName: 'sangamam TV',
    ),
    GridItem(
      spaceImg: ('assets/premium/tv5.jpg'),
      spaceName: 'TV5',
    ),
    GridItem(
      spaceImg: ('assets/premium/vasanth.jpg'),
      spaceName: 'Vasanth TV',
    ),
    GridItem(
      spaceImg: ('assets/premium/pudhiya.jpg'),
      spaceName: 'PudhiyaThalaimuai',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Premium Channels', style: heading),
        SizedBox(
          height: 10.0.h,
        ),
        Container(
          height: 150.h,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            // physics: NeverScrollableScrollPhysics(),
            itemCount: card.length,
            itemBuilder: (BuildContext context, index) {
              return InkWell(
                  focusColor: Colors.blue.withOpacity(0.4),
                  onTap: () {
                    Get.to(PremiumVideo(
                      index: index,
                      name: tvname[index],
                    ));
                    print('clickkkk');
                  },
                  child: gridCard(
                    card: card[index],
                  ));
            },
          ),
        ),
      ],
    );
  }
}

//       body: SingleChildScrollView(
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 1.0.hp,
//               ),
//               Container(
//                 height: 100.0.hp,
//                 width: 100.0.wp,
//                 child: GridView.builder(
//                   itemCount: images.length,
//                   itemBuilder: (context, index) {
//                     return (
//                       onTap: () {
//                         Get.to(CliveVideos(
//                           index: index,
//                           name: tvname[index],
//                         ));
//                       },
//                       child: Column(
//                         children: [
//                           Card(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20.0),
//                               ),
//                               child: Container(
//                                 height: 20.0.hp,
//                                 width: 42.0.wp,
//                                 child: Image.asset(
//                                   images[index],
//                                 ),
//                               )),
//                           FittedBox(
//                             child: Text(
//                               tvname[index],
//                               style: subtitleStyle,
//                             ),
//                           )
//                         ],
//                       ),
//                     );
//                   },
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       childAspectRatio: 2 / 2,
//                       mainAxisSpacing: 20),
//                 ),
//               ),
//             ]),
//       ),
//     );
//   }
// }

class GridItem {
  final String spaceImg;
  final String spaceName;

  const GridItem({
    required this.spaceImg,
    required this.spaceName,
  });
}
