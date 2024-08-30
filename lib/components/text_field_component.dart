import 'package:flutter/material.dart';
import 'package:kkuljaem_korean_mobile/components/message_inline_component.dart';

class TextFieldComponent extends StatelessWidget {
  const TextFieldComponent({
    super.key,
    required this.controller,
    required this.hintText,
    this.textInputType = TextInputType.text,
    this.obscure = false,
    this.onChanged,
    this.readOnly = false,
    this.errorMessage = '',
    this.label,
    this.shadow = true,
    this.focusNode,
    this.borderColor,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  final bool obscure;
  final void Function(String)? onChanged;
  final bool readOnly;
  final bool? shadow;
  final String errorMessage;
  final String? label;
  final FocusNode? focusNode;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Text(
                  label!,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              )
            : const SizedBox(),
        Container(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(width: 1.0, color: borderColor ?? Colors.grey),
            boxShadow: shadow == true
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 7,
                    ),
                  ]
                : null,
          ),
          child: TextFormField(
            controller: controller,
            focusNode: focusNode,
            keyboardType: textInputType,
            readOnly: readOnly,
            obscureText: obscure,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(0),
              hintStyle: const TextStyle(
                height: 1,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        errorMessage != ''
            ? MessageInlineComponent(
                message: errorMessage,
                icons: Icons.cancel,
                color: Colors.red,
              )
            : const SizedBox(),
      ],
    );
  }
}
