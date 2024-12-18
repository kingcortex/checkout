import 'package:carousel_slider/carousel_slider.dart';
import 'package:checkout/controllers/paiement_controller.dart';
import 'package:checkout/extention/text.dart';
import 'package:checkout/pages/add_credit_page.dart';
import 'package:checkout/theme/theme/color.dart';
import 'package:checkout/widgets/app_bar.dart';
import 'package:checkout/widgets/credit_card_display.dart';
import 'package:checkout/widgets/filter_card.dart';
import 'package:checkout/widgets/wallet_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../constant/size.dart';
import '../widgets/custom_button.dart';
import '../widgets/setpper.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buidAppBar(
        title: "Paiment",
        onTapBack: () => Get.back(),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: DeviceUtils.appPadding),
                child: Column(
                  children: [
                    29.verticalSpace,
                    const Setpper(setp: 3),
                  ],
                ),
              ),
              21.verticalSpace,
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      147.verticalSpace,
                      Image.asset("assets/pngs/check 1.png"),
                      30.verticalSpace,
                      Text(
                        "Payment Received",
                        style: context.titleLarge
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Your Order Has been placed",
                        style: context.bodyLarge,
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.all(DeviceUtils.appPadding),
                        child: const CustomButton(label: "Continue"),
                      ),
                      80.verticalSpace,
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
