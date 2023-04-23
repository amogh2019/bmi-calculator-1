enum BmiLabel {
  overweight('OVERWEIGHT',
      'You have a higher than normal body weight. Try to exercise more.'),
  normal('NORMAL', 'You have a normal body weight. Good job!'),
  underweight('UNDERWEIGHT',
      'You have a lower than normal body weight. You can eat a bit more.');

  const BmiLabel(this.labelName, this.description);

  final String description;
  final String labelName;

  static BmiLabel getLabel(double bmiVal) {
    if (bmiVal >= 25) {
      return BmiLabel.overweight;
    } else if (bmiVal >= 18.5) {
      return BmiLabel.normal;
    } else {
      return BmiLabel.underweight;
    }
  }
}
