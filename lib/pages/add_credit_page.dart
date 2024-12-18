import 'package:checkout/constant/size.dart';
import 'package:checkout/controllers/paiement_controller.dart';
import 'package:checkout/extention/text.dart';
import 'package:checkout/models/credit_card_model.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../theme/theme/color.dart';
import '../widgets/custom_textfield.dart';

class AddCreditCardPage extends StatefulWidget {
  const AddCreditCardPage({super.key});

  @override
  _AddCreditCardPageState createState() => _AddCreditCardPageState();
}

class _AddCreditCardPageState extends State<AddCreditCardPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isFront = true;

  final FocusNode _numberNode = FocusNode();
  final FocusNode _nameNode = FocusNode();
  final FocusNode _mounthNode = FocusNode();
  final FocusNode _yearfocusNode = FocusNode();
  final FocusNode _cvvNode = FocusNode();

  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mounthController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  final Offset _numberPosition = const Offset(82, 25);
  final Offset _namePosition = const Offset(145, 25);
  final Offset _datePosition = const Offset(145, 230);

  double _selectorWidth = 280;

  Offset _currentPosition = const Offset(82, 25);

  CardDecoration _selectedStyle = CardDecoration(
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
      ));

  List<CardDecoration> styles = [
    CardDecoration(
      mainColor: const Color(0xff161616),
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
      ),
    ),
    CardDecoration(
      mainColor: const Color(0xffD567DE),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xffD567DE),
            Color(0xff5A0071),
          ],
        ),
      ),
    ),
    CardDecoration(
      mainColor: const Color(0xff1E88E5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xff1E88E5),
            Color(0xff1565C0),
          ],
        ),
      ),
    ),
    CardDecoration(
      mainColor: const Color(0xff43A047),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xff43A047),
            Color(0xff2E7D32),
          ],
        ),
      ),
    ),
    CardDecoration(
      mainColor: const Color(0xffFDD835),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xffFDD835),
            Color(0xffFBC02D),
          ],
        ),
      ),
    ),
    CardDecoration(
      mainColor: const Color(0xffFF7043),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xffFF7043),
            Color(0xffD84315),
          ],
        ),
      ),
    ),
    CardDecoration(
      mainColor: const Color(0xff8E24AA),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xff8E24AA),
            Color(0xff6A1B9A),
          ],
        ),
      ),
    ),
    CardDecoration(
      mainColor: const Color(0xff4DB6AC),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xff4DB6AC),
            Color(0xff00897B),
          ],
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    focusInit();
    textControllerInit();
  }

  void textControllerInit() {
    _numberController.addListener(() {
      setState(() {});
    });
    _nameController.addListener(() {
      setState(() {});
    });
    _mounthController.addListener(() {
      setState(() {});
      if (_mounthController.text.length >= 2) {
        _focusTextField();
      }
    });
    _yearController.addListener(() {
      setState(() {});
    });
    _cvvController.addListener(() {
      setState(() {});
    });
  }

  void _focusTextField() {
    FocusScope.of(context).requestFocus(_yearfocusNode);
  }

  void focusInit() {
    // Ajout des écouteurs pour chaque FocusNode
    _numberNode.addListener(() {
      if (_numberNode.hasFocus) {
        if (!_isFront) _flipCard();
        setState(() {
          _currentPosition = _numberPosition;
          _selectorWidth = 280;
        });
      }
    });

    _nameNode.addListener(() {
      if (_nameNode.hasFocus) {
        if (!_isFront) _flipCard();
        setState(() {
          _currentPosition = _namePosition;
          _selectorWidth = 200;
        });
      }
    });

    _mounthNode.addListener(() {
      if (_mounthNode.hasFocus) {
        if (!_isFront) _flipCard();
        setState(() {
          _currentPosition = _datePosition;
          _selectorWidth = 110;
        });
      }
    });

    _yearfocusNode.addListener(() {
      if (_yearfocusNode.hasFocus) {
        if (!_isFront) _flipCard();
        setState(() {
          _currentPosition = _datePosition;
          _selectorWidth = 110;
        });
      }
    });

    _cvvNode.addListener(() {
      if (_cvvNode.hasFocus) {
        if (_isFront) _flipCard();
      }
    });
  }

  void _flipCard() {
    if (_isFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    setState(() {
      _isFront = !_isFront;
    });
  }

  @override
  void dispose() {
    // Dispose des AnimationControllers
    _controller.dispose();

    // Dispose des FocusNodes
    _numberNode.dispose();
    _nameNode.dispose();
    _mounthNode.dispose();
    _yearfocusNode.dispose();
    _cvvNode.dispose();

    // Dispose des TextEditingControllers
    _numberController.dispose();
    _nameController.dispose();
    _mounthController.dispose();
    _yearController.dispose();
    _cvvController.dispose();

    super.dispose();
  }

  final maskNumber = MaskTextInputFormatter(
    mask: '#### #### #### ####',
    //type: MaskAutoCompletionType.lazy,
  );
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).addListener(() => setState(() {}));
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leadingWidth: 100,
        leading: TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            "Cancel",
            style: context.bodyLarge,
          ),
        ),
        title: Text(
          "Add New Card",
          style: context.titleMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.find<PaiementController>()
                  .addCards(CreditCardModel(decoration: _selectedStyle));
              Get.back();
            },
            child: Text(
              "Add",
              style: context.bodyLarge,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [_buidCard()],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: DeviceUtils.appPadding, vertical: 20),
                child: SizedBox(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: styles
                        .map(
                          (decoration) => ZoomTapAnimation(
                            onTap: () {
                              setState(() {
                                _selectedStyle = decoration;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: decoration.mainColor,
                                border: Border.all(
                                  color: const Color(0xffFFFFFF),
                                  width: 3,
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: <Widget>[
                    CustomTextField(
                      rightIcon: "assets/svgs/card_bold.svg",
                      inputFormatters: [maskNumber],
                      keyboardType: TextInputType.number,
                      controller: _numberController,
                      focusNode: _numberNode,
                      label: "Card number",
                      //maxlength: 16,
                    ),
                    15.verticalSpace,
                    CustomTextField(
                      rightIcon: "assets/svgs/profile-circle.svg",
                      keyboardType: TextInputType.name,
                      controller: _nameController,
                      focusNode: _nameNode,
                      label: "Holder name",
                    ),
                    15.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            rightIcon: "assets/svgs/calendar-2.svg",
                            keyboardType: TextInputType.number,
                            maxlength: 2,
                            controller: _mounthController,
                            focusNode: _mounthNode,
                            label: "Mounth ",
                          ),
                        ),
                        15.horizontalSpace,
                        Expanded(
                          child: CustomTextField(
                            rightIcon: "assets/svgs/calendar-2.svg",
                            keyboardType: TextInputType.number,
                            maxlength: 2,
                            controller: _yearController,
                            focusNode: _yearfocusNode,
                            label: "Year ",
                          ),
                        ),
                        15.horizontalSpace,
                        Expanded(
                          child: CustomTextField(
                            rightIcon: "assets/svgs/lock.svg",
                            controller: _cvvController,
                            keyboardType: TextInputType.number,
                            focusNode: _cvvNode,
                            label: "CVV",
                            maxlength: 3,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _buidCard() {
    return GestureDetector(
      onTap: _flipCard,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final angle = _animation.value * 3.14; // Angle de rotation
          final isFront = angle < 3.14 / 2 || angle > 3.14 * 3 / 2;

          return Transform(
            alignment: Alignment.center,
            transform: _buildPerspectiveTransform(angle),
            child: isFront ? _buildFront() : _buildBack(),
          );
        },
      ),
    );
  }

  Matrix4 _buildPerspectiveTransform(double angle) {
    const perspective = 0.002; // Ajuste l'effet de profondeur
    return Matrix4.identity()
      ..setEntry(3, 2, perspective) // Ajout de la perspective
      ..rotateY(angle);
  }

  Widget _buildFront() {
    return Stack(
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(31),
              width: 352.69,
              height: 180.57,
              decoration: _selectedStyle.decoration,
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Credit',
                        style: GoogleFonts.spaceGrotesk(color: AppColors.white),
                      ),
                      SvgPicture.asset("assets/svgs/visa.svg"),
                    ],
                  ),
                  const Spacer(),
                  Wrap(
                    children: _buildMaskedText(
                        _numberController.text.replaceAll(RegExp(r'\s+'), '')),
                  ),
                  19.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 40,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "Card holder name",
                              style: TextStyle(
                                  color: Color(0xffffffff), fontSize: 12),
                            ),
                            _buildOtherText(_nameController.text,
                                    hintText: "Your name")
                                .fold(
                              (isLeft) => Wrap(
                                children: isLeft,
                              ),
                              (isRigth) => isRigth,
                            )
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Expiry date",
                            style: TextStyle(
                                color: Color(0xffffffff), fontSize: 12),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 20,
                                width: 27,
                                child: _buildOtherText(
                                  _mounthController.text,
                                  hintText: "MM",
                                ).fold(
                                    (isLeft) => Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: isLeft,
                                        ),
                                    (isRigth) => isRigth),
                              ),
                              const Text(
                                "/",
                                style: TextStyle(
                                  color: Color(0xffffffff),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                                width: 22,
                                child: _buildOtherText(
                                  _yearController.text,
                                  hintText: "YY",
                                ).fold(
                                    (isLeft) => Wrap(
                                          children: isLeft,
                                        ),
                                    (isRigth) => isRigth),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: SvgPicture.asset("assets/svgs/bg_card.svg"),
            ),
          ],
        ),
        // AnimatedPositioned(
        //   duration: Durations.short4,
        //   top: _currentPosition.dx,
        //   left: _currentPosition.dy,
        //   child: AnimatedContainer(
        //     curve: Curves.easeInOut,
        //     duration: Durations.medium1,
        //     height: 55,
        //     width: _selectorWidth,
        //     decoration: BoxDecoration(
        //       border: Border.all(
        //         color: FocusScope.of(context).hasFocus
        //             ? const Color(0xffffffff)
        //             : Colors.transparent,
        //         width: 2,
        //       ),
        //       borderRadius: BorderRadius.circular(8),
        //     ),
        //   ),
        // )
      ],
    );
  }

  Widget _buildBack() {
    return Transform(
      transform: Matrix4.rotationY(3.14),
      alignment: Alignment.center,
      child: Container(
        width: 352.69,
        height: 180.57,
        decoration: _selectedStyle.decoration,
        child: Column(
          children: [
            31.verticalSpace,
            Container(
              width: double.infinity,
              height: 40,
              color: Colors.black,
            ),
            40.verticalSpace,
            const Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  "CVV",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              alignment: Alignment.centerRight,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Wrap(
                children: _buildMaskedText(
                  _cvvController.text,
                  length: 3,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff000000),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Construit une liste de widgets pour afficher chaque caractère
Either<List<Widget>, Widget> _buildOtherText(String input, {String? hintText}) {
  TextStyle style = GoogleFonts.spaceGrotesk(
    color: Color(0xffffffff),
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  List<Widget> characters = [];
  int totalLength = 30;

  if (input.isEmpty) {
    return Right(Text(
      hintText ?? "Hello World",
      style: style,
    ));
  }

  for (int i = 0; i < totalLength; i++) {
    // Si le caractère existe dans l'input
    if (i < input.length) {
      // Le dernier caractère saisi est affiché
      if (i == input.length - 1) {
        characters.add(
          _buildAnimatedCharacter(input[i], 20, style: style),
        );
      } else {
        // Masquer les autres caractères
        characters.add(_buildAnimatedCharacter(input[i], 20, style: style));
      }
    } else {
      // Remplir avec des astérisques masqués
      characters.add(_buildAnimatedCharacter('', 10));
    }

    // // Ajouter un espace visuel tous les 4 caractères
    // if ((i + 1) % 4 == 0 && i != totalLength - 1) {
    //   characters.add(const SizedBox(width: 8));
    // }
  }

  return Left(characters);
}

/// Construit une liste de widgets pour afficher chaque caractère
List<Widget> _buildMaskedText(String input, {int? length, TextStyle? style}) {
  List<Widget> characters = [];
  int totalLength = length ?? 16;
  print(style);

  for (int i = 0; i < totalLength; i++) {
    // Si le caractère existe dans l'input
    if (i < input.length) {
      // Le dernier caractère saisi est affiché
      if (i == input.length - 1) {
        characters.add(
          _buildAnimatedCharacter(input[i], 20, style: style),
        );
      } else {
        // Masquer les autres caractères
        characters.add(_buildAnimatedCharacter(input[i], 20, style: style));
      }
    } else {
      // Remplir avec des astérisques masqués
      characters.add(_buildAnimatedCharacter('*', 22, style: style));
    }

    // Ajouter un espace visuel tous les 4 caractères
    if ((i + 1) % 4 == 0 && i != totalLength - 1) {
      characters.add(const SizedBox(width: 8));
    }
  }

  return characters;
}

/// Construit un widget animé pour un caractère
Widget _buildAnimatedCharacter(String character, double size,
    {TextStyle? style}) {
  return AnimatedSwitcher(
    duration: const Duration(milliseconds: 300),
    transitionBuilder: (Widget child, Animation<double> animation) {
      return ScaleTransition(
        scale: animation,
        child: FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
    },
    child: Text(
      character,
      key: ValueKey<String>(character),
      style: style ??
          GoogleFonts.spaceGrotesk(
            fontSize: size,
            fontWeight: FontWeight.bold,
            color: const Color(0xffffffff),
          ),
    ),
  );
}
