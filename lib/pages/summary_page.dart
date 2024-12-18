import 'package:checkout/constant/size.dart';
import 'package:checkout/controllers/summary_controller.dart';
import 'package:checkout/extention/text.dart';
import 'package:checkout/pages/paiment_page.dart';
import 'package:checkout/theme/theme/color.dart';
import 'package:checkout/widgets/app_bar.dart';
import 'package:checkout/widgets/cart_items.dart';
import 'package:checkout/widgets/custom_button.dart';
import 'package:checkout/widgets/setpper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SummaryController());
    return Scaffold(
      appBar: buidAppBar(title: 'Summary'),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: DeviceUtils.appPadding),
            child: Column(
              children: [
                29.verticalSpace,
                const Setpper(setp: 1,),
                23.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Items", style: context.bodyLarge),
                    Text(
                      "2 items",
                      style: context.bodyLarge.copyWith(
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
                10.verticalSpace,
                Column(
                  children: controller.items
                      .map((item) => CartItem(item: item))
                      .expand((widget) => [
                            widget,
                            15.verticalSpace, // Espacement entre les items
                          ])
                      .toList()
                    ..removeLast(), // Supprimer l'espacement après le dernier item
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xffF5F5F5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: DeviceUtils.appPadding, vertical: 21),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order Summary",
                      style: context.titleLarge,
                    ),
                    31.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Items (2)",
                          style: context.bodyLarge,
                        ),
                        Text(
                          "220\$",
                          style: context.bodyLarge,
                        )
                      ],
                    ),
                    10.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "GST",
                          style: context.bodyLarge,
                        ),
                        Text(
                          "20\$",
                          style: context.bodyLarge,
                        )
                      ],
                    ),
                    5.verticalSpace,
                    const Divider(
                      //endIndent: 14.h,
                      //indent: 14.h,
                      height: 0,
                    ),
                    17.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: context.titleMedium,
                        ),
                        Text(
                          "220\$",
                          style: context.titleMedium.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                    38.verticalSpace,
                    CustomButton(
                      onTap: () => Get.to(() => const PaimentPage()),
                      label: "Check Out",
                    ),
                    20.verticalSpace,
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
