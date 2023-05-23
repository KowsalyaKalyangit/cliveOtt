import 'package:cliveott/utils/colors.dart';

import 'package:cliveott/utils/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../dashboard/clive_videos.dart';
import 'news/news_live_videos.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> with TickerProviderStateMixin {
  List tvname = [
    'Thanthi News',
    'India Ahead',
    'Horn Bill TV',
    'hdtv 24x7',
    'India Today'
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
      spaceImg: ('assets/category/thanthi.jpg'),
      spaceName: 'Thanthi News',
    ),
    GridItem(
      spaceImg: ('assets/category/indiahead.jpg'),
      spaceName: 'India Ahead',
    ),
    GridItem(
      spaceImg: ('assets/category/hornbilltv.jpg'),
      spaceName: 'Horn Bill Tv',
    ),
    GridItem(
      spaceImg: ('assets/category/8.jpg'),
      spaceName: 'hdtv 24x7',
    ),
    GridItem(
      spaceImg: ('assets/category/indiatoday.jpg'),
      spaceName: 'India Today',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 40.0.h,
          width: 150.0.w,
          child: Text('News', style: categorystyle),
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
                    Get.to(NewsLiveVideo(
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
