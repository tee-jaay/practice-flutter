import 'package:flutter/material.dart';

class CoffeeType extends StatelessWidget {
  const CoffeeType(
      {Key? key,
      required this.coffeeType,
      required this.isSelelcted,
      required this.onTap})
      : super(key: key);

  final String coffeeType;
  final bool isSelelcted;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Text(
          coffeeType,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isSelelcted ? Colors.orange : Colors.white,
          ),
        ),
      ),
    );
  }
}
