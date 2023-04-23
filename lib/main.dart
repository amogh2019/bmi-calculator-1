import 'package:bmi_calculator/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var orangeColorScheme = ColorScheme.fromSwatch(
      primarySwatch: Colors.orange,
//           backgroundColor: Colors.orange,
    );

    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        colorScheme: orangeColorScheme,
        textTheme: GoogleFonts.passionOneTextTheme(),
        sliderTheme: SliderTheme.of(context).copyWith(
          inactiveTrackColor: orangeColorScheme.onPrimary.withAlpha(40),
          activeTrackColor: Colors.white,
          thumbColor: orangeColorScheme.onPrimary,
          overlayColor: Colors.white.withAlpha(60),
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
          overlayShape: const RoundSliderOverlayShape(overlayRadius: 18),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
