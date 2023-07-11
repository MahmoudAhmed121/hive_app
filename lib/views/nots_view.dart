import 'package:flutter/material.dart';
import 'package:hive_app/views/widgets/add_note_bottom_sheet.dart';
import 'package:hive_app/views/widgets/nots_body.dart';

class NotsView extends StatelessWidget {
  const NotsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              context: context,
              builder: (context) {
                return NotBottomSheet();
              },
            );
          },
          child: Icon(Icons.add),
        ),
        body: const NotsBody());
  }
}
