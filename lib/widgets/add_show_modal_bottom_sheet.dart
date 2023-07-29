// Import required packages and files
import 'package:flutter/material.dart'; // Flutter framework widgets and utilities
import 'package:flutter_bloc/flutter_bloc.dart'; // Flutter BLoC package
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart'; // Custom BLoC cubit for adding notes
import 'package:notes/cubits/add_note_cubit/add_note_state.dart';
import 'package:notes/widgets/add_note_form.dart'; // Custom widget for the form to add a new note

// Define the AddNoteBottomSheet widget, extending StatelessWidget
class AddNoteBottomSheet extends StatelessWidget {
  // Constructor: Takes an optional 'key' parameter
  const AddNoteBottomSheet({super.key});

  // Build method: Defines the UI for the widget
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Provide the AddNoteCubit to the widget tree
      create: (context) => AddNoteCubit(),
      // The child of BlocProvider is a BlocConsumer widget, which listens to state changes of AddNoteCubit
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        // The listener is called when the state of AddNoteCubit changes
        listener: (context, state) {
          // If the state is AddNoteFailure, do something (you can add error handling here)
          if (state is AddNoteFailure) {
            // Handle the failure state if needed
          }
          // If the state is AddNoteSuccess, close the bottom sheet (navigate back)
          if (state is AddNoteSuccess) {
            Navigator.pop(context);
          }
        },
        // The builder is called when the widget is initially built and whenever the state of AddNoteCubit changes
        builder: (context, state) {
          return AbsorbPointer(
            // Set absorbing to true when AddNoteCubit is in AddNoteLoading state
            // This prevents user interactions while the note is being added
            absorbing: state is AddNoteLoading ? true : false,
            child: Padding(
              // Add padding to the content to prevent content from being blocked by the keyboard
              padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const SingleChildScrollView(
                // SingleChildScrollView allows the content to be scrollable when the keyboard is open
                child: AddNoteForm(),
                // The AddNoteForm widget contains the form for adding a new note
              ),
            ),
          );
        },
      ),
    );
  }
}
