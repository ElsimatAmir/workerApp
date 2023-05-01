import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';
import 'package:worker/app/constants/constants.dart';

class MyReactiveButton extends StatelessWidget {
  const MyReactiveButton({
    required this.title,
    required this.onPressed,
    this.isBusy = false,
    this.isDisabled = false,
    this.isExpanded = true,
    this.icon,
    super.key,
  });

  final String title;
  final Widget? icon;
  final VoidCallback? onPressed;
  final bool isBusy;
  final bool isDisabled;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    final form = ReactiveForm.of(context);
    final callback =
        !isDisabled && (form == null || form.valid) ? onPressed : null;

    return isBusy
        ? AppConstants.spinner
        : ElevatedButton(
            onPressed: callback,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppConstants.defaultPadding),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColorsConstants.white,
                    ),
                  ),
                ),
                (AppConstants.defaultPadding / 2).w,
                if (icon != null) icon!,
              ],
            ),
          );
  }
}
