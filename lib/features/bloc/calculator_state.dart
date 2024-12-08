import 'package:equatable/equatable.dart';

class CalculatorState extends Equatable {
  final String input;
  final String result;

  const CalculatorState({required this.input, required this.result});

  // state init
  factory CalculatorState.initial(){
    return const CalculatorState(input: "", result: "0");
  }

  CalculatorState copyWith({String? input, String? result}) {
    return CalculatorState(
        input: input ?? this.input,
        result: result ?? this.result
    );
  }

  @override
  List<Object?> get props => [input, result];
}