import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField(
      {super.key,
      required this.onSaved,
      required this.hintText,
      this.textEditingController});
  final void Function(String?) onSaved;
  final String hintText;
  final TextEditingController? textEditingController;
  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFromField(
      controller: widget.textEditingController,
      onSaved: widget.onSaved,
      hintText: widget.hintText,
      obscureText: isVisible,
      keyboardType: TextInputType.visiblePassword,
      suffixIcon: IconButton(
        onPressed: () {
          if (isVisible) {
            setState(() {
              isVisible = false;
            });
          } else {
            setState(() {
              isVisible = true;
            });
          }
        },
        icon: isVisible
            ? const Icon(Icons.visibility)
            : const Icon(Icons.visibility_off),
      ),
    );
  }
}
