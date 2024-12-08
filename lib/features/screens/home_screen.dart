import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_calculator_bloc/features/bloc/theme_bloc.dart';

import '../bloc/calculator_bloc.dart';
import '../bloc/calculator_state.dart';
import '../widgets/button_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery
        .of(context)
        .orientation == Orientation.portrait;

    ThemeBloc myTheme = context.read<ThemeBloc>();
    CalculatorBloc myCalculator = context.read<CalculatorBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            "My Calculator",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: BlocBuilder<ThemeBloc, bool>(
              bloc: myTheme,
              builder: (context, state) {
                return IconButton(
                  onPressed: () {
                    myTheme.changeTheme();
                  },
                  icon: Icon(
                      state ? Icons.dark_mode_outlined : Icons.light_mode),

                );
              },
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  // color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: BlocBuilder<CalculatorBloc, CalculatorState>(
                      bloc: myCalculator,
                      builder: (context, state) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              state.input,
                              style: const TextStyle(
                                fontSize: 24,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              state.result,
                              style: const TextStyle(
                                fontSize: 54,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                )),
            Expanded(flex: isPortrait ? 2 : 3, child: const ButtonGrid()),
          ],
        ),
      ),
    );
  }
}
