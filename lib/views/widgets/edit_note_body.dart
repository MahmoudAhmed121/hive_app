import 'package:flutter/material.dart';
import 'package:hive_app/views/widgets/custom_app_bar.dart';
import 'package:hive_app/views/widgets/custom_text_form_faild.dart';

class EditNoteBody extends StatelessWidget {
  EditNoteBody({super.key});
  final TextEditingController textFormFieldforTitle = TextEditingController();
  final TextEditingController textFormFieldforContent = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SizedBox(
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              CustomAppBar(text: "Edit Note", icon: Icons.check),
              CustomTextFormFaild(
                  textEditingController: textFormFieldforTitle,
                  hintText: "Title"),
              SizedBox(
                height: 20,
              ),
              CustomTextFormFaild(
                textEditingController: textFormFieldforContent,
                hintText: "content",
                maxLines: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
