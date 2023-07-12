import 'package:flutter/material.dart';
import 'package:hive_app/manager/add_cubits/add_cubit.dart';
import 'package:hive_app/views/widgets/custom_iteam_color.dart';

import '../../core/utils/constant.dart';

class CustomListForColor extends StatefulWidget {
  const CustomListForColor({super.key});

  @override
  State<CustomListForColor> createState() => _CustomListForColorState();
}

class _CustomListForColorState extends State<CustomListForColor> {
  int curentIndex = 0;

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
                  AddNotesCubit.get(context).color = myList[index];
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
