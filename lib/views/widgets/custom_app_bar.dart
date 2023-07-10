import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text("Note",
            style: TextStyle(
            fontSize: 24,
    
            
          ),
          ),
          Spacer(),
          IconButton(onPressed: (){}, icon: Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(8)
            ),
            child: Icon(Icons.search),
          ))
        ],
      ),
    );
  }
}
