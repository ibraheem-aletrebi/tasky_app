import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MotivationTextWidget extends StatelessWidget {
  const MotivationTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Yuhuu ,Your work Is', style: TextTheme.of(context).displayLarge),
        Row(
          children: [
            Text('almost done ! ', style: TextTheme.of(context).displayLarge),
            SvgPicture.asset('assets/icons/waving_hand_icon.svg'),
          ],
        ),
      ],
    );
  }
}
