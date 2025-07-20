import 'package:flutter/material.dart';

class CustomScreenTitle extends StatelessWidget {
  const CustomScreenTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(title, style: TextTheme.of(context).titleLarge),
    );
  }
}
