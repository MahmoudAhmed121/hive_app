part of 'notes_cubit.dart';

@immutable
abstract class NotesState {}

class NotesInitial extends NotesState {}

class NotesSuccess extends NotesState {
  final List<NotesModel> noteModel ;

  NotesSuccess(this.noteModel);
}
