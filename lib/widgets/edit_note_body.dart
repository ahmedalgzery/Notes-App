import 'package:flutter/material.dart';
import 'package:notes/widgets/custom_app_bar.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(24.0),
      child: Column(
        children: [
          CustomAppBar(
            title: 'Edite',
            icon: Icons.check,
          )
        ],
      ),
    );
  }
}
