import 'package:flutter/material.dart';

// CustomSearchIcon widget:
// A custom search icon button used for search functionality.
// The button displays an icon wrapped in a circular container with a transparent background.
// It takes the 'icon' to be displayed as a required parameter.
// The 'onPressed' callback can be provided as an optional parameter to handle button taps.
class CustomSearchIcon extends StatelessWidget {
  // Constructor:
  // Takes the required 'icon' parameter and an optional 'onPressed' callback.
  const CustomSearchIcon({Key? key, required this.icon, this.onPressed})
      : super(key: key);

  // Properties:
  // 'icon' is the IconData representing the icon to be displayed on the button.
  final IconData icon;

  // 'onPressed' is an optional callback function to handle button taps.
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    // Build method:
    // Returns a circular Container containing the icon wrapped in an IconButton.
    return Container(
      height: 46,
      width: 46,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.05), // Use a slightly transparent white background color.
        borderRadius: BorderRadius.circular(16.0), // Apply a circular border radius.
      ),
      child: Center(
        child: IconButton(
          onPressed: onPressed, // Attach the 'onPressed' callback to handle button taps.
          icon: Icon(icon), // Display the icon on the button.
        ),
      ),
    );
  }
}
