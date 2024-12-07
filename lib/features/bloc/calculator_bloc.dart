import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'calculator_event.dart';
import 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  String _input = '';
  String _operator = '';
  String _previousValue = '';
  String _result = '0';

  CalculatorBloc() : super(CalculatorInitial('0', '0')) {
    on<NumberPressed>((event, emit) {
      _input += event.number;

      // Lakukan perhitungan setiap kali input berubah
      double result = _calculateResult();
      emit(CalculatorInitial(_input, result.toString()));
    });

    on<OperatorPressed>((event, emit) {
      _previousValue = _input;
      _operator = event.operator;
      _input = '';

      // Perbarui hasil setiap kali operator ditekan
      double result = _calculateResult();
      emit(CalculatorInitial(_previousValue + _operator, result.toString()));
    });

    on<CalculateResult>((event, emit) {
      if (_input.isNotEmpty && _previousValue.isNotEmpty) {
        double result = _calculateResult();
        emit(CalculatorInitial(_previousValue + _operator + _input, result.toString()));
      }
    });

    on<ClearPressed>((event, emit) {
      _input = '';
      _operator = '';
      _previousValue = '';
      _result = '0';
      emit(CalculatorInitial('0','0'));
    });
  }

  // Fungsi untuk menghitung hasil setiap kali input berubah
  double _calculateResult() {
    if (_previousValue.isEmpty || _input.isEmpty) return 0.0;

    double result = 0;
    double num1 = double.parse(_previousValue);
    double num2 = double.parse(_input);

    if (_operator == '÷' && num2 == 0) {
      // Pembagian dengan 0
      return double.nan;  // Menandakan error dalam perhitungan
    }

    // Lakukan perhitungan berdasarkan operator
    switch (_operator) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case 'x':
        result = num1 * num2;
        break;
      case '÷':
        result = num1 / num2;
        break;
      case '%':
        result = num1 % num2;
        break;
      default:
        result = 0;
        break;
    }

    // Menangani jika hasilnya adalah bilangan bulat
    if (result % 1 == 0) {
      return result.toInt().toDouble(); // Tampilkan tanpa .0
    }

    return result; // Kembalikan hasil desimal
  }
}
