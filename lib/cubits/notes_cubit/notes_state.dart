// This file contains the state classes used by NotesCubit

// Import the 'meta' library to use the @immutable decorator
// An abstract class defining the base state for the NotesCubit
abstract class NotesState {}

// A concrete state class representing the initial state of the NotesCubit
class NotesInitial extends NotesState {}

// A concrete state class representing the state when notes have been successfully fetched
class NotesSuccess extends NotesState {}
