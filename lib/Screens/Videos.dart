import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/videos_controller.dart';
import '../widgets/VideoCard.dart';
import '../widgets/custom_text.dart';

class Videos extends StatefulWidget {
  const Videos({Key? key}) : super(key: key);

  @override
  State<Videos> createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  VideosController videosController = Get.find();

  @override
  void initState() {
    super.initState();

    videosController.getVideosData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 35.0, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      height: 35,
                      width: 35,
                      child: null,
                    ),
                  ),
                  const CustomText(
                    text: 'Watch Videos',
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    width: 20,
                    child: null,
                  ),
                ],
              ),
              Obx(() => SizedBox(
                    height: videosController.videoList.isEmpty ? 30 : 20,
                  )),
              Obx(
                () => videosController.videoList.isEmpty
                    ? Center(
                        child: Image.asset(
                        'assets/images/loadingdata.gif',
                        height: 50,
                      ))
                    : ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: videosController.videoList.length,
                        itemBuilder: (context, index) {
                          return VideoCard(
                              videoTitle: videosController
                                  .videoList[index].title!.rendered!,
                              videoUrl: videosController
                                  .videoList[index].guid!.rendered!);
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
