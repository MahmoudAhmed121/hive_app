import 'package:flutter/material.dart';
import 'package:hive_app/views/widgets/custom_iteam_color.dart';

class CustomListForColor extends StatefulWidget {
  const CustomListForColor({super.key});

  @override
  State<CustomListForColor> createState() => _CustomListForColorState();
}

class _CustomListForColorState extends State<CustomListForColor> {
  int curentIndex = 0;
List<Color> myList = [
  Color(0xff58355E),
  Color(0xffE03616),
  Color(0xffFFF689),
  Color(0xffCFFFB0),
  Color(0xff5998C5),
];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: myList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
                onTap: () {
                  curentIndex = index;
                  setState(() {});
                },
                child: CustomIteamColor(isActive: curentIndex == index,
                color: myList[index],
                )),
          );
        },
      ),
    );
  }
}
