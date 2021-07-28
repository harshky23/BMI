import 'dart:math';

class Brain {
  Brain({required this.weight,required this.height});
  final int weight;
  final int height;
  double _bmi=0;

  String cal(){
    _bmi = weight/pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }
 String title(){
    if(_bmi>=25)
      return 'overweight';
    if(_bmi>18.5)
      return 'Normal';
    else
      return 'Underweight';
 }
 String description(){
   if(_bmi>=25)
     return 'Eat less food';
   if(_bmi>18.5)
     return 'You are perfect';
   else
     return 'Eat more food ';
 }
}