import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Utils/Constants/common_input_formatters.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? prefix;
  final bool obscureText;
  final int? maxLines;
  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? formatters;
  final Function(String)? onChanged;
  final String? Function(BuildContext context, String? value)? validator;

  const TextFormFieldWidget({
    super.key,
    this.prefix,
    this.obscureText = false,
    this.maxLines,
    this.hintText,
    this.labelText,
    this.onChanged,
    this.validator,
    this.controller,
    this.formatters,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        obscureText: obscureText,
        maxLines: maxLines ?? 1,
        onChanged: onChanged,
        controller: controller,
        inputFormatters: [
          CommonInputFormatters.disableInitialWhiteSpace,
          if (formatters != null) ...formatters!,
        ],
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary.withOpacity(.5),
              ),
          labelText: labelText,
          prefixIcon: prefix,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          errorStyle: TextStyle(color: Colors.red.shade200),
        ),
        style: TextStyle(
          color: Colors.purple,
        ),
        keyboardType: keyboardType,
        validator: (value) {
          if (value!.trim().isEmpty) {
            return '${labelText ?? 'Field'} ${'is required'}';
          }
          if (value != null && //
              value.isNotEmpty &&
              validator != null) {
            return validator!(context, value);
          }
          return null;
        },
      ),
    );
  }
}
