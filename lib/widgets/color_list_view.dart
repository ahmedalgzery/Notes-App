// Import required packages and files
import 'package:flutter/material.dart'; // Flutter framework widgets and utilities
import 'package:flutter_bloc/flutter_bloc.dart'; // Flutter BLoC package
import 'package:notes/constantes.dart'; // Custom file with color constants
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart'; // Custom BLoC cubit for adding notes

// Define the ColorItem widget, which represents an individual color option
class ColorItem extends StatelessWidget {
  // Constructor: Takes 'isSelected' and 'color' as required parameters
  const ColorItem({super.key, required this.isSelected, required this.color});

  // Properties to store the selected state and color value
  final bool isSelected;
  final Color color;

  // Build method: Defines the UI for the widget
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? Padding(
            padding: const EdgeInsets.all(3.0),
            child: CircleAvatar(
              radius: 38,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 34,
                backgroundColor: color,
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(3.0),
            child: CircleAvatar(
              radius: 34,
              backgroundColor: color,
            ),
          );
  }
}

// Define the ColorListView widget, which displays the list of color options
class ColorListView extends StatefulWidget {
  // Constructor: Takes an optional 'key' parameter
  const ColorListView({super.key});

  // Override createState method to return the state for this widget
  @override
  State<ColorListView> createState() => _ColorListViewState();
}

// Define the private _ColorListViewState class, which extends the State class
class _ColorListViewState extends State<ColorListView> {
  // Variable to store the index of the currently selected color
  int currntIndex = 0;

  // Build method: Defines the UI for the widget
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SizedBox(
        height: 76,
        child: ListView.builder(
          // ListView builder to display the list of color options horizontally
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              // When a color item is tapped, update the selected index and the color in AddNoteCubit
              currntIndex = index;
              BlocProvider.of<AddNoteCubit>(context).color = kColors[index];
              setState(() {});
            },
            // Use the ColorItem widget to represent an individual color option
            child: ColorItem(
              color: kColors[index],
              isSelected: currntIndex == index,
            ),
          ),
          itemCount: kColors.length, // Total number of color options
          scrollDirection: Axis.horizontal, // Scroll direction is horizontal
        ),
      ),
    );
  }
}
