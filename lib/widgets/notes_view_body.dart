import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes/widgets/custom_app_bar.dart';
import 'package:notes/widgets/list_view_itemes.dart';

// NotesViewBody widget:
// Represents the body of the main screen displaying a list of notes.
// It is a StatefulWidget as it fetches notes data from the 'NotesCubit'.
class NotesViewBody extends StatefulWidget {
  // Constructor:
  // Takes an optional 'key' parameter.
  const NotesViewBody({Key? key}) : super(key: key);

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    // initState method:
    // Fetches the notes data using the 'NotesCubit' when the widget is initialized.
    BlocProvider.of<NotesCubit>(context).fetchNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Build method:
    // Returns the layout of the NotesViewBody screen.
    return const Padding(
      padding: EdgeInsets.all(24.0),
      child: Column(
        children: [
          // CustomAppBar widget:
          // A custom app bar with a title 'Note' and a search icon.
          CustomAppBar(
            title: 'Note', // Set the title of the custom app bar.
            icon: Icons.search, // Set the icon of the custom app bar to 'search'.
          ),
          SizedBox(
            height: 15.0,
          ),
          // Expanded widget:
          // Expands the child ListView to fill the available space in the column.
          Expanded(child: ListViewItemes()), // Display the list of notes using ListViewItemes.
        ],
      ),
    );
  }
}
