import 'package:flutter/material.dart';
import 'package:test1/modules/bmi_result/bmi_logic.dart';

class BmiResultScreen extends StatelessWidget {
   BmiResultScreen({Key? key, required this.result, required this.bmi, required this.resultText}) : super(key: key);

   final double bmi;
   final String result;
   final String resultText;

  Color secondaryColor = const Color(0xFF1a1a1a);
  Color textColor = const Color(0xFF595959);
  Color btnColor = const Color(0xFF454545);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: secondaryColor,
        title: const Text(
          "BMI CALCULATOR",
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Column(
        children: [
         const Padding(
            padding: const EdgeInsets.fromLTRB(0,40,0,24),
            child: Text(
              "YOUR RESULT",
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(6)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                       Text(
                          result,
                        style:const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber
                        ),
                      ),
                      const SizedBox(height: 50,),
                      Text(
                        bmi.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 85,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 50,),
                      Text(
                        resultText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: textColor
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: secondaryColor,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text(
                "RE CALCULATE",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.amber,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
