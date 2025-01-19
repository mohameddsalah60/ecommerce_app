import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.onPressed,
      required this.text,
      this.backgroundColor = AppColors.primaryColor,
      this.radius = 16,
      this.isLoading = false});
  final void Function()? onPressed;
  final String text;
  final Color? backgroundColor;
  final double? radius;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: 53,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius!),
            side: backgroundColor == Colors.white
                ? const BorderSide(
                    width: 1.2,
                    color: Colors.black,
                  )
                : BorderSide.none,
          ),
          backgroundColor: backgroundColor,
        ),
        child: isLoading
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : Text(
                text,
                style: AppTextStyles.bold16.copyWith(
                    color: backgroundColor == Colors.white
                        ? Colors.black
                        : Colors.white),
              ),
      ),
    );
  }
}
