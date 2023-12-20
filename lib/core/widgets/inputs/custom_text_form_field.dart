import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  final String? label;
  final String? hint;
  final String? errorMessage;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final IconData? prefixIcon;
  final bool? showEye;

  const CustomTextFormField({
    super.key,
    this.label,
    this.hint,
    this.errorMessage,
    this.onChanged,
    this.validator,
    this.obscureText,
    this.prefixIcon,
    this.showEye,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(40)
    );

    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(borderSide: BorderSide(color: colors.primary)),
        errorBorder: border.copyWith(borderSide: BorderSide(color: Colors.red.shade500)),
        focusedErrorBorder: border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),

        isDense: true,
        label: getLabel(),
        hintText: hint,
        focusColor: colors.primary,
        errorText: errorMessage,
        prefixIcon: getPrefixIcon(),
        suffixIcon: _showEye(),
      ),
      obscureText: getObscureText(),

    );
  }

  Icon? _showEye() {
    if (!getObscureText()) return null;
    if (showEye == null) return null;
    if (!showEye!) return null;
    return const Icon(Icons.remove_red_eye_outlined);
  }

  Text? getLabel() {
    return label != null ? Text(label!) : null;
  }

  bool getObscureText() {
    return obscureText != null ? obscureText! : false;
  }

  Icon? getPrefixIcon() {
    if (prefixIcon != null) {
      return Icon(prefixIcon);
    }
    return null;
  }
}
