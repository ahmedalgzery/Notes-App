// Import required packages and files
import 'package:flutter/material.dart'; // Flutter framework widgets and utilities
import 'package:notes/widgets/add_show_modal_bottom_sheet.dart'; // Custom widget for adding/showing a modal bottom sheet
import 'package:notes/widgets/notes_view_body.dart'; // Custom widget for the body of the notes view

// Define the NotesView widget, extending StatelessWidget
class NotesView extends StatelessWidget {
  // Constructor: Takes an optional 'key' parameter
  const NotesView({super.key});

  // Build method: Defines the UI for the widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold widget provides the basic structure for the view
      floatingActionButton: FloatingActionButton(
        // Floating action button to add a new note
        onPressed: () {
          // When the button is pressed, show a modal bottom sheet
          showModalBottomSheet(
            // showModalBottomSheet displays a modal sheet from the bottom of the screen
            isScrollControlled: true,
            // Allow the bottom sheet to take up the full screen height
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            // Customize the shape of the modal bottom sheet
            context: context,
            // Provide the build context to the showModalBottomSheet method
            builder: (context) => const AddNoteBottomSheet(),
            // The builder method returns the widget that will be displayed in the bottom sheet
          );
        },
        child: const Icon(Icons.add),
        // The icon for the floating action button
      ),
      body: const NotesViewBody(),
      // Display the body of the view using NotesViewBody widget
    );
  }
}
