// Import required packages and files
import 'package:flutter/material.dart'; // Flutter framework widgets and utilities
import 'package:notes/models/note_model.dart'; // Custom file with NoteModel class
import 'package:notes/widgets/edit_note_body.dart'; // Custom widget for the body of the edit note view

// Define the EditeNoteView widget, extending StatelessWidget
class EditeNoteView extends StatelessWidget {
  // Constructor: Takes a required 'note' parameter of type NoteModel
  const EditeNoteView({super.key, required this.note});
  
  // A final property to store the NoteModel object that will be edited
  final NoteModel note;
  
  // Build method: Defines the UI for the widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold widget provides the basic structure for the view
      body: EditNoteViewBody(
        note: note,
      ),
      // Display the body of the view using EditNoteViewBody widget, passing the 'note' as a parameter
    );
  }
}
