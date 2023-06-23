import 'package:flutter/material.dart';

class ContainersCreator extends StatelessWidget {
  final Color color;
  final String title;

  ContainersCreator(this.title, this.color);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: color,
        borderRadius: BorderRadius.circular(2),
      ),
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 8),
      padding: const EdgeInsets.all(15),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
