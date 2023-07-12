import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_app/model/note_model.dart';
import 'package:meta/meta.dart';

import '../../core/utils/constant.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  static NotesCubit get(context) => BlocProvider.of(context);

  fetchAllNote() {
    var noteBox = Hive.box<NotesModel>(kNotsBox);

    List<NotesModel> note = noteBox.values.toList();

    emit(NotesSuccess(note));
  }
}
