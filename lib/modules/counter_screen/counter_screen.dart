import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/modules/counter_screen/cubit/cubit.dart';
import 'package:test1/modules/counter_screen/cubit/states.dart';

class CounterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, state) {
          if (state is CounterPlusState) print('Plus State ${state.counter}');
          if (state is CounterMinusState) print('Minus State ${state.counter}');
          if (state is CounterResetState) print('Reset State');
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
                title: const Text("Counter")
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: (){

                          CounterCubit.get(context).couterPlus();

                        },
                        child: const Text("Plus", style: TextStyle(
                          fontSize: 20,
                        ),),
                      ),
                      const SizedBox(width: 15,),
                      Text(
                        "${CounterCubit.get(context).counter}",
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(width: 15,),
                      TextButton(
                        onPressed: (){

                          CounterCubit.get(context).counterMinus();


                        },
                        child: const Text("Minus", style: TextStyle(
                          fontSize: 20,
                        ),),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    color: Colors.blue,
                    child: MaterialButton(
                      onPressed: (){

                        CounterCubit.get(context).counterReset();

                      },
                      child: Text(
                        'Reset Counter',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
