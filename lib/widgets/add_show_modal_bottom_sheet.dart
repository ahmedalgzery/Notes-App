import 'package:flutter/material.dart';
import 'package:notes/widgets/custom_button.dart';
import 'package:notes/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15.0,
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
            CustomButton(),
            SizedBox(
              height: 25.0,
            ),
          ],
        ),
      ),
    );
  }
}
