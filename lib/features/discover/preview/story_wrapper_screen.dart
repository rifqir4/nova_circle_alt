import 'package:flutter/material.dart';
import 'package:nova_circle_alt/features/discover/preview/story_screen.dart';

class Preview {
  final String place;
  final List<Story> stories;

  const Preview({
    required this.place,
    required this.stories,
  });
}

class StoryWrapperScreen extends StatefulWidget {
  const StoryWrapperScreen({super.key});

  @override
  State<StoryWrapperScreen> createState() => _StoryWrapperScreenState();
}

class _StoryWrapperScreenState extends State<StoryWrapperScreen> {
  final List<Preview> _list = [
    const Preview(
      place: "Spain Example",
      stories: [
        Story(
            url:
                "https://loremflickr.com/cache/resized/65535_52657833337_70765cd7b4_h_500_800_nofilter.jpg",
            media: MediaType.image,
            duration: Duration(seconds: 5)),
        Story(
          url:
              "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
          media: MediaType.video,
          duration: Duration.zero,
        ),
        Story(
          url:
              "https://loremflickr.com/cache/resized/65535_52952302770_6d9a335b6e_h_500_800_nofilter.jpg",
          media: MediaType.image,
          duration: Duration(seconds: 5),
        ),
      ],
    ),
    const Preview(
      place: "Indonesia Example",
      stories: [
        Story(
          url:
              "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
          media: MediaType.video,
          duration: Duration.zero,
        ),
        Story(
          url:
              "https://loremflickr.com/cache/resized/4006_4304086816_ac027784a1_c_500_800_nofilter.jpg",
          media: MediaType.image,
          duration: Duration(seconds: 7),
        ),
        Story(
          url:
              "https://loremflickr.com/cache/resized/65535_48279161391_2ee1c6093f_h_500_800_nofilter.jpg",
          media: MediaType.image,
          duration: Duration(seconds: 5),
        ),
        Story(
          url:
              "https://loremflickr.com/cache/resized/65535_52350567152_41457022ae_c_500_800_nofilter.jpg",
          media: MediaType.image,
          duration: Duration(seconds: 5),
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return StoryScreen(
            key: ValueKey(_list[index].place),
            preview: _list[index],
          );
        },
        itemCount: _list.length,
      ),
    );
  }
}
