import 'package:flutter/material.dart';

class CreditCardModel {
  final CardDecoration decoration;

  CreditCardModel({required this.decoration});
}

class CardDecoration {
  final Color mainColor;
  final BoxDecoration decoration;

  CardDecoration({required this.mainColor, required this.decoration});
}
