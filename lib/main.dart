import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_calculator_bloc/features/bloc/calculator_bloc.dart';
import 'package:my_calculator_bloc/features/bloc/theme_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeBloc myTheme = ThemeBloc();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ThemeBloc>(create: (context) => myTheme),
          BlocProvider<CalculatorBloc>(
            create: (context) => CalculatorBloc(),
          )
        ],
        child: BlocBuilder<ThemeBloc, bool>(
            bloc: myTheme,
            builder: (context, state) {
              return ScreenUtilInit(
                designSize: const Size(411.4, 866.2),
                minTextAdapt: true,
                splitScreenMode: true,
                builder: (context, child) => MaterialApp(
                  theme: state ? ThemeData.dark() : ThemeData.light(),
                  home: child,
                ),
                child: const HomeScreen(),
              );
            }));
  }
}
