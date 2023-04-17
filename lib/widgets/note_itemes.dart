import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoteIteme extends StatelessWidget {
  const NoteIteme({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24.0, bottom: 24.0, left: 16.0),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 205, 123, 1),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: const Text(
              'Flutter',
              style: TextStyle(
                color: Colors.black,
                fontSize: 26.0,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Notes fasf fasdg ter ter',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 18.0,
                ),
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.trash, color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Text(
              '12/12/2012',
              style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
