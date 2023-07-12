import 'package:flutter/material.dart';

class CustomIteamColor extends StatelessWidget {
  const CustomIteamColor({super.key, required this.isActive, required this.color});

final bool isActive ;
final Color color;

  @override
  Widget build(BuildContext context) {
    return isActive? CircleAvatar(
      radius: 38,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 34,
        backgroundColor: color,
      ),
    ): CircleAvatar(
      radius: 38,
      backgroundColor: color,
    );
  }
}