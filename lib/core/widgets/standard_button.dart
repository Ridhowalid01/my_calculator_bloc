import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/theme/bloc/theme_bloc.dart';
import '../utils/button_hanldler.dart';
import '../utils/colors.dart';
import '../utils/get_background_color.dart';

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
                          getBackgroundColor(isTop, isOperator, state),
                      foregroundColor: state
                          ? DarkAppColors.textButtonColor
                          : LightAppColors.textButtonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24))),
                  onPressed: () {
                    handlerButtonPress(context, textButton);
                  },
                  child: Text(
                    textButton,
                    style:
                        TextStyle(fontSize: 30.r, fontWeight: FontWeight.w400),
                  ));
            },
          ),
        ));
  }
}
