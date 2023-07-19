import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';

import '../../../core/router/router.dart';
import '../../../core/themes/themes.dart';
import '../../../shared/resources/app_svgs.dart';
import '../../../shared/widgets/widgets.dart';
import 'story_wrapper_screen.dart';

enum MediaType {
  image,
  video,
}

class Story {
  final String url;
  final MediaType media;
  final Duration duration;

  const Story({
    required this.url,
    required this.media,
    required this.duration,
  });
}

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key, required this.preview});

  final Preview preview;

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen>
    with SingleTickerProviderStateMixin {
  late List<Story> _stories;

  late PageController _pageController;
  late AnimationController _animController;
  late VideoPlayerController? _videoController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _stories = widget.preview.stories;

    _pageController = PageController();
    _animController = AnimationController(vsync: this);

    final Story firstStory = _stories.first;
    _loadStory(story: firstStory, animateToPage: false);

    _animController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animController.stop();
        _animController.reset();
        setState(() {
          if (_currentIndex + 1 < _stories.length) {
            _currentIndex += 1;
            _loadStory(story: _stories[_currentIndex]);
          } else {
            // Out of bounds - loop story
            // You can also Navigator.of(context).pop() here
            _currentIndex = 0;
            _loadStory(story: _stories[_currentIndex]);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animController.dispose();
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: GestureDetector(
        onTapDown: (details) => _onTapDown(details),
        child: Stack(
          children: [
            const Positioned.fill(
                child: Center(child: CupertinoActivityIndicator())),
            PageView.builder(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _stories.length,
              itemBuilder: (context, i) {
                final Story story = _stories[i];
                switch (story.media) {
                  case MediaType.image:
                    return Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(story.url),
                        fit: BoxFit.cover,
                      )),
                    );
                  case MediaType.video:
                    if (_videoController != null &&
                        _videoController!.value.isInitialized) {
                      return FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: _videoController!.value.size.width,
                          height: _videoController!.value.size.height,
                          child: VideoPlayer(_videoController!),
                        ),
                      );
                    }
                }
                return const SizedBox.shrink();
              },
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
                      SpaceV(value: kToolbarHeight + 20.h),
                      Row(
                        children: _stories
                            .asMap()
                            .map((i, e) {
                              return MapEntry(
                                i,
                                AnimatedBar(
                                  animController: _animController,
                                  position: i,
                                  currentIndex: _currentIndex,
                                ),
                              );
                            })
                            .values
                            .toList(),
                      ),
                      SpaceV(value: 12.h),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.preview.place,
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
                                            style: AppTextStyles.body2.copyWith(
                                                color: AppColors.white),
                                          ),
                                          Text("@adada",
                                              style: AppTextStyles.body3
                                                  .copyWith(
                                                      color: AppColors
                                                          .greyLighter)),
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
          ],
        ),
      ),
    );
  }

  void _onTapDown(TapDownDetails details) {
    final Story nowStory = _stories[_currentIndex];
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;
    if (dx < screenWidth / 3) {
      setState(() {
        if (_currentIndex - 1 >= 0) {
          _currentIndex -= 1;
          _loadStory(story: _stories[_currentIndex]);
        }
      });
    } else if (dx > 2 * screenWidth / 3) {
      setState(() {
        if (_currentIndex + 1 < _stories.length) {
          _currentIndex += 1;
          _loadStory(story: _stories[_currentIndex]);
        } else {
          // Out of bounds - loop story
          // You can also Navigator.of(context).pop() here
          _currentIndex = 0;
          _loadStory(story: _stories[_currentIndex]);
        }
      });
    } else {
      if (nowStory.media == MediaType.video) {
        if (_videoController!.value.isPlaying) {
          _videoController!.pause();
          _animController.stop();
        } else {
          _videoController!.play();
          _animController.forward();
        }
      }
    }
  }

  void _loadStory({required Story story, bool animateToPage = true}) {
    _animController.stop();
    _animController.reset();
    switch (story.media) {
      case MediaType.image:
        _animController.duration = story.duration;
        _animController.forward();
        break;
      case MediaType.video:
        _videoController = null;
        _videoController?.dispose();
        _videoController = VideoPlayerController.network(story.url)
          ..initialize().then((_) {
            setState(() {});
            if (_videoController!.value.isInitialized) {
              _animController.duration = _videoController!.value.duration;
              _videoController!.play();
              _animController.forward();
            }
          });
        break;
    }
    if (animateToPage) {
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }
}

class AnimatedBar extends StatelessWidget {
  final AnimationController animController;
  final int position;
  final int currentIndex;

  const AnimatedBar({
    Key? key,
    required this.animController,
    required this.position,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.5),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: <Widget>[
                _buildContainer(
                  double.infinity,
                  position < currentIndex
                      ? AppColors.white
                      : AppColors.white.withOpacity(0.36),
                ),
                position == currentIndex
                    ? AnimatedBuilder(
                        animation: animController,
                        builder: (context, child) {
                          return _buildContainer(
                            constraints.maxWidth * animController.value,
                            AppColors.white,
                          );
                        },
                      )
                    : const SizedBox.shrink(),
              ],
            );
          },
        ),
      ),
    );
  }

  Container _buildContainer(double width, Color color) {
    return Container(
      height: 2.h,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(3.0),
      ),
    );
  }
}
