import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomNoTaskWidget extends StatelessWidget {
  const CustomNoTaskWidget({super.key, this.width});
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LottieBuilder.asset('assets/lotties/no_task.json', width: width),
    );
  }
}
