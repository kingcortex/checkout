import 'package:checkout/extention/text.dart';
import 'package:checkout/theme/theme/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Size? size;
  final bool canLoad;
  final dynamic Function()? onTap;
  const CustomButton({
    super.key,
    this.size,
    required this.label,
    this.onTap,
    this.canLoad = false,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: size?.height ?? 55.h,
        width: size?.width ?? double.infinity,
        decoration: BoxDecoration(
          color: AppColors.defaultFont,
          borderRadius: BorderRadius.circular(28),
        ),
        child: !canLoad
            ? Text(
                label,
                style: context.titleLarge.copyWith(color: AppColors.white),
              )
            : CupertinoActivityIndicator(
                color: AppColors.white,
              ),
      ),
    );
  }
}
