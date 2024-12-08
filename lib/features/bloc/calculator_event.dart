import 'package:equatable/equatable.dart';

abstract class CalculatorEvent extends Equatable {
  const CalculatorEvent();

  @override
  List<Object> get props => [];
}

class AddInputEvent extends CalculatorEvent {
  final String input;

  const AddInputEvent(this.input);

  @override
  List<Object> get props => [input];
}

class ClearInputEvent extends CalculatorEvent{}

class DeleteLastEvent extends CalculatorEvent{}

class CalculateResultEvent extends CalculatorEvent{}
