
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'add_state.dart';

class AddNotesCubit extends Cubit<AddNoteState> {
  AddNotesCubit() : super(NotesInitial());

static AddNotesCubit get(context)=> BlocProvider.of(context);
  
}
