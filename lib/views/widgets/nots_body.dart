import 'package:flutter/material.dart';
import 'package:hive_app/views/widgets/custom_app_bar.dart';
import 'package:hive_app/views/widgets/custom_list_iteam.dart';

class NotsBody extends StatelessWidget {
  const NotsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return 
     
      SafeArea(
        child: SizedBox(
          width: width,
          child: Column(
            children: [
              CustomAppBar(text: "Note",icon: Icons.search),
              Expanded(child: CustomListIteam()),
            ],
          ),
        ),
      );
   
  }
}
