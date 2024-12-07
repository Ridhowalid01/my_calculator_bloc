abstract class CalculatorState {}

class CalculatorInitial extends CalculatorState {
  final String expression;
  final String result;

  CalculatorInitial(this.expression, this.result);
}
