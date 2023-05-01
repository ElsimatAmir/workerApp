import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

class MyReactiveTextField extends StatelessWidget {
  const MyReactiveTextField({
    required this.formControlName,
    required this.hint,
    this.title,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword,
    this.keyboardType,
    this.textInputFormatter,
    super.key,
  });

  final String formControlName;
  final String? title;
  final String hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? isPassword;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? textInputFormatter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title!,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ReactiveTextField(
          formControlName: formControlName,
          obscureText: isPassword ?? false,
          keyboardType: keyboardType,
          inputFormatters: textInputFormatter,
          decoration: InputDecoration(
            prefixIcon: prefixIcon == null
                ? null
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: prefixIcon,
                  ),
            suffixIcon: suffixIcon == null
                ? null
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: suffixIcon,
                  ),
            hintText: hint,
            border: const UnderlineInputBorder(),
          ),
        )
      ],
    );
  }
}
