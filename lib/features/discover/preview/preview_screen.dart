import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nova_circle_alt/core/router/app_nav.dart';
import 'package:nova_circle_alt/core/themes/themes.dart';
import 'package:nova_circle_alt/shared/resources/app_svgs.dart';
import 'package:nova_circle_alt/shared/widgets/space.dart';
import 'package:video_player/video_player.dart';

class PreviewScreen extends StatefulWidget {
  const PreviewScreen({super.key});

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  final videoList = [
    VideoPlayerController.network(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4"),
    VideoPlayerController.network(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
    VideoPlayerController.network(
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
  ];

  int pageIndex = 0;

  @override
  void dispose() {
    super.dispose();
    for (var videoController in videoList) {
      videoController.dispose();
    }
  }

  void _onTapRight() {
    debugPrint(pageIndex.toString());
    if (pageIndex < videoList.length - 1) {
      setState(() {
        pageIndex += 1;
      });
    }
  }

  void _onTapLeft() {
    debugPrint(pageIndex.toString());
    if (pageIndex > 0) {
      setState(() {
        pageIndex -= 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          const SizedBox.expand(),
          //Video Widget
          Positioned.fill(
            child: VideoPlay(
              key: ValueKey("key-$pageIndex"),
              controller: videoList[pageIndex],
            ),
          ),

          //Header
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 200.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.45),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    SpaceV(value: kToolbarHeight + 32.h),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Ohla Example",
                            style: AppTextStyles.subtitle.copyWith(
                              color: AppColors.white,
                              fontSize: 20.sp,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => AppNav.back(),
                          icon: SvgPicture.asset(
                            AppSvgs.icClose,
                            width: 24.w,
                            colorFilter: const ColorFilter.mode(
                              AppColors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppSvgs.icPin,
                          width: 21.w,
                          colorFilter: const ColorFilter.mode(
                            AppColors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                        SpaceH(value: 5.w),
                        Expanded(
                          child: Text(
                            "Barcelona",
                            style: AppTextStyles.body1.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),

          //Footer
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 400.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.65),
                    ],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 40.h),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 263.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(),
                            Row(
                              children: [
                                //Picture
                                Container(
                                    width: 36.w,
                                    height: 36.w,
                                    decoration: BoxDecoration(
                                        color: AppColors.blueSky,
                                        borderRadius:
                                            BorderRadius.circular(8.w))),
                                SpaceH(value: 10.w),

                                //Info
                                Expanded(
                                  child: SizedBox(
                                    height: 36.w,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "David Kopmen",
                                          style: AppTextStyles.body2
                                              .copyWith(color: AppColors.white),
                                        ),
                                        Text("@adada",
                                            style: AppTextStyles.body3.copyWith(
                                                color: AppColors.greyLighter)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SpaceV(value: 8.h),
                            Text(
                              "“great location, modern facilities. very nice pool...”",
                              style: AppTextStyles.body2
                                  .copyWith(color: AppColors.white),
                            ),
                            SpaceV(value: 4.h),
                            Text(
                              "6 hours ago",
                              style: AppTextStyles.body3
                                  .copyWith(color: AppColors.white),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              AppSvgs.icStar,
                              width: 24.w,
                              colorFilter: const ColorFilter.mode(
                                AppColors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              AppSvgs.icShare,
                              width: 24.w,
                              colorFilter: const ColorFilter.mode(
                                AppColors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              AppSvgs.icMoreSquare,
                              width: 24.w,
                              colorFilter: const ColorFilter.mode(
                                AppColors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          //Tap Action
          Positioned.fill(
            child: Center(
              child: SizedBox(
                height: 250.h,
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: _onTapLeft,
                        child: Container(color: Colors.transparent),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: _onTapRight,
                        child: Container(color: Colors.transparent),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //Progress Bar
          Positioned.fill(
            top: kToolbarHeight + 20.h,
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: GridView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: videoList.length,
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: videoList.length,
                    mainAxisExtent: 2.h,
                    crossAxisSpacing: 5.w,
                  ),
                  itemBuilder: (context, index) {
                    if (index < pageIndex) {
                      return Container(
                        width: double.infinity,
                        color: AppColors.white,
                      );
                    }
                    return ProgressTest(
                      key: ValueKey("progress-$index"),
                      controller: videoList[index],
                      onFinish: _onTapRight,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressTest extends StatefulWidget {
  const ProgressTest({super.key, required this.controller, this.onFinish});

  final VideoPlayerController controller;
  final VoidCallback? onFinish;

  @override
  State<ProgressTest> createState() => _ProgressTestState();
}

class _ProgressTestState extends State<ProgressTest> {
  late VideoPlayerController _controller;

  double progress = 0;
  bool isFinish = false;

  @override
  void initState() {
    super.initState();

    _controller = widget.controller;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.addListener(() {
        if (_controller.value.isInitialized) {
          if (mounted && progress != 1) {
            setState(() {
              progress = _controller.value.position.inMilliseconds /
                  _controller.value.duration.inMilliseconds;
            });
          } else if (!isFinish && progress == 1) {
            isFinish = true;
            widget.onFinish?.call();
          }
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    // _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Stack(
        children: [
          Container(
            width: constraint.maxWidth,
            color: AppColors.white.withOpacity(0.36),
          ),
          Positioned(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: progress * constraint.maxWidth,
              color: AppColors.white,
            ),
          ),
        ],
      );
    });
  }
}

class VideoPlay extends StatefulWidget {
  const VideoPlay({super.key, required this.controller});

  final VideoPlayerController controller;

  @override
  State<VideoPlay> createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = widget.controller;
    _controller.setVolume(1);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_controller.value.isInitialized) {
        _controller
          ..initialize().then((_) {
            setState(() {
              debugPrint("load video Done");
            });
          })
          ..play();
      } else {
        _controller.play();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.seekTo(const Duration());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: 1.sw / 1.sh,
              child: VideoPlayer(_controller),
            )
          : const CupertinoActivityIndicator(color: AppColors.white),
    );
  }
}
