import 'package:checkout/extention/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../theme/theme/color.dart';

class FilterPaiement extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final String title;
  final String iconPath;
  final Function(int index)? ontap;
  const FilterPaiement(
      {super.key,
      required this.index,
      required this.selectedIndex,
      required this.title,
      this.ontap,
      required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: ontap != null ? () => ontap!(index) : null,
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 57.4.w, maxWidth: 173.w),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            color: index != selectedIndex ? AppColors.white : null,
            gradient: index == selectedIndex
                ? const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment(0.3, 0),
                    colors: [
                      Color(0xff3D424C),
                      Color(0xff171C26),
                    ],
                  )
                : null,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                iconPath,
                color: index == selectedIndex
                    ? AppColors.white
                    : AppColors.defaultFont,
              ),
              17.horizontalSpace,
              Text(
                title,
                style: context.bodyLarge.copyWith(
                  color: index == selectedIndex
                      ? AppColors.white
                      : AppColors.defaultFont,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
