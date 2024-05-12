import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BreathingAnimatedSvg extends StatelessWidget {
  final String imagePath;
  final double height;

  BreathingAnimatedSvg({required this.imagePath, required this.height});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BreathingController>(
      init: BreathingController(),
      builder: (controller) {
        return AnimatedBuilder(
          animation: controller.animation,
          builder: (context, child) {
            return Transform.scale(
              scale: controller.animation.value,
              child: SvgPicture.asset(
                imagePath,
                height: height,
              ),
            );
          },
        );
      },
    );
  }
}

class BreathingController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void onInit() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);
    animation = Tween<double>(begin: 1.0, end: 1.2).animate(_controller);
    super.onInit();
  }

  @override
  void onClose() {
    _controller.dispose();
    super.onClose();
  }
}


