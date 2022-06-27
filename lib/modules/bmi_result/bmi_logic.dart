import 'dart:math';

class BmiLogic {
    double? bmi;
    final double height;
    final double weight;

    BmiLogic({required this.height, required this.weight});

    double calculateResult() {
      return bmi = weight / pow(height/100,2);
    }


   String getResult() {
     if(bmi! < 18.5) {
       return "UNDERWEIGHT";
     }else if (bmi! > 18.5 && bmi! < 25) {
       return "NORMAL";
     }else {
       return "OVERWEIGHT";
     }
   }

   String getResultText() {
     if (bmi! < 18.5) {
       return "You have lower than normal body, You need to eat a bit more";
     }else if(bmi! > 18.5 && bmi! < 25) {
       return "You have a normal body weight, Good job";
     }else {
       return "You have a higher than normal body weight, Try loos some weight ";
     }
   }
}