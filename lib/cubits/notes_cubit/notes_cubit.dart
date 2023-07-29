// Import required packages and files
import 'package:bloc/bloc.dart'; 
import 'package:hive_flutter/hive_flutter.dart'; 
// ignore: depend_on_referenced_packages
import 'package:notes/constantes.dart';
import 'package:notes/cubits/notes_cubit/notes_state.dart'; 
import 'package:notes/models/note_model.dart'; 

// Define a Cubit class that manages the state for handling notes
class NotesCubit extends Cubit<NotesState> {
  // Constructor: Initialize the cubit with the initial state (NotesInitial)
  NotesCubit() : super(NotesInitial());

  // List to store the notes
  List<NoteModel>? notes;

  // Method to fetch notes from storage
  fetchNotes() {
    // Access the Hive box for storing NoteModel objects
    var noteBox = Hive.box<NoteModel>(kNotesBox);

    // Retrieve all the notes from the box and convert them to a list
    notes = noteBox.values.toList();

    // Emit the state to indicate that notes have been successfully fetched
    emit(NotesSuccess());
  }
}
