import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.img,
    required this.text,
    this.onTap,
    this.color = const Color(0xff949D9E),
  });
  final String img, text;
  final void Function()? onTap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.all(0),
      leading: SvgPicture.asset(
        img,
        height: 25,
        colorFilter:
            const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
      ),
      title: Text(
        text,
        style: AppTextStyles.semiBold16.copyWith(color: color),
      ),
      trailing: Transform(
        transform: Matrix4.rotationY(pi),
        child: const Icon(
          Icons.arrow_back_ios,
          size: 21,
        ),
      ),
    );
  }
}
