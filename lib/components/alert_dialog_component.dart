import 'package:flutter/material.dart';

class AlertDialogComponent extends StatelessWidget {
  const AlertDialogComponent(
      {super.key,
      this.title,
      required this.description,
      required this.imageLocation,
      required this.actionWidget});

  final String? title;
  final String description;
  final String imageLocation;
  final Widget actionWidget;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              title != null
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        title!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                    )
                  : const SizedBox(),
              Image.asset(
                imageLocation,
                width: 80.0,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                description,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 25.0,
              ),
              actionWidget,
            ],
          ),
        ),
      ),
    );
  }
}
