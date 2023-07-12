import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_app/manager/notes/notes_cubit.dart';
import 'package:hive_app/views/widgets/custom_iteam_note.dart';

class CustomListIteam extends StatelessWidget {
  const CustomListIteam({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        if (state is NotesSuccess) {
          return ListView.builder(
            itemCount: state.noteModel.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: CustomIteamFornote(notesModel: state.noteModel[index]),
              );
            },
          );
        }return SizedBox();
      },
    );
  }
}
