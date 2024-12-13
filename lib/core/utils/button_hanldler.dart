import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/calculator/bloc/calculator_bloc.dart';
import '../../features/calculator/bloc/calculator_event.dart';

void handlerButtonPress(BuildContext context, String textButton) {
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
}