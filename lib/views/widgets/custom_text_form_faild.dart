import 'package:flutter/material.dart';

class CustomTextFormFaild extends StatelessWidget {
  const CustomTextFormFaild(
      {super.key,
      this.validator,
      required this.textEditingController,
      required this.hintText,
      this.maxLines});
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final String hintText;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
          hintText: hintText,
         hintTextDirection: TextDirection.rtl,
       labelText: "sdsd",
          border: buildBorder(),
          enabledBorder: buildBorder(),
          disabledBorder: buildBorder()),
      validator: validator,
      controller: textEditingController,
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: Colors.white,
        ));
  }
}
