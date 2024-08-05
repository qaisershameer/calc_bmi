import 'dart:math';

class CalculatorBrain {

  CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;
  double _bmi=0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25.0) {
      return 'Over Weight';
    } else if (_bmi >= 18.5) {
      return 'Normal Weight';
    } else {
      return 'Under Weight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25.0) {
      return 'You have a higher than Normal Body Weight. Try to Exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have Normal Body Weight. Good Job! Keep it Constant.';
    } else {
      return 'You have a lower then Normal Body Weight. You can eat a bit more.';
    }
  }
} //commit
