import 'package:flutter/material.dart';
import 'package:hive_app/model/note_model.dart';
import 'package:hive_app/views/edit_note_view.dart';

class CustomIteamFornote extends StatelessWidget {
  const CustomIteamFornote({super.key, required this.notesModel});
  final NotesModel notesModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return EditNoteView();
          },
        ));
      },
      child: Container(
        padding: EdgeInsets.only(top: 24, bottom: 24, left: 16),
        decoration: BoxDecoration(
            color: Color(notesModel.color), borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                notesModel.title,
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              subtitle: Text(
                notesModel.subtitle,
                style: TextStyle(
                    fontSize: 18, color: Colors.black.withOpacity(0.4)),
              ),
              trailing: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text(
                notesModel.date,
                style: TextStyle(
                    fontSize: 18, color: Colors.white.withOpacity(0.4)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
