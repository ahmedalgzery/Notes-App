import 'package:flutter/material.dart';
import 'package:notes/constantes.dart';

// CustomButton widget:
// A custom button with a specific design, used for adding functionality.
// The button is wrapped in a GestureDetector to handle taps.
// It takes an optional 'onTap' callback that can be triggered when the button is tapped.
class CustomButton extends StatelessWidget {
  // Constructor:
  // Takes an optional 'onTap' callback function as a parameter.
  const CustomButton({Key? key, this.onTap}) : super(key: key);

  // Property:
  // 'onTap' is the optional callback function that can be triggered when the button is tapped.
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    // Build method:
    // Returns a GestureDetector wrapping a Container, representing the custom button.
    return GestureDetector(
      onTap: onTap, // Attach the 'onTap' callback to handle button taps.
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
          color: kPrimaryColor, // Use the kPrimaryColor from constantes.dart as the background color.
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Center(
          // Center the 'Add' text in the button.
          child: Text(
            'Add',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
