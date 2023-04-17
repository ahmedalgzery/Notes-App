import 'package:flutter/material.dart';
import 'package:notes/widgets/custom_app_bar.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(24.0),
      child: Column(
        children: [
          CustomAppBar(),
        ],
      ),
    );
  }
}
