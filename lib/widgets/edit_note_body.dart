import 'package:flutter/material.dart';
import 'package:notes/widgets/custom_app_bar.dart';
import 'package:notes/widgets/custom_text_field.dart';

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
          ),
          SizedBox(
            height: 25.0,
          ),
          CustmTextField(
            hintText: 'Title',
          ),
          SizedBox(
            height: 25.0,
          ),
          CustmTextField(
            hintText: 'Content',
            maxLines: 5,
          ),
          SizedBox(
            height: 25.0,
          ),
        ],
      ),
    );
  }
}
