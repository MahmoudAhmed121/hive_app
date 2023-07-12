import 'package:flutter/material.dart';
import 'package:hive_app/manager/notes/notes_cubit.dart';
import 'package:hive_app/model/note_model.dart';
import 'package:hive_app/views/widgets/custom_app_bar.dart';
import 'package:hive_app/views/widgets/custom_text_form_faild.dart';

class EditNoteBody extends StatelessWidget {
  EditNoteBody({super.key, required this.notesModel});
  final TextEditingController textFormFieldforTitle = TextEditingController();
  final TextEditingController textFormFieldforContent = TextEditingController();
  final NotesModel notesModel;
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
              CustomAppBar(
                text: "Edit Note",
                icon: Icons.check,
                onPressed: () {
                  if (textFormFieldforTitle.text.length <= 0) {
                    print('x');
                    notesModel.title;
                  } else {
                    notesModel.title = textFormFieldforTitle.text;
                  }
                  if (textFormFieldforContent.text.length <= 0) {
                    notesModel.subtitle;
                  } else {
                    notesModel.subtitle = textFormFieldforContent.text;
                  }

                  notesModel.save();
                  NotesCubit.get(context).fetchAllNote();
                  Navigator.pop(context);
                },
              ),
              CustomTextFormFaild(
                textEditingController: textFormFieldforTitle,
                hintText: "Title",
              ),
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
