import 'package:flutter/material.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';
import 'package:worker/app/constants/constants.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    required this.onPressed,
    required this.title,
    this.icon,
    super.key,
  });

  final Function() onPressed;
  final String title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(icon),
            AppConstants.defaultPadding.w,
          ],
          Padding(
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            child: Text(
              title,
              style: const TextStyle(
                color: AppColorsConstants.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
