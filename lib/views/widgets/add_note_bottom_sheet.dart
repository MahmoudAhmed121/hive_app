import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_app/manager/add_cubits/add_cubit.dart';
import 'package:hive_app/manager/notes/notes_cubit.dart';
import 'package:hive_app/model/note_model.dart';
import 'package:hive_app/views/widgets/custom_buttom.dart';
import 'package:hive_app/views/widgets/custom_text_form_faild.dart';
import 'package:intl/intl.dart';

class NotBottomSheet extends StatefulWidget {
  NotBottomSheet({super.key});

  @override
  State<NotBottomSheet> createState() => _NotBottomSheetState();
}

class _NotBottomSheetState extends State<NotBottomSheet> {
  final TextEditingController textEditingControllerforTitle =
      TextEditingController();

  final TextEditingController textEditingControllerfordesc =
      TextEditingController();

  final GlobalKey<FormState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubit(),
      child: Padding(
        padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: BlocConsumer<AddNotesCubit, AddNoteState>(
            listener: (context, state) {
              if (state is AddNotesSuccess) {
                NotesCubit.get(context).fetchAllNote();
                Navigator.pop(context);
              }
              if (state is AddNotesFailure) {}
            },
            builder: (context, state) {
              return AbsorbPointer(
                absorbing: state is AddNotesLoading ? true : false,
                child: Form(
                  key: key,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormFaild(
                        hintText: "Type",
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "type is empty";
                          }
                          return null;
                        },
                        textEditingController: textEditingControllerforTitle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormFaild(
                        hintText: "Descraption",
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "type is empty";
                          }
                          return null;
                        },
                        textEditingController: textEditingControllerfordesc,
                        maxLines: 5,
                      ),
                        SizedBox(
                        height: 30,
                      ),
                      CustomListForColor(),
                      SizedBox(
                        height: 30,
                      ),
                      ConditionalBuilder(
                        condition: state is AddNotesLoading ? false : true,
                        builder: (context) {
                          return CustomButton(
                              onPressed: () {
                                var dataTime = DateTime.now();
                                var forMateDateTime =
                                    DateFormat("dd-MM-yyyy").format(dataTime);
                                if (key.currentState!.validate()) {
                                  var notesModel = NotesModel(
                                      title: textEditingControllerforTitle.text,
                                      subtitle:
                                          textEditingControllerfordesc.text,
                                      color: Colors.blue.value,
                                      date: forMateDateTime);
                                  AddNotesCubit.get(context).add(notesModel);
                                }
                              },
                              text: "add");
                        },
                        fallback: (context) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CustomIteamColor extends StatelessWidget {
  const CustomIteamColor({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 38,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 34,
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class CustomListForColor extends StatelessWidget {
  const CustomListForColor({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 *2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CustomIteamColor(),
          );
        },
      ),
    );
  }
}
