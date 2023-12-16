import 'package:flutter/material.dart';

class DiceWidget extends StatelessWidget {
  final Function() onPressed;
  final String diceNumber;

  const DiceWidget({
    super.key,
    required this.onPressed,
    required this.diceNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: onPressed,
        child: Image.asset(
          'assets/icons/dice$diceNumber.png',
          color: Colors.white,
        ),
      ),
    );
  }
}
