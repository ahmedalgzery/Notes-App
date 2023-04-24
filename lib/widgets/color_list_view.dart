import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(3.0),
      child: CircleAvatar(
        radius: 38,
        backgroundColor: Colors.amber,
      ),
    );
  }
}

class ColorListView extends StatelessWidget {
  const ColorListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SizedBox(
        height: 76,
        child: ListView.builder(
          itemBuilder: (context, index) => const ColorItem(),
          itemCount: 10,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
