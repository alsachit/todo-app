import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test1/modules/bmi_result/bmi_logic.dart';
import 'package:test1/modules/bmi_result/bmi_result_screen.dart';


class BmiCalculatorScreen extends StatefulWidget {
   BmiCalculatorScreen({Key? key}) : super(key: key);



  @override
  State<BmiCalculatorScreen> createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {

  double height = 180;
  double weight = 50;
  int age = 24;
  double? result;
  Color secondaryColor = const Color(0xFF1a1a1a);
  Color gestureColor = const Color(0xFF1a1a1a);
  Color textColor = const Color(0xFF595959);
  Color btnColor = const Color(0xFF454545);

  bool isMale = true;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        elevation: 0,
        backgroundColor: secondaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState((){
                          isMale = true;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: isMale ? Colors.grey.shade800 : gestureColor
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.male, color: Colors.white, size: 75,),
                            Text("MALE",
                              style: TextStyle(
                                color: isMale ? Colors.grey : textColor,
                                fontSize: 18
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16,),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState((){
                          isMale = false;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: isMale ? gestureColor : Colors.grey.shade800
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.female, color: Colors.white, size: 75,),
                            Text("FEMALE",
                              style: TextStyle(
                                color: isMale ? textColor : Colors.grey,
                                fontSize: 18
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Text(
                      "HEIGHT",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 18
                      ),
                    ),
                    const SizedBox(height: 6,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          "${height.toInt()}",
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                        const SizedBox(width: 4,),
                        Text(
                          "cm",
                          style: TextStyle(
                            color: textColor,
                            fontSize: 18
                          ),
                        ),
                      ],
                    ),
                    Slider(
                        value: height.toDouble() ,
                        min: 50,
                        max: 220,
                        onChanged: (value){
                          setState((){
                            height = value;
                          });
                        },
                        activeColor: Colors.white,
                        inactiveColor: textColor,
                        thumbColor: Colors.amber,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Column(
                        children: [
                          Text(
                            "WEIGHT",
                            style: TextStyle(
                              color: textColor,
                              fontSize: 18
                            ),
                          ),
                          const SizedBox(height: 6,),
                          Text(
                            "$weight",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          const SizedBox(height: 6,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: btnColor,
                                child: IconButton(
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    onPressed: (){
                                      setState((){
                                        weight++;
                                      });
                                    },
                                    icon: Icon(Icons.add, color: Colors.white,)
                                ),
                              ),
                              const SizedBox(width: 10,),
                              CircleAvatar(
                                backgroundColor: btnColor,
                                child: IconButton(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onPressed: (){
                                    setState((){
                                      weight--;
                                    });
                                  },
                                  icon: Icon(Icons.remove, color: Colors.white,)
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16,),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Column(
                        children: [
                          Text(
                            "AGE",
                            style: TextStyle(
                                color: textColor,
                                fontSize: 18
                            ),
                          ),
                          const SizedBox(height: 6,),
                          Text(
                            "$age",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          const SizedBox(height: 6,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: btnColor,
                                child: IconButton(
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    onPressed: (){
                                      setState((){
                                        age++;
                                      });
                                    },
                                    icon: Icon(Icons.add, color: Colors.white,)
                                ),
                              ),
                              const SizedBox(width: 10,),
                              CircleAvatar(
                                backgroundColor: btnColor,
                                child: IconButton(
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    onPressed: (){
                                      setState((){
                                        age--;
                                      });
                                    },
                                    icon: Icon(Icons.remove, color: Colors.white,)
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            color: secondaryColor,
            child: TextButton(
              onPressed: (){
                BmiLogic calc = BmiLogic(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BmiResultScreen(
                      bmi: calc.calculateResult(),
                      result: calc.getResult(),
                      resultText: calc.getResultText(),
                    )),
                );
              },
              child: Text(
                "CALCULATE",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  color: Colors.amber
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// weight / pow(height/100,2)