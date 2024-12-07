import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_calculator_bloc/core/widgets/standard_button.dart';

import '../bloc/calculator_bloc.dart';
import '../bloc/calculator_event.dart';

class ButtonGrid extends StatelessWidget {
  const ButtonGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CalculatorBloc>();
    return GridView.count(
      crossAxisCount: 4,
      children: [
        StandardButton(
          label: 'C',
          onPressed: () => bloc.add(ClearPressed()),
          isTop: true,
        ),
        StandardButton(
          label: "%",
          onPressed: () => bloc.add(OperatorPressed("%")),
          isTop: true,
        ),
        StandardButton(
          label: 'del',
          onPressed: () => bloc.add(NumberPressed("")),
          isTop: true,
        ),
        StandardButton(
          label: "÷",
          onPressed: () => bloc.add(OperatorPressed("÷")),
          isOperator: true,
        ),
        StandardButton(
          label: "7",
          onPressed: () => bloc.add(NumberPressed("7")),
        ),
        StandardButton(
          label: "8",
          onPressed: () => bloc.add(NumberPressed("8")),
        ),
        StandardButton(
          label: "9",
          onPressed: () => bloc.add(NumberPressed("9")),
        ),
        StandardButton(
            label: 'x',
            onPressed: () => bloc.add(OperatorPressed('x')),
            isOperator: true),
        StandardButton(
            label: '4', onPressed: () => bloc.add(NumberPressed('4'))),
        StandardButton(
            label: '5', onPressed: () => bloc.add(NumberPressed('5'))),
        StandardButton(
            label: '6', onPressed: () => bloc.add(NumberPressed('6'))),
        StandardButton(
            label: '-',
            onPressed: () => bloc.add(OperatorPressed('-')),
            isOperator: true),
        StandardButton(
            label: '1', onPressed: () => bloc.add(NumberPressed('1'))),
        StandardButton(
            label: '2', onPressed: () => bloc.add(NumberPressed('2'))),
        StandardButton(
            label: '3', onPressed: () => bloc.add(NumberPressed('3'))),
        StandardButton(
            label: '+',
            onPressed: () => bloc.add(OperatorPressed('+')),
            isOperator: true),
        StandardButton(
            label: '000', onPressed: () => bloc.add(NumberPressed('000'))),
        StandardButton(
            label: '0', onPressed: () => bloc.add(NumberPressed('0'))),
        StandardButton(
          label: '.',
          onPressed: () => bloc.add(NumberPressed("")),
        ),
        StandardButton(
            label: '=',
            onPressed: () => bloc.add(CalculateResult()),
            isOperator: true),
      ],
    );
  }
}
