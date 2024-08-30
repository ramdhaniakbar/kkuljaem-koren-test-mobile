import 'package:flutter/material.dart';

class MessageInlineComponent extends StatelessWidget {
  const MessageInlineComponent(
      {super.key,
      required this.message,
      required this.icons,
      required this.color});

  final String message;
  final IconData? icons;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {},
            child: Center(
              child: Icon(
                icons,
                color: color,
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Flexible(
            child: Text(
              message,
              style: TextStyle(color: color),
            ),
          )
        ],
      )),
    );
  }
}
