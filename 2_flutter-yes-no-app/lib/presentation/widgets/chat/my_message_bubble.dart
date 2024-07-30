import 'package:flutter/material.dart';

class MyMessageBubble extends StatelessWidget {
  const MyMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme; // ! Theme.of(context), Así llamo a los colores de mi theme **Style

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration( // !Practice changing colors **Practice
              color: colors.primary, borderRadius: BorderRadius.circular(20)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Laboris duis dolore',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
