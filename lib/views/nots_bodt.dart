import 'package:flutter/material.dart';
import 'package:hive_app/views/widgets/custom_app_bar.dart';
import 'package:hive_app/views/widgets/custom_list_iteam.dart';

class NotsBody extends StatelessWidget {
  const NotsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add),),
      body: SafeArea(
        child: SizedBox(
          width: width,
          child: Column(
            
              children: [
                CustomAppBar(),
          Expanded(child: CustomListIteam()),
         
              ],
          ),
        ),
      ),
    );
  }
}
