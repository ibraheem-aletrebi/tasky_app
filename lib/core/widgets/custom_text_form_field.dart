import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.title,
    required this.hintTxt,
    this.validator,
    required this.controller,
    this.maxLines,
  });
  final TextEditingController controller;
  final String title;
  final String hintTxt;
  final Function(String?)? validator;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(title, style: TextTheme.of(context).titleMedium),
        TextFormField(
          style: TextTheme.of(context).titleMedium,
          maxLines: maxLines,
          controller: controller,
          validator: (value) => (validator != null) ? validator!(value) : null,
          decoration: InputDecoration(hintText: hintTxt),
        ),
      ],
    );
  }
}
