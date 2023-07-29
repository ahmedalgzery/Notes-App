// Import required packages and files
import 'package:bloc/bloc.dart'; 
import 'package:flutter/material.dart'; 
import 'package:hive_flutter/hive_flutter.dart'; 
import 'package:notes/constantes.dart';
import 'package:notes/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes/models/note_model.dart'; 

// Define a Cubit class that manages the state for adding a new note
class AddNoteCubit extends Cubit<AddNoteState> {
  // Constructor: Initialize the cubit with the initial state (AddNoteInitial)
  AddNoteCubit() : super(AddNoteInitial());

  // Define a Color variable with a default value
  Color color = const Color(0xffAC3931);

  // Method to add a new note to the storage
  addNote(NoteModel note) async {
    // Set the color value of the note to the predefined color
    note.color = color.value;

    // Emit the state to indicate that the note addition process is in progress (loading)
    emit(AddNoteLoading());

    try {
      // Access the Hive box for storing NoteModel objects
      var noteBox = Hive.box<NoteModel>(kNotesBox);

      // Add the new note to the Hive box
      await noteBox.add(note);

      // Emit the state to indicate that the note addition process was successful
      emit(AddNoteSuccess());
    } catch (e) {
      // If an error occurs during the addition process, emit the failure state with the error message
      emit(AddNoteFailure(errorMessage: e.toString()));
    }
  }
}
