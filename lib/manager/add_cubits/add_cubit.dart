import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_state.dart';

class NotesCubit extends Cubit<AddNoteState> {
  NotesCubit() : super(NotesInitial());


  
}
