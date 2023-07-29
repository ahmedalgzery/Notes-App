import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/widgets/custom_app_bar.dart';
import 'package:notes/widgets/custom_text_field.dart';

// EditNoteViewBody widget:
// Represents the body of the screen used to edit a note.
// It is a StatefulWidget as the text fields' values can change.
class EditNoteViewBody extends StatefulWidget {
  // Constructor:
  // Takes the required 'note' parameter, which is the NoteModel to be edited.
  const EditNoteViewBody({Key? key, required this.note}) : super(key: key);

  // Property:
  // 'note' represents the NoteModel to be edited.
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  // Local state variables to hold the edited title and subTitle.
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    // Build method:
    // Returns the layout of the EditNoteViewBody screen.
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          // CustomAppBar widget:
          // A custom app bar with a title 'Edite' and a check icon to save changes.
          // When the check icon is tapped, it updates the 'title' and 'subTitle' of the note,
          // saves the changes, pops the current screen, and fetches the updated notes list.
          CustomAppBar(
            onPressed: () {
              widget.note.title = title ?? widget.note.title; // Update the title of the note if changed.
              widget.note.subTitle =
                  subTitle ?? widget.note.subTitle; // Update the subTitle of the note if changed.
              widget.note.save(); // Save the changes to the note using Hive.
              Navigator.pop(context); // Pop the current screen (go back to the previous screen).
              BlocProvider.of<NotesCubit>(context)
                  .fetchNotes(); // Fetch updated notes list using the NotesCubit.
            },
            title: 'Edite', // Set the title of the custom app bar.
            icon: Icons.check, // Set the icon of the custom app bar to 'check'.
          ),
          const SizedBox(
            height: 25.0,
          ),
          // CustmTextField widget:
          // A custom text field for editing the note's title.
          // When the text changes, it updates the 'title' in the local state.
          CustmTextField(
            onChanged: (data) {
              title = data; // Update the 'title' in the local state when the text changes.
            },
            hintText: widget.note.title, // Set the hint text to the current title of the note.
          ),
          const SizedBox(
            height: 25.0,
          ),
          // CustmTextField widget:
          // A custom text field for editing the note's subTitle.
          // When the text changes, it updates the 'subTitle' in the local state.
          CustmTextField(
            onChanged: (data) {
              subTitle = data; // Update the 'subTitle' in the local state when the text changes.
            },
            hintText: widget.note.subTitle, // Set the hint text to the current subTitle of the note.
            maxLines: 5, // Set the maximum number of lines for the text field to 5.
          ),
          const SizedBox(
            height: 25.0,
          ),
        ],
      ),
    );
  }
}
