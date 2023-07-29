// This file contains the state classes used by AddNoteCubit

// Import the 'meta' library to use the @immutable decorator
// An abstract class defining the base state for the AddNoteCubit
abstract class AddNoteState {}

// A concrete state class representing the initial state of the AddNoteCubit
class AddNoteInitial extends AddNoteState {}

// A concrete state class representing the state when the AddNoteCubit is in the process of adding a new note
class AddNoteLoading extends AddNoteState {}

// A concrete state class representing the state when a new note has been successfully added
class AddNoteSuccess extends AddNoteState {}

// A concrete state class representing the state when an error occurs while adding a new note
class AddNoteFailure extends AddNoteState {
  // A string containing the error message describing the failure
  final String errorMessage;

  // Constructor that requires the error message to be provided when creating an instance of AddNoteFailure
  AddNoteFailure({required this.errorMessage});
}
