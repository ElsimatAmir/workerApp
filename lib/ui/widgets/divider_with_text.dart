import 'package:flutter/material.dart';
import 'package:worker/app/constants/constants.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({
    required this.middleText,
    super.key,
  });

  final String middleText;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Expanded(
        child: Divider(
          thickness: 1,
          color: AppColorsConstants.lightGrey,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.defaultPadding / 3,
        ),
        child: Text(
          middleText,
          style: const TextStyle(color: AppColorsConstants.lightGrey),
        ),
      ),
      const Expanded(
        child: Divider(
          thickness: 1,
          color: AppColorsConstants.lightGrey,
        ),
      ),
    ]);
  }
}
