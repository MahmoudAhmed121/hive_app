part of 'add_cubit.dart';

@immutable
abstract class AddNoteState {}

class NotesInitial extends AddNoteState {}
class NotesLoading extends AddNoteState {}
class NotesSuccess extends AddNoteState {}
class NotesFailure extends AddNoteState {
  final String errorMessage;

  NotesFailure(this.errorMessage);
}
