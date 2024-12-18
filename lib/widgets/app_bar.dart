import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar buidAppBar({required String title, void Function()? onTapBack}) {
  return AppBar(
    title: Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 25,
        fontWeight: FontWeight.w500,
      ),
    ),
    leading: IconButton(
      onPressed: onTapBack,
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    ),
  );
}
