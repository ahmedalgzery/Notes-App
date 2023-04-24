import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/constantes.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isSelected, required this.color});
  final bool isSelected;
  final Color color;
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

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currntIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SizedBox(
        height: 76,
        child: ListView.builder(
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              currntIndex = index;
              BlocProvider.of<AddNoteCubit>(context).color = kColors[index];
              setState(() {});
            },
            child: ColorItem(
              color: kColors[index],
              isSelected: currntIndex == index,
            ),
          ),
          itemCount: 12,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
