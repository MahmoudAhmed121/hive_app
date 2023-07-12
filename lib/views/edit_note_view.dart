import 'package:flutter/material.dart';
import 'package:hive_app/model/note_model.dart';
import 'package:hive_app/views/widgets/edit_note_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.notesModel});
final NotesModel notesModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNoteBody(notesModel: notesModel),
    );
  }
}