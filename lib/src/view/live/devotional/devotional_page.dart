import 'package:cliveott/src/view/live/devotional/devotional_videos.dart';

import 'package:cliveott/utils/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DevotionalPage extends StatefulWidget {
  const DevotionalPage({super.key});

  @override
  State<DevotionalPage> createState() => _DevotionalPageState();
}

class _DevotionalPageState extends State<DevotionalPage>
    with TickerProviderStateMixin {
  List tvname = [
    'Salvation Tv',
    'Blessing TV',
    'Faith TV',
    'Family channel',
    'Adhisayam Tv',
    '316',
    'Nambikkai Tv',
    'Bible Tv',
    'Go Revival TV',
    'Jebam TV',
    // 'Life Tv',
    // 'Jeyam TV',
    // 'Joy Tv',
    // 'heaven Tv',
    // "Grace TV",
    // 'Ruah TV',
    // 'Lord TV',
    // 'IBC Siluvai',
    // 'ARK TV',
    // 'Mahimai TV',
    // 'Shubhavartha',
    // 'NireekshanaTV',
    // 'RakshanaTV',
    // 'VerbumTV',
    // 'New Hope TV',
    // 'Life TV',
    // 'Gospel TV India',
    // 'BigJ TV',
    // 'Divine Vision',
    // 'Marian World',
    // 'Harvest TV',
    // 'Harvest TV Malayalam',
    // 'HarvestTV USA',
    // 'HarvestTV Arabia',
    // 'Shubsandesh TV',
    // 'ABN Hindi',
    // 'YeshuaaTV',
    // 'JCTV',
    // 'KING TV',
    // 'ISAAC TV',
    // 'FAZAL TV',
    // 'BARKAT TV',
    // 'BTL TV',
    // 'GAWAHI TV',
    // 'Mission Asia',
    // 'Joystar TV',
    // 'EternalLife TV',
    // 'Praise TV',
    // 'ABN Urdu',
    // 'Bible TV Global',
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
      spaceImg: ('assets/category/salvation.jpg'),
      spaceName: 'Salvation Tv',
    ),
    GridItem(
      spaceImg: ('assets/category/mahimai.jpg'),
      spaceName: 'Mahimai TV',
    ),
    GridItem(
      spaceImg: ('assets/category/faith.jpg'),
      spaceName: 'Faith TV',
    ),
    GridItem(
      spaceImg: ('assets/category/familychannel.jpg'),
      spaceName: 'Family Channel',
    ),
    GridItem(
      spaceImg: ('assets/category/adhisiyam.jpg'),
      spaceName: 'Adhisayam TV',
    ),
    GridItem(
      spaceImg: ('assets/category/316.jpg'),
      spaceName: '316',
    ),
    GridItem(
      spaceImg: ('assets/category/nambikkai.jpg'),
      spaceName: 'Nambikkai TV',
    ),
    GridItem(
      spaceImg: ('assets/category/bible.jpg'),
      spaceName: 'Bible TV',
    ),
    GridItem(
      spaceImg: ('assets/category/absurudu.jpg'),
      spaceName: 'Abs Urudu TV',
    ),
    GridItem(
      spaceImg: ('assets/category/jebam.jpg'),
      spaceName: 'Jebam TV',
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
          child: Text('Devotional', style: categorystyle),
        ),
        Container(
          height: 150.h,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            // physics: NeverScrollableScrollPhysics(),
            itemCount: tvname.length,
            itemBuilder: (BuildContext context, index) {
              return InkWell(
                  focusColor: Colors.blue.withOpacity(0.4),
                  onTap: () {
                    Get.to(DevotionalVideos(
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
