import 'package:flutter/material.dart';
import 'package:hive_app/views/widgets/custom_iteam_note.dart';

class CustomListIteam extends StatelessWidget {
  const CustomListIteam({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: CustomIteamFornote(),
      );
    },);
  }
}