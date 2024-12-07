import 'package:flutter/material.dart';
import '../utils/colors.dart';

class StandardButton extends StatelessWidget {
  const StandardButton(
      {super.key,
      required this.label,
      required this.onPressed,
      this.isOperator = false,
      this.isTop = false});

  final String label;
  final VoidCallback onPressed;
  final bool isOperator;
  final bool isTop;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: isOperator ? ButtonColors.operatorColor : isTop ? ButtonColors.secondaryColor : ButtonColors.primaryColor,
          borderRadius: BorderRadius.circular(24.0)
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w400
            ),
          ),
        ),
      ),
    );
  }
}
