// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:notes/constantes.dart';

// CustmTextField widget:
// A custom text input field widget with additional functionalities.
// It allows users to input text and provides options for customizing the appearance and behavior.
class CustmTextField extends StatelessWidget {
  // Constructor:
  // Takes 'hintText' as a required parameter, which represents the placeholder text in the input field.
  // The 'maxLines' parameter sets the maximum number of lines the input field can have (default is 1).
  // The 'onSaved' and 'onChanged' parameters are optional callbacks for saving and handling text changes.
  const CustmTextField({
    Key? key,
    required this.hintText,
    this.maxLines = 1,
    this.onSaved,
    this.onChanged,
  }) : super(key: key);

  // Properties:
  // 'hintText' represents the placeholder text to display in the input field.
  final String hintText;

  // 'maxLines' sets the maximum number of lines the input field can have (default is 1).
  final int maxLines;

  // 'onSaved' is an optional callback function to save the input value when a form is submitted.
  final void Function(String?)? onSaved;

  // 'onChanged' is an optional callback function to handle text changes in the input field.
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    // Build method:
    // Returns a TextFormField widget that allows users to input text with customizable appearance and behavior.
    return TextFormField(
      onChanged: onChanged, // Attach the 'onChanged' callback to handle text changes in the input field.
      onSaved: onSaved, // Attach the 'onSaved' callback to save the input value when a form is submitted.
      validator: (value) {
        // Validator function to check if the input field is empty or not.
        // If it's empty, return an error message ('Field is required'), otherwise, return null (no error).
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      cursorColor: kPrimaryColor, // Set the cursor color to the kPrimaryColor from constantes.dart.
      maxLines: maxLines, // Set the maximum number of lines the input field can have.
      decoration: InputDecoration(
        hintText: hintText, // Display the provided 'hintText' as the placeholder in the input field.
        hintStyle: const TextStyle(
          color: kPrimaryColor, // Set the hint text color to the kPrimaryColor.
        ),
        border: buildBorder(), // Use the buildBorder() method to set the input field's border.
        enabledBorder: buildBorder(), // Use the same border for the enabled state (default state).
        focusedBorder: buildBorder(kPrimaryColor), // Use the border with kPrimaryColor when the field is focused.
      ),
    );
  }

  // Helper method:
  // buildBorder method returns an OutlineInputBorder with customizable border properties.
  // The default color for the border is Colors.white, but it can be customized by providing a 'color' parameter.
  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8), // Apply a circular border radius.
      borderSide: BorderSide(
        color: color ?? Colors.white, // Set the border color to the provided 'color' or Colors.white by default.
      ),
    );
  }
}
