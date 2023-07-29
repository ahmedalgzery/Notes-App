import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/views/edit_note_view.dart';

// NoteIteme widget:
// Represents an individual note item in the list of notes.
class NoteIteme extends StatelessWidget {
  // Constructor:
  // Takes the required 'note' parameter, which represents the NoteModel to display.
  const NoteIteme({Key? key, required this.note}) : super(key: key);

  // Property:
  // 'note' represents the NoteModel to display in the NoteIteme widget.
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    // Build method:
    // Returns a GestureDetector that allows tapping on the note item to navigate to the EditNoteView.
    return GestureDetector(
      onTap: () {
        // When the note item is tapped, navigate to the EditNoteView with the corresponding 'note'.
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return EditeNoteView(
              note: note, // Pass the 'note' to the EditNoteView for editing.
            );
          }),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24.0, bottom: 24.0, left: 16.0),
        decoration: BoxDecoration(
          color: Color(note.color), // Set the background color of the note item based on the note's color.
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // ListTile widget:
            // Displays the note's title, subtitle, and a delete button as the trailing icon.
            ListTile(
              title: Text(
                note.title, // Display the title of the note.
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 26.0,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  note.subTitle, // Display the subtitle of the note.
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 18.0,
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  // Delete the note when the delete button is tapped.
                  note.delete();
                  // Fetch updated notes list using the NotesCubit after deleting the note.
                  BlocProvider.of<NotesCubit>(context).fetchNotes();
                },
                icon: const Icon(FontAwesomeIcons.trash, color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Text(
                note.date, // Display the date of the note.
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
