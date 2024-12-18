import 'package:checkout/extention/text.dart';
import 'package:checkout/models/credit_card_model.dart';
import 'package:checkout/pages/paiment_page.dart';
import 'package:checkout/theme/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CreditCardDisplay extends StatelessWidget {
  final bool selected;
  final CreditCardModel card;
  const CreditCardDisplay(
      {super.key, required this.card, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.w),
      decoration: selected
          ? BoxDecoration(
              border: Border.all(
                  color: card.decoration.mainColor ?? AppColors.defaultFont,
                  width: 2),
              borderRadius: BorderRadius.circular(21),
            )
          : null,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(28),
            width: 352.69,
            height: 180.57,
            decoration: card.decoration.decoration.copyWith(
              borderRadius: BorderRadius.circular(17.31),
            ),
            alignment: Alignment.center,
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: SvgPicture.asset("assets/svgs/bg_card.svg"),
          ),
          Container(
            padding: const EdgeInsets.all(28),
            width: 352.69,
            height: 180.57,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Credit',
                      style:
                          context.bodyMedium.copyWith(color: AppColors.white),
                    ),
                    SvgPicture.asset("assets/svgs/visa.svg"),
                  ],
                ),
                Spacer(),
                Text(
                  "4802   2215   1183   4289",
                  style: GoogleFonts.spaceGrotesk(
                    color: Color(0xffffffff),
                    fontSize: 14,
                  ),
                ),
                19.verticalSpace,
                Text(
                  "Souley dev".toUpperCase(),
                  style: GoogleFonts.spaceGrotesk(
                    color: Color(0xffffffff),
                    fontSize: 11.54,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
