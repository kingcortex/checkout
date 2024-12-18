import 'package:checkout/extention/text.dart';
import 'package:checkout/theme/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextField extends StatelessWidget {
  final int? maxLength;
  final TextAlign? textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final String? rightIcon;
  final Widget? suffixIcon;
  final String label;
  final FocusNode focusNode;
  final String? hintText;
  final int? maxlength;
  final bool isDate;
  final bool? isReadOnly;
  final String? Function(String?)? validtor;
  final void Function()? onTap;
  final void Function(String)? onchange;
  final Widget? surfix;
  final TextInputType? keyboardType;
  const CustomTextField({
    super.key,
    this.controller,
    this.rightIcon,
    this.hintText,
    this.onTap,
    this.isDate = false,
    this.maxLength,
    this.textAlign,
    this.inputFormatters,
    this.validtor,
    this.surfix,
    this.suffixIcon,
    this.isReadOnly = false,
    this.onchange,
    this.keyboardType,
    required this.label,
    required this.focusNode,
    this.maxlength,
  });

  @override
  Widget build(BuildContext context) {
    Widget? rightIconWidget = rightIcon != null
        ? Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: SvgPicture.asset(
              rightIcon!,
              color: AppColors.defaultFont,
            ),
          )
        : null;

    return Container(
      decoration: BoxDecoration(
          color: const Color(0xffD9DEE7),
          borderRadius: BorderRadius.circular(8)),
      child: TextFormField(
        focusNode: focusNode,
        keyboardType: keyboardType,
        onChanged: onchange,
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        validator: validtor,
        inputFormatters: inputFormatters,
        textAlign: textAlign ?? TextAlign.start,
        maxLength: maxLength,
        readOnly: isDate || isReadOnly!,
        onTap: onTap,

        cursorHeight: 20.h,
        //cursorColor: AppColors.pickledBean900,
        style: context.bodyMedium,
        controller: controller,
        decoration: InputDecoration(
          hintStyle: context.bodyMedium,
          //suffixIcon: surfix,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          hintText: label,
          suffixIconConstraints: const BoxConstraints(),
          suffixIcon: suffixIcon ?? rightIconWidget,
          border: InputBorder.none,
          //enabledBorder: classicUnderLineBorderSide,
        ),
      ),
    );
  }
}
