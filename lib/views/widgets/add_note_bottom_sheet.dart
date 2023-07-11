import 'package:flutter/material.dart';
import 'package:hive_app/views/widgets/custom_buttom.dart';
import 'package:hive_app/views/widgets/custom_text_form_faild.dart';

class NotBottomSheet extends StatefulWidget {
  NotBottomSheet({super.key});

  @override
  State<NotBottomSheet> createState() => _NotBottomSheetState();
}

class _NotBottomSheetState extends State<NotBottomSheet> {
  final TextEditingController textEditingControllerforTitle =
      TextEditingController();

  final TextEditingController textEditingControllerfordesc =
      TextEditingController();

  final GlobalKey<FormState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: key,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            CustomTextFormFaild(
              hintText: "Type",
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return "type is empty";
                }
                return null;
              },
              textEditingController: textEditingControllerforTitle,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormFaild(
              hintText: "Descraption",
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return "type is empty";
                }
                return null;
              },
              textEditingController: textEditingControllerfordesc,
              maxLines: 5,
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(onPressed: () {
              if(key.currentState!.validate()){

              }
            }, text: "save")
          ],
        ),
      ),
    );
  }
}
