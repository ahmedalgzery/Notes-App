import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes/cubits/notes_cubit/notes_state.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/widgets/note_itemes.dart';

// ListViewItemes widget:
// A widget that displays a list of 'NoteIteme' widgets representing individual notes.
// It uses the 'BlocBuilder' to listen to the 'NotesCubit' and fetches the list of notes.
class ListViewItemes extends StatelessWidget {
  // Constructor:
  // Takes an optional 'key' parameter.
  const ListViewItemes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Build method:
    // Returns a 'BlocBuilder' to listen to the 'NotesCubit' and display the list of notes.
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        // Get the list of notes from the 'NotesCubit'.
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListView.builder(
            // Use the 'notes' list length as the item count for the ListView.
            itemCount: notes.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              // NoteIteme widget:
              // Display an individual note using the 'NoteIteme' widget for each item in the list.
              child: NoteIteme(
                note: notes[index], // Provide the corresponding note to the 'NoteIteme' widget.
              ),
            ),
            padding: EdgeInsets.zero,
          ),
        );
      },
    );
  }
}
