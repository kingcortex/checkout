import 'package:checkout/extention/text.dart';
import 'package:checkout/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../constant/size.dart';
import '../theme/theme/color.dart';

class WalletTile extends StatelessWidget {
  final bool selected;
  final String logoPath;
  final String name;
  const WalletTile(
      {super.key,
      required this.selected,
      required this.logoPath,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: DeviceUtils.appPadding),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: const Color(0xffF5F5F5),
            borderRadius: BorderRadius.circular(21),
            border: Border.all(color: AppColors.white)),
        child: Row(
          children: [
            SvgPicture.asset(logoPath),
            20.horizontalSpace,
            Text(
              name,
              style: context.bodyLarge,
            ),
            Spacer(),
            Radio(
              value: selected,
              groupValue: true,
              onChanged: (value) {},
              activeColor: AppColors.defaultFont,
            ),
          ],
        ),
      ),
    );
  }
}
