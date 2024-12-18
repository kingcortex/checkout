import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/theme/color.dart';

class Setpper extends StatelessWidget {
  final int setp;
  const Setpper({
    super.key,
    required this.setp,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            35.horizontalSpace,
            SizedBox(width: 50),
            _buildLine(1),
            SizedBox(width: 50),
            _buildLine(2),
            SizedBox(
              width: 50,
              height: 44,
            ),
            35.horizontalSpace,
          ],
        ),
        Row(
          children: [
            // 35.horizontalSpace,
            _item("assets/svgs/bag-2.svg", "Cart", 1),
            const Spacer(),
            _item(
              "assets/svgs/card_bold.svg",
              "Payment",
              2,
            ),
            const Spacer(),
            _item("assets/svgs/tick-square.svg", "Confirm", 3),
            //35.horizontalSpace,
          ],
        ),
      ],
    );
  }

  Widget _item(String icon, String stepName, int i) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SizedBox(
        width: 70,
        child: Column(
          children: [
            SvgPicture.asset(
              icon,
              color: i <= setp ? AppColors.defaultFont : Colors.grey,
            ),
            Text(
              stepName,
              style: TextStyle(
                color: i <= setp ? AppColors.defaultFont : Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded _buildLine(int i) {
    return Expanded(
      child: SizedBox(
        height: 20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 2,
              color: setp >= i ? AppColors.defaultFont : Colors.grey.shade500,
            ),
          ],
        ),
      ),
    );
  }
}
