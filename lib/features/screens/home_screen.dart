import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_calculator_bloc/features/bloc/theme_bloc.dart';

import '../bloc/calculator_bloc.dart';
import '../bloc/calculator_state.dart';
import '../widgets/button_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    ThemeBloc myTheme = context.read<ThemeBloc>();
    CalculatorBloc myCalculator = context.read<CalculatorBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(
            left: 10.r,
          ),
          child: Text(
            "My Calculator",
            style: TextStyle(fontSize: 24.r, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.r),
            child: BlocBuilder<ThemeBloc, bool>(
              bloc: myTheme,
              builder: (context, state) {
                return IconButton(
                  onPressed: () {
                    myTheme.changeTheme();
                  },
                  icon:
                      Icon(state ? Icons.dark_mode_outlined : Icons.light_mode),
                );
              },
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.r),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 20.r, vertical: isPortrait ? 8.r : 0),
                child: BlocBuilder<CalculatorBloc, CalculatorState>(
                  bloc: myCalculator,
                  builder: (context, state) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          state.input,
                          style: TextStyle(
                            fontSize: isPortrait ? 24.r : 20.r,
                          ),
                        ),
                        SizedBox(
                          height: isPortrait ? 10.r : 2.r,
                        ),
                        Text(
                          state.result,
                          style: TextStyle(
                            fontSize: isPortrait ? 54.r : 30.r,
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
