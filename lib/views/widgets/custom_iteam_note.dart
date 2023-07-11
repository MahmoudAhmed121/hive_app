import 'package:flutter/material.dart';
import 'package:hive_app/views/edit_note_view.dart';

class CustomIteamFornote extends StatelessWidget {
  const CustomIteamFornote({super.key});

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
            color: Colors.red, borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                "Flutter Tips",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              subtitle: Text(
                "Build your career with mahmoud ahmed",
                style: TextStyle(
                    fontSize: 18, color: Colors.black.withOpacity(0.4)),
              ),
              trailing: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text(
                "My 9 2023",
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
