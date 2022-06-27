import 'package:flutter/material.dart';
import 'package:test1/layout/home_screen.dart';
import 'package:test1/modules/bmi_screen/bmi_calculator_screen.dart';
import 'package:test1/modules/bmi_result/bmi_result_screen.dart';
import 'package:test1/modules/counter_screen/counter_screen.dart';
import 'package:test1/modules/login/login_screen.dart';
import 'package:test1/modules/messenger_screen/messenger_screen.dart';
import 'package:test1/modules/user_screen/users_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:test1/shared/bloc_observer.dart';

void main() {
  BlocOverrides.runZoned(() {
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ));
  },
  blocObserver: MyBlocObserver(),
  );
}