import 'package:carousel_slider/carousel_slider.dart';
import 'package:cliveott/src/view/dashboard/slider_videos.dart';
import 'package:cliveott/utils/colors.dart';
import 'package:cliveott/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:is_tv/is_tv.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class SlidingBannerAuto extends StatefulWidget {
  const SlidingBannerAuto({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SlidingBannerAutoState();
  }
}

class _SlidingBannerAutoState extends State<SlidingBannerAuto> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  // CategoryController categoryController = Get.put(CategoryController());
  @override
  void initState() {
    initPlatformState();
    super.initState();
  }

  final List<String> imgList = [
    'assets/images/b1.jpg',
    'assets/images/b2.jpg',
    'assets/images/b3.jpg',
    'assets/images/b4.jpg',
    'assets/images/b5.jpg'
  ];
  // final List<String> imgList = [
  //   'assets/slider/12.jpg',
  //   'assets/slider/15.jpg',
  //   'assets/slider/13.jpg',
  //   'assets/slider/11.jpg',
  //   'assets/slider/14.jpg'
  // ];
  bool? _isTV = false;
  final _isTVPlugin = IsTV();

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

  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    // var imgList = categoryController.getcategory[0].data!.bannerImage![0].bannerUrl;

    final List<Widget> imageSliders = imgList
        .map((item) => ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                item,
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.2,
              ),
            ))
        .toList();
    return Container(
      height: _isTV! ? 65.0.hp : 30.0.hp,
      //color: Colors.black.withOpacity(0.2),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Material(
          color: Colors.transparent,
          child: IconButton(
            focusColor: Colors.red,
            onPressed: () {
              carouselController.previousPage(
                  duration: const Duration(milliseconds: 1),
                  curve: Curves.linear);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            ),
          ),
        ),
        Expanded(
            child: InkWell(
          onTap: () {
            Get.to(SliderVideos(
              index: _current,
            ));
          },
          child: Container(
            child: CarouselSlider(
              items: imageSliders,
              carouselController: carouselController,

              //Slider Container properties
              options: CarouselOptions(
                  height: _isTV! ? 400.0 : 180,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: _isTV! ? 16 / 9 : 4 / 3,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
          ),
        )),
        Material(
          color: Colors.transparent,
          child: IconButton(
            focusColor: Colors.red,
            onPressed: () {
              carouselController.nextPage(
                  duration: const Duration(milliseconds: 1),
                  curve: Curves.linear);
            },
            icon: const Icon(
              Icons.arrow_forward_ios_sharp,
              color: Colors.grey,
            ),
          ),
        ),
      ]),
    );
  }
}
