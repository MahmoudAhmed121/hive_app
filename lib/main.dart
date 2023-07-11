import 'package:flutter/material.dart';
import 'package:hive_app/views/nots_view.dart';

void main() {
  runApp(const HiveApp());
}

class HiveApp extends StatelessWidget {
  const HiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,

      ),
      
      home:NotsView() ,
      
    );
  }
}

