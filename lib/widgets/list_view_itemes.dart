import 'package:flutter/material.dart';
import 'package:notes/widgets/note_itemes.dart';

class ListViewItemes extends StatelessWidget {
  const ListViewItemes({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView.builder(
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: NoteIteme(),
        ),
        padding: EdgeInsets.zero,
      ),
    );
  }
}
