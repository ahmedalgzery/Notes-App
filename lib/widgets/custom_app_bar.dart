import 'package:flutter/material.dart';
import 'package:notes/widgets/custom_icon.dart';

// CustomAppBar widget:
// A custom app bar that displays a title and a custom icon on the right side.
// The title and icon are provided as required parameters, and an optional 'onPressed' callback
// can be attached to the icon to make it interactive.
class CustomAppBar extends StatelessWidget {
  // Constructor:
  // Takes 'title', 'icon', and an optional 'onPressed' callback as parameters.
  const CustomAppBar({
    Key? key,
    required this.title,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  // Properties:
  // 'title' represents the text to be displayed as the app bar title.
  final String title;

  // 'icon' is the IconData for the custom icon to be displayed on the right side of the app bar.
  final IconData icon;

  // 'onPressed' is an optional callback function that can be triggered when the custom icon is tapped.
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    // Build method:
    // Returns a row with the title displayed on the left and the custom icon on the right.
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 28.0,
          ),
        ),
        const Spacer(),
        // CustomSearchIcon widget:
        // Displays the provided custom icon and attaches the 'onPressed' callback (if provided).
        CustomSearchIcon(
          icon: icon,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
