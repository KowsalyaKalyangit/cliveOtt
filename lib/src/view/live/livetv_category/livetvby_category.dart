import 'package:cliveott/src/view/dashboard/mobile_app/videostream/category_videostream.dart';
import 'package:cliveott/utils/colors.dart';
import 'package:cliveott/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/textstyles.dart';
import '../../../controller/livetvby_category_controller.dart';
import '../../category/category_videos.dart';

class LiveTvByCategoryScreen extends StatefulWidget {
  LiveTvByCategoryScreen({super.key, this.categoryid});
  final String? categoryid;
  @override
  State<LiveTvByCategoryScreen> createState() => _LiveTvByCategoryScreenState();
}

class _LiveTvByCategoryScreenState extends State<LiveTvByCategoryScreen> {
  LiveTvByCategoryController liveTvByCategoryController =
      Get.put(LiveTvByCategoryController());
  @override
  void initState() {
    liveTvByCategoryController.liveTvBycategoryController(
        category_id: widget.categoryid.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (liveTvByCategoryController.categoryLoad.value) {
        return Center(child: CircularProgressIndicator());
      } else if (liveTvByCategoryController
          .getcategory[0].videoStreamingApp.isEmpty) {
        return Scaffold(
          body: Center(
              child: Text(
            'NO DATA FOUND..!',
            style: categorystyle,
          )),
        );
      } else {
        return Scaffold(
          backgroundColor: black1,
          appBar: AppBar(
            backgroundColor: black,
            title: Text(liveTvByCategoryController.getcategory[0].categoryName),
          ),
          body: SingleChildScrollView(
            child: Container(
                height: 1000.0.h,
                width: 1000.0.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/bgbg.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    itemCount: liveTvByCategoryController
                        .getcategory[0].videoStreamingApp.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 180,
                        childAspectRatio: 3.90 / 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 0),
                    itemBuilder: (BuildContext context, int index) {
                      var categorydata = liveTvByCategoryController
                          .getcategory[0].videoStreamingApp[index];
                      return Material(
                        color: Colors.transparent,
                        child: InkWell(
                          focusColor: Colors.blue.withOpacity(0.2),
                          onTap: () {
                            // Get.to(CategoryVideos(
                            //     tvid: categorydata.tvId.toString(),
                            //     tvurl: categorydata.tvUrl.toString()));
                            // Get.to(VideoApp());
                            Get.to(MobileCategoryVideo(
                                tvurl: categorydata.tvUrl.toString(),tvtitle:categorydata.tvTitle.toString()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  //  / color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.network(
                                        categorydata.tvLogo,
                                        // height: 15.0.hp,
                                        // width: 50.0.wp,
                                        // fit: BoxFit.cover,
                                      )),
                                  SizedBox(
                                    height: 1.0.hp,
                                  ),
                                  Text(
                                    categorydata.tvTitle,
                                    style: toptitleStylebold,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )),
          ),
        );
      }
    });
  }
}
