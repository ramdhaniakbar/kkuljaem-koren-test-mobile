import 'package:flutter/material.dart';
import 'package:kkuljaem_korean_mobile/constants/color_constant.dart';

class ButtonComponent extends StatelessWidget {
  const ButtonComponent({
    super.key,
    required this.buttonLabel,
    required this.onPressed,
    this.buttonColor = ColorConstant.primaryColor,
    this.disabledButton = false,
    this.textColor = Colors.white,
  });

  final String buttonLabel;
  final void Function()? onPressed;
  final Color buttonColor;
  final bool disabledButton;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disabledButton ? null : onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 45),
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        disabledBackgroundColor: buttonColor.withOpacity(.6),
      ),
      child: Text(
        buttonLabel,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
