// Import required packages and files
import 'package:flutter/material.dart'; // Flutter framework widgets and utilities
import 'package:flutter_bloc/flutter_bloc.dart'; // Flutter BLoC package
import 'package:intl/intl.dart'; // Package for date formatting
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart'; // Custom BLoC cubit for adding notes
import 'package:notes/cubits/notes_cubit/notes_cubit.dart'; // Custom BLoC cubit for managing notes
import 'package:notes/models/note_model.dart'; // Custom file with NoteModel class
import 'package:notes/widgets/color_list_view.dart'; // Custom widget for the color selection list
import 'package:notes/widgets/custom_button.dart'; // Custom widget for a custom button
import 'package:notes/widgets/custom_text_field.dart'; // Custom widget for a custom text field

// Define the AddNoteForm widget, extending StatefulWidget
class AddNoteForm extends StatefulWidget {
  // Constructor: Takes an optional 'key' parameter
  const AddNoteForm({
    super.key,
  });

  // Override createState method to return the state for this widget
  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

// Define the private _AddNoteFormState class, which extends the State class
class _AddNoteFormState extends State<AddNoteForm> {
  // Create a GlobalKey to uniquely identify the form
  final GlobalKey<FormState> globalKey = GlobalKey();

  // Variable to store the autovalidate mode for the form fields
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  // Variables to store the entered title and subtitle (content) of the note
  String? title, subTitle;

  // Build method: Defines the UI for the widget
  @override
  Widget build(BuildContext context) {
    return Form(
      // Use the globalKey to identify the form
      key: globalKey,
      child: Column(
        children: [
          const SizedBox(
            height: 15.0,
          ),
          // Custom text field for entering the title of the note
          CustmTextField(
            hintText: 'Title',
            // onSaved is called when the form is saved, it stores the entered value in the 'title' variable
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 25.0,
          ),
          // Custom text field for entering the content (subtitle) of the note
          CustmTextField(
            hintText: 'Content',
            maxLines: 5,
            // onSaved is called when the form is saved, it stores the entered value in the 'subTitle' variable
            onSaved: (value) {
              subTitle = value;
            },
          ),
          const SizedBox(
            height: 25.0,
          ),
          // Widget that displays a list of colors for selecting the note color
          const ColorListView(),
          // Custom button for saving the new note
          CustomButton(
            onTap: () {
              // Check if the form is valid (all form fields pass validation)
              if (globalKey.currentState!.validate()) {
                // If the form is valid, save its state and store the entered values in the 'title' and 'subTitle' variables
                globalKey.currentState!.save();
                
                // Get the current date and format it as 'dd-mm-yyyy'
                var currentDate = DateTime.now();
                var formatDate = DateFormat('dd-mm-yyyy').format(currentDate);
                
                // Create a new NoteModel object with the entered title, subtitle, current date, and a default color (Colors.cyan)
                NoteModel noteModel = NoteModel(
                  title: title!,
                  subTitle: subTitle!,
                  date: formatDate,
                  color: Colors.cyan.value,
                );
                
                // Use the AddNoteCubit to add the new note to the storage
                BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                
                // Use the NotesCubit to fetch the updated list of notes after adding the new note
                BlocProvider.of<NotesCubit>(context).fetchNotes();
              } else {
                // If the form is not valid, set the autovalidate mode to 'always' and trigger a re-build
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
          const SizedBox(
            height: 25.0,
          ),
        ],
      ),
    );
  }
}
