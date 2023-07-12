import 'package:flutter/widgets.dart';
import 'package:hive_app/core/utils/constant.dart';
import 'package:hive_app/model/note_model.dart';
import 'package:hive_app/views/widgets/custom_iteam_color.dart';

class EditCustomListColor extends StatefulWidget {
  const EditCustomListColor({super.key, required this.notesModel});
  final NotesModel notesModel;
  @override
  State<EditCustomListColor> createState() => _EditCustomListColorState();
}

class _EditCustomListColorState extends State<EditCustomListColor> {
  late int curentIndex;
  @override
  void initState() {
    super.initState();
    curentIndex = myList.indexOf(Color(widget.notesModel.color));
  }

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
                  widget.notesModel.color = myList[index].value;
                  setState(() {});
                },
                child: CustomIteamColor(
                  isActive: curentIndex == index,
                  color: myList[index],
                )),
          );
        },
      ),
    );
  }
}
