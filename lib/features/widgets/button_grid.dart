import 'package:flutter/material.dart';
import 'package:my_calculator_bloc/core/widgets/standard_button.dart';

class ButtonGrid extends StatelessWidget {
  const ButtonGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            StandardButton(textButton: "C", isOperator: true, isTop: true,),
            StandardButton(textButton: "e^", isOperator: true, isTop: true,),
            StandardButton(textButton: "%", isOperator: true, isTop: true,),
            StandardButton(textButton: "÷", isOperator: true,),
          ],
        ),
        // SizedBox(height: 10,),
        Row(
          children: [
            StandardButton(textButton: "7",),
            StandardButton(textButton: "8",),
            StandardButton(textButton: "9",),
            StandardButton(textButton: "x", isOperator: true,),
          ],
        ),
        // SizedBox(height: 10,),
        Row(
          children: [
            StandardButton(textButton: "4",),
            StandardButton(textButton: "5",),
            StandardButton(textButton: "6",),
            StandardButton(textButton: "-", isOperator: true,),
          ],
        ),
        Row(
          children: [
            StandardButton(textButton: "1",),
            StandardButton(textButton: "2",),
            StandardButton(textButton: "3",),
            StandardButton(textButton: "+", isOperator: true,),
          ],
        ),
        // SizedBox(height: 10,),
        Row(
          children: [
            StandardButton(textButton: ".",),
            StandardButton(textButton: "0",),
            StandardButton(textButton: "⌫",),
            StandardButton(textButton: "=", isOperator: true,),
          ],
        ),
        // SizedBox(height: 10,),
      ],
    );
  }
}
