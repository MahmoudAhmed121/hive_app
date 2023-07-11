import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_app/core/utils/constant.dart';
import 'package:hive_app/model/note_model.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';

part 'add_state.dart';

class AddNotesCubit extends Cubit<AddNoteState> {
  AddNotesCubit() : super(AddNotesInitial());

  static AddNotesCubit get(context) => BlocProvider.of(context);

  add(NotesModel note) async {
    try {
      emit(AddNotesLoading());
      var noteBox = Hive.box<NotesModel>(kNotsBox);

      await noteBox.add(note);

      emit(AddNotesSuccess());
    } catch (e) {
      emit(AddNotesFailure(e.toString()));
    }
  }
}
