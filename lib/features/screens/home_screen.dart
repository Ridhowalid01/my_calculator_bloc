import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_calculator_bloc/features/widgets/button_grid.dart';

import '../bloc/calculator_bloc.dart';
import '../bloc/calculator_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text("My Calculator"),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.dark_mode_outlined),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 8, left: 8, bottom: 0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // diplay screen
            BlocBuilder<CalculatorBloc, CalculatorState>(
                builder: (context, state) {
              String expression = "0";
              String result = "0";
              if (state is CalculatorInitial) {
                expression = state.expression;
                result = state.result;
              }
              return Expanded(
                child: Container(
                  // color: Colors.red,
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        expression,
                        style: const TextStyle(
                          fontSize: 48,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        result,
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(height: 10,),
                    ],
                  ),
                ),
              );
            }),

            const Expanded(
              flex: 2,
                child: ButtonGrid()
            ),
          ],
        ),
      ),
    );
  }
}
