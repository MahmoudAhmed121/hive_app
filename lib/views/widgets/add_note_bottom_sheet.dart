import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_app/manager/add_cubits/add_cubit.dart';
import 'package:hive_app/model/note_model.dart';
import 'package:hive_app/views/widgets/custom_buttom.dart';
import 'package:hive_app/views/widgets/custom_text_form_faild.dart';

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
        padding:  EdgeInsets.only(left: 16,right: 16,bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: BlocConsumer<AddNotesCubit, AddNoteState>(
            listener: (context, state) {
              if (state is AddNotesSuccess) {
                Navigator.pop(context);
              }
              if (state is AddNotesFailure) {
                print("mahmoud");
              }
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
                        height: 100,
                      ),
                      ConditionalBuilder(
                        condition: state is AddNotesLoading ? false : true,
                        builder: (context) {
                          return  CustomButton(
                          
                            onPressed: () {
                              if (key.currentState!.validate()) {
                                var notesModel = NotesModel(
                                    title: textEditingControllerforTitle.text,
                                    subtitle: textEditingControllerfordesc.text,
                                    color: Colors.blue.value,
                                    date: DateTime.now().toString());
                                AddNotesCubit.get(context).add(notesModel);
                              }
                            },
                            text: "add");                
                        },
                        fallback: (context) {
                          return Center(child: CircularProgressIndicator(),);
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
