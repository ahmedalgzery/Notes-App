import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/constantes.dart';
import 'package:notes/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/simple_bloc_observer.dart';
import 'package:notes/views/notes_view.dart';

// Main function:
// The main entry point of the app.
void main() async {
  // Initialize Hive and open the Hive box before running the app.
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver(); // Set the custom Bloc observer.
  Hive.registerAdapter(NoteModelAdapter()); // Register the Hive adapter for NoteModel.
  await Hive.openBox<NoteModel>(kNotesBox); // Open the Hive box for NoteModel.

  runApp(const NotesApp()); // Run the NotesApp as the root widget of the app.
}

// NotesApp widget:
// Represents the root of the application.
class NotesApp extends StatelessWidget {
  const NotesApp({super.key, });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Provide the NotesCubit to the widget tree.
      create: (context) => NotesCubit(),
      child: MaterialApp(
        title: 'Notes App', // Set the title of the MaterialApp.
        debugShowCheckedModeBanner: false, // Disable the debug banner.
        theme: ThemeData(
          // Set the dark theme and 'Poppins' as the font family for the app.
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        home: const NotesView(), // Set NotesView as the home screen of the app.
      ),
    );
  }
}
