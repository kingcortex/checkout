import 'package:carousel_slider/carousel_slider.dart';
import 'package:checkout/controllers/paiement_controller.dart';
import 'package:checkout/extention/text.dart';
import 'package:checkout/pages/add_credit_page.dart';
import 'package:checkout/pages/success_page.dart';
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

class PaimentPage extends StatefulWidget {
  const PaimentPage({super.key});

  @override
  State<PaimentPage> createState() => _PaimentPageState();
}

class _PaimentPageState extends State<PaimentPage>
    with SingleTickerProviderStateMixin {
  int _selectedCardIndex = 0;
  int _pageIndex = 0;
  bool canLoad = false;

  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PaiementController());
    return Scaffold(
      appBar: buidAppBar(
        title: "Paiment",
        onTapBack: () => Get.back(),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: DeviceUtils.appPadding),
                child: Column(
                  children: [
                    29.verticalSpace,
                    const Setpper(setp: 2),
                    23.verticalSpace,
                    Row(
                      children: [
                        Text("Select Your Payment Method",
                            style: context.bodyLarge),
                      ],
                    ),
                    11.verticalSpace,
                    SizedBox(
                      height: 49,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          FilterPaiement(
                            ontap: (index) async {
                              _pageController.previousPage(
                                duration: Durations.medium1,
                                curve: Curves.easeInOut,
                              );
                            },
                            iconPath: "assets/svgs/card_bold.svg",
                            index: _pageIndex,
                            selectedIndex: 0,
                            title: "Credit Card",
                          ),
                          24.horizontalSpace,
                          FilterPaiement(
                            ontap: (index) async {
                              _pageController.nextPage(
                                duration: Durations.medium1,
                                curve: Curves.easeInOut,
                              );
                            },
                            iconPath: "assets/svgs/card_bold.svg",
                            index: _pageIndex,
                            selectedIndex: 1,
                            title: "Wallet",
                          ),
                        ],
                      ),
                    ),
                    15.verticalSpace,
                  ],
                ),
              ),
              Expanded(
                child: PageView(
                  onPageChanged: (value) {
                    setState(() {
                      _pageIndex = value;
                    });
                  },
                  controller: _pageController,
                  children: [
                    _cardPage(controller),
                    Column(
                      children: [
                        const WalletTile(
                          name: 'Paypal',
                          selected: true,
                          logoPath: 'assets/svgs/paypal-2.svg',
                        ),
                        20.verticalSpace,
                        const WalletTile(
                          name: 'G Pay',
                          selected: false,
                          logoPath: 'assets/svgs/google-pay.svg',
                        ),
                        20.verticalSpace,
                        const WalletTile(
                          name: 'Apple Pay',
                          selected: false,
                          logoPath: 'assets/svgs/apple-pay.svg',
                        ),
                        30.verticalSpace,
                        _addButton(context)
                      ],
                    )
                  ],
                ),
              ),
            ],
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
                      "Payment Summary",
                      style: context.titleLarge,
                    ),
                    25.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: context.titleSmall,
                        ),
                        Text(
                          "220\$",
                          style: context.titleMedium.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                    25.verticalSpace,
                    CustomButton(
                      canLoad: canLoad,
                      label: "Pay Now",
                      onTap: () {
                        setState(() {
                          canLoad = true;
                        });
                        Future.delayed(Duration(seconds: 2), () {
                          Get.to(() => SuccessPage());
                        });
                      },
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

  Widget _addButton(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () {
        showFullScreenDialog(context);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: DeviceUtils.appPadding),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
            color: const Color(0xffF5F5F5),
            borderRadius: BorderRadius.circular(21),
            border: Border.all(color: AppColors.white)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _pageIndex == 0 ? "Add New Card" : "Add New Wallet",
              style: context.bodyLarge,
            ),
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black87, width: 1),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.black87,
                size: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardPage(PaiementController controller) {
    return GetBuilder<PaiementController>(builder: (ctx) {
      return Column(
        children: [
          CarouselSlider.builder(
            itemCount: controller.cards.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    CreditCardDisplay(
              selected: _selectedCardIndex == itemIndex,
              card: controller.cards[itemIndex],
            ),
            options: CarouselOptions(
              autoPlay: false,
              enlargeCenterPage: true,
              viewportFraction: 0.8,
              aspectRatio: 2.0,
              height: 191.h,
              initialPage: 0,
              reverse: false,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) => setState(
                () {
                  _selectedCardIndex = index;
                },
              ),
            ),
          ),
          20.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < controller.cards.length; i++)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  height: 8,
                  width: i == _selectedCardIndex ? 36 : 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: const Color(0xff171C26),
                  ),
                )
            ],
          ),
          23.verticalSpace,
          _addButton(context)
        ],
      );
    });
  }
}

void showFullScreenDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierLabel: '',
    barrierColor: Colors.black.withOpacity(0.5), // Background transparency
    transitionDuration:
        const Duration(milliseconds: 300), // Duration of the animation
    pageBuilder: (BuildContext buildContext, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return const AddCreditCardPage();
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final tween = Tween<Offset>(
        begin: const Offset(0, 1), // Start off-screen (bottom)
        end: Offset.zero, // End on-screen
      );

      final opacityTween = Tween<double>(begin: 0, end: 1);

      return SlideTransition(
        position: tween.animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut, // Animation curve
        )),
        child: FadeTransition(
          opacity: opacityTween.animate(animation),
          child: child,
        ),
      );
    },
  );
}
