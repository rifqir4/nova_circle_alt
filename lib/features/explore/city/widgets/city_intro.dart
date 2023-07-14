import 'package:flutter/material.dart';
import 'package:nova_circle_alt/core/utils/app_log.dart';
import 'package:nova_circle_alt/features/explore/city/widgets/city_header.dart';

class CityIntro extends StatefulWidget {
  const CityIntro({super.key});

  @override
  State<CityIntro> createState() => _CityIntroState();
}

class _CityIntroState extends State<CityIntro> {
  //START: ANIMATION PART

  Offset _position = Offset.zero;

  bool _isDragging = false;

  final Size _screenSize = Size.zero;
  Size get screenSize => _screenSize;

  void startPosition(DragStartDetails details) {
    _isDragging = true;
  }

  void updatePoisiton(DragUpdateDetails details) {
    final dy = _position.dy + details.delta.dy;

    if (dy < 0) {
      setState(() {
        _position = Offset(0, dy);
      });
    }
  }

  Future<void> endPosition(double maxHeight) async {
    _isDragging = false;

    if (_position.dy > -100) {
      setState(() {
        _position = Offset.zero;
      });
    } else {
      setState(() {
        _position = Offset(_position.dx, -maxHeight);
      });
      Navigator.pop(context);
    }

    logg.d(_position.dy);
  }

  //END: ANIMATION PART
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Builder(builder: (context) {
        final size = MediaQuery.of(context).size;
        final rotatedMatrix = Matrix4.identity();
        final milliseconds = _isDragging ? 0 : 500;

        return GestureDetector(
          onPanStart: (details) {
            startPosition(details);
          },
          onPanUpdate: (details) {
            updatePoisiton(details);
          },
          onPanEnd: (_) {
            endPosition(size.height);
          },
          child: AnimatedContainer(
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: milliseconds),
            transform: rotatedMatrix..translate(_position.dx, _position.dy),
            child: const CityHeader(isIntro: true),
          ),
        );
      }),
    );
  }

  Widget _buildAppBar() {
    return const Row(
        children: [Icon(Icons.arrow_back), Spacer(), Icon(Icons.share)]);
  }
}
