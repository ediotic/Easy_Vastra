import 'package:easy_vastra/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Fields extends StatelessWidget {
  final String hintText;
  // final String ?hintStyle;
  final TextInputType keyboardType;
  final IconData prefixIcon;
  final IconData? suffixIcon;             // Optional suffix icon
  final Color cursorColor;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController? controller;

  const Fields({
    Key? key,
    required this.hintText,
    required this.keyboardType,
    required this.prefixIcon,
    this.suffixIcon,                // Nullable suffix icon
    required this.cursorColor,
    this.contentPadding,
    // this.hintStyle,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
          controller: controller,
          cursorColor: cursorColor,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: AppColors.appHintFieldColors),
            prefixIcon: Icon(
              prefixIcon,
              color: cursorColor,
            ),
            suffixIcon: suffixIcon != null // Show suffix icon only if provided
                ? Icon(
                    suffixIcon,
                    color: cursorColor,
                  )
                : null,
            contentPadding: contentPadding ?? const EdgeInsets.only(top: 2.0, left: 8.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ),
      ),
    );
  }
}

