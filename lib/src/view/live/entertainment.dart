import 'package:cliveott/utils/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../dashboard/clive_videos.dart';

class EntertainmentPage extends StatefulWidget {
  const EntertainmentPage({super.key});

  @override
  State<EntertainmentPage> createState() => _EntertainmentPageState();
}

class _EntertainmentPageState extends State<EntertainmentPage>
    with TickerProviderStateMixin {
  List tvname = [
    'Deepam TV',
    'Captain TV',
    'Malaimurasu',
    'News 7',
    'Polimer',
    'Vasanth',
    'Madha TV',
    'Divyavani',
    'Malar TV',
    'News J',
    'TV 5',
    'Sangamam',
    'Neyam TV',
    'Aseervatham TV',
    'Imayam',
    'Vellicham',
    'Vanavil',
    'Shalini Tv',
    'Makkal TV',
    'Mo Lumiere'
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
    // GridItem(
    //   spaceImg: ('assets/category/kalai.jpg'),
    //   spaceName: 'Kalainger TV',
    // ),
    // GridItem(
    //   spaceImg: ('assets/category/isai.jpg'),
    //   spaceName: 'Isaiaruvi TV',
    // ),
    // GridItem(
    //   spaceImg: ('assets/category/siripoli.jpg'),
    //   spaceName: 'Siripoli',
    // ),
    GridItem(
      spaceImg: ('assets/category/2.jpg'),
      spaceName: 'Deepam TV',
    ),
    GridItem(
      spaceImg: ('assets/category/11.jpg'),
      spaceName: 'Captain TV',
    ),
    GridItem(
      spaceImg: ('assets/category/10.jpg'),
      spaceName: 'Malaimurasu',
    ),
    GridItem(
      spaceImg: ('assets/category/8.jpg'),
      spaceName: 'News 7',
    ),
    GridItem(
      spaceImg: ('assets/category/1.jpg'),
      spaceName: 'Polimer TV',
    ),
    GridItem(
      spaceImg: ('assets/category/15.jpg'),
      spaceName: 'Vasanth TV',
    ),
    GridItem(
      spaceImg: ('assets/category/12.jpg'),
      spaceName: 'Madha TV',
    ),
    GridItem(
      spaceImg: ('assets/category/14.jpg'),
      spaceName: 'Divyavani',
    ),
    GridItem(
      spaceImg: ('assets/category/9.jpg'),
      spaceName: 'Malar TV',
    ),
    GridItem(
      spaceImg: ('assets/category/7.jpg'),
      spaceName: 'News J',
    ),
    GridItem(
      spaceImg: ('assets/category/3.jpg'),
      spaceName: 'TV 5',
    ),
    GridItem(
      spaceImg: ('assets/category/4.jpg'),
      spaceName: 'Sangamam',
    ),
    GridItem(
      spaceImg: ('assets/category/6.jpg'),
      spaceName: 'Neyam TV',
    ),
    GridItem(
      spaceImg: ('assets/category/13.jpg'),
      spaceName: 'Aseervatham TV',
    ),
    GridItem(
      spaceImg: ('assets/category/imayam.jpg'),
      spaceName: 'Imayam',
    ),
    GridItem(
      spaceImg: ('assets/category/vellicham.jpg'),
      spaceName: 'Vellicham',
    ),
    GridItem(
      spaceImg: ('assets/category/vanavil.jpg'),
      spaceName: 'Vanavil',
    ),
    GridItem(
      spaceImg: ('assets/category/shalini.jpg'),
      spaceName: 'Shalini TV',
    ),
    GridItem(
      spaceImg: ('assets/category/makkal.jpg'),
      spaceName: 'Makkal TV',
    ),
    GridItem(
      spaceImg: ('assets/category/lumiere.jpg'),
      spaceName: 'Mo Lumiere',
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
          child: Text('Entertainment', style: categorystyle),
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
                    Get.to(CliveVideos(
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
