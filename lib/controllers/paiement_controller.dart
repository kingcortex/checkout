import 'package:checkout/models/credit_card_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaiementController extends GetxController {
  List<CreditCardModel> cards = [
    CreditCardModel(
      decoration: CardDecoration(
          mainColor: Color(0xff161616),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xff161616),
                Color(0xff242424),
              ],
            ),
          )),
    ),
    CreditCardModel(
      decoration: CardDecoration(
          mainColor: Color(0xff4D26BD),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xff4D26BD),
                Color(0xff200767),
              ],
            ),
          )),
    ),
  ];

  void addCards(CreditCardModel card) {
    cards = [card, ...cards];
    update();
  }
}
