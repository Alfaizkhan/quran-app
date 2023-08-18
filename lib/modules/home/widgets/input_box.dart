import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_app/common/constants/constant.dart';

class InputBox extends StatelessWidget {
  const InputBox({
    super.key,
    this.onChanged,
    this.labelText,
    this.enabled = true,
    this.autofocus = false,
    this.formatter,
    this.keyboardType,
    this.maxLength,
    this.controller,
  });

  final ValueChanged<String>? onChanged;
  final String? labelText;
  final bool enabled;
  final bool autofocus;
  final List<TextInputFormatter>? formatter;
  final TextInputType? keyboardType;
  final int? maxLength;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor2,
        border: Border.all(color: backgroundColor, width: 4),
        borderRadius: BorderRadius.circular(48),
      ),
      child: TextFormField(
        enabled: enabled,
        cursorColor: backgroundColor,
        controller: controller,
        onChanged: onChanged,
        style: inputText,
        autofocus: autofocus,
        inputFormatters: formatter,
        keyboardType: keyboardType,
        maxLength: maxLength,
        decoration: InputDecoration(
          isDense: true,
          hintText: labelText,
          hintStyle: inputLabel,
          alignLabelWithHint: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          border: InputBorder.none,
          counterText: '',
        ),
      ),
    );
  }
}
