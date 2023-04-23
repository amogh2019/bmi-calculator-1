import '../entities/bmi_label.dart';
import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.weight, required this.height});

  int weight;
  int height;
  double? _bmi;

  String getBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi!.toStringAsFixed(1);
  }

  BmiLabel getBmiLabel() {
    getBmi();
    return BmiLabel.getLabel(_bmi!);
  }
}
