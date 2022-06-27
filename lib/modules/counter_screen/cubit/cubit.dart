import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/modules/counter_screen/cubit/states.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterInitialState());

    static CounterCubit get(context) => BlocProvider.of(context);

    int counter = 1;

    void couterPlus() {
      counter++;
      emit(CounterPlusState(counter));
    }

    void counterMinus() {
      counter--;
      emit(CounterMinusState(counter));
    }

    void counterReset() {
      counter = 0;
      emit(CounterResetState());
    }
}