import 'package:flutter_bloc/flutter_bloc.dart';
import 'calculator_state.dart';
import 'calculator_event.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:my_calculator_bloc/core/utils/number_formatter.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState.initial()) {
    on<AddInputEvent>(_onAddInput);
    on<ClearInputEvent>(_onClearInput);
    on<DeleteLastEvent>(_onDeleteLast);
    on<CalculateResultEvent>(_onCalculateResult);
  }

  void _onAddInput(AddInputEvent event, Emitter<CalculatorState> emit) {
    final currentInput = state.input;
    final newInput = event.input;
    const zeroInput = '0';

    const operators = ['+', '-', 'x', '÷', '^', '%'];

    if (operators.contains(newInput) || newInput == '.') {
      if (currentInput.isEmpty) {
        emit(state.copyWith(input: zeroInput + newInput));
      } else if (currentInput.isNotEmpty &&
          operators.contains(currentInput[currentInput.length - 1])) {
        emit(state.copyWith(
            input:
                currentInput.substring(0, currentInput.length - 1) + newInput));
      } else {
        emit(state.copyWith(input: currentInput + newInput));
      }
    } else {
      emit(state.copyWith(input: currentInput + newInput));
    }
  }

  void _onClearInput(ClearInputEvent event, Emitter<CalculatorState> emit) {
    emit(CalculatorState.initial());
  }

  void _onDeleteLast(DeleteLastEvent event, Emitter<CalculatorState> emit) {
    if (state.input.isNotEmpty) {
      emit(state.copyWith(
          input: state.input.substring(0, state.input.length - 1)));
    }
  }

  void _onCalculateResult(
      CalculateResultEvent event, Emitter<CalculatorState> emit) {
    try {
      final expression = state.input
          .replaceAll('x', '*')
          .replaceAll("e^", "^")
          .replaceAll("÷", "/");
      final result = _evaluateExpression(expression);

      String formattedResult;
      if (result % 1 == 0) {
        formattedResult = formatWithThousandSeparator(result.toInt());
      } else {
        formattedResult = result.toString();
      }

      emit(state.copyWith(result: formattedResult));
    } catch (e) {
      emit(state.copyWith(result: "Error"));
    }
  }

  double _evaluateExpression(String expression) {
    Parser parser = Parser();
    Expression exp = parser.parse(expression);
    ContextModel contextModel = ContextModel();
    return exp.evaluate(EvaluationType.REAL, contextModel);
  }
}
