import 'package:checkout/extention/text.dart';
import 'package:checkout/models/cart_item_model.dart';
import 'package:checkout/theme/theme/color.dart';
import 'package:checkout/widgets/counter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CartItem extends StatelessWidget {
  final CartItemModel item;
  const CartItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 147.h,
      padding: EdgeInsets.all(13.r),
      decoration: BoxDecoration(
        color: const Color(0xffF5F5F5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 1,
          color: AppColors.white,
        ),
      ),
      child: LayoutBuilder(builder: (context, constrains) {
        return Row(
          children: [
            Container(
              height: constrains.maxWidth * 0.35,
              width: constrains.maxWidth * 0.35,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(11),
              ),
              child: Image.asset(item.imagePath),
            ),
            SizedBox(
              height: constrains.maxHeight,
              width: constrains.maxWidth * .65,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      5.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nike Stan Smith",
                            style: context.titleSmall
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Apple green",
                            style: context.bodyMedium.copyWith(
                              height: 1,
                              color: const Color(0xff171C26).withOpacity(.30),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(6.0).r,
                        height: 35.h,
                        width: 35.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.error100,
                        ),
                        child: SvgPicture.asset("assets/svgs/trash.svg"),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      5.horizontalSpace,
                      const CounterWidget(),
                      const Spacer(),
                      Text(
                        "100\$",
                        style: context.titleMedium
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
