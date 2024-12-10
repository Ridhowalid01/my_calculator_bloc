import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_calculator_bloc/features/bloc/calculator_bloc.dart';
import 'package:my_calculator_bloc/features/bloc/calculator_event.dart';
import 'package:my_calculator_bloc/features/bloc/theme_bloc.dart';

import '../utils/colors.dart';

class StandardButton extends StatelessWidget {
  const StandardButton({
    super.key,
    required this.textButton,
    this.isOperator = false,
    this.isTop = false,
  });

  final String textButton;
  final bool isOperator;
  final bool isTop;

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    ThemeBloc myTheme = context.read<ThemeBloc>();
    return Expanded(
        flex: 1,
        child: Container(
          height: isPortrait ? 90.r : 45.r,
          margin: EdgeInsets.symmetric(horizontal: 5.r),
          child: BlocBuilder<ThemeBloc, bool>(
            bloc: myTheme,
            builder: (context, state) {
              return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _getBackgroundColor(isTop, isOperator, state),
                      foregroundColor: state
                          ? DarkAppColors.textButtonColor
                          : LightAppColors.textButtonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24))
                  ),
                  onPressed: () {
                    final calculatorBloc = context.read<CalculatorBloc>();
                    String inputToSend = textButton;
                    // Mapping khusus
                    if (textButton == "e^") {
                      inputToSend = "^";
                    }
                    if (textButton == "C") {
                      calculatorBloc.add(ClearInputEvent());
                    } else if (textButton == "=") {
                      calculatorBloc.add(CalculateResultEvent());
                    } else if (textButton == "⌫") {
                      calculatorBloc.add(DeleteLastEvent());
                    } else {
                      calculatorBloc.add(AddInputEvent(inputToSend));
                    }
                  },
                  child: Text(
                    textButton,
                    style: TextStyle(
                        fontSize: 30.r, fontWeight: FontWeight.w400),
                  ));
            },
          ),
        ));
  }

  Color _getBackgroundColor(bool isTop, bool isOperator, bool isDarkTheme) {
    if (isTop) {
      return isDarkTheme
          ? DarkAppColors.topButtonColor
          : LightAppColors.topButtonColor;
    } else if (isOperator) {
      return AppColors.operatorColor;
    } else {
      return isDarkTheme
          ? DarkAppColors.primaryColor
          : LightAppColors.primaryColor;
    }
  }
}
