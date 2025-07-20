import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky/Feature/layaout/controller/app_controller.dart';
import 'package:tasky/core/widgets/custom_svg_picture.dart';

class CirclerUserImageWidget extends StatelessWidget {
  const CirclerUserImageWidget({super.key, this.width, this.height});
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Selector<AppController, File?>(
      builder: (context, value, child) => ClipOval(
        child: (value == null)
            ? CustomSvgPicture(
                path: 'assets/images/default_profile_image.svg',
                width: width ?? 50,
              )
            : Image.file(value, width: width ?? 50, height: height ?? 50),
      ),
      selector: (context, appController) => appController.image,
    );
  }
}
