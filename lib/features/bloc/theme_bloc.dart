import 'package:bloc/bloc.dart';

class ThemeBloc extends Cubit<bool> {
  ThemeBloc() : super(true); // true = dark theme

  void changeTheme(){
    emit(!state);
  }
}