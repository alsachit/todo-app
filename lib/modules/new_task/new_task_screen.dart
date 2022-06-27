import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/shared/components/components.dart';
import 'package:test1/shared/cubit/cubit.dart';
import 'package:test1/shared/cubit/states.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        builder: (context, state) {
          return taskBuilder(tasks: AppCubit.get(context).newTasks);
        },
        listener: (context, state) {},
    );
  }
}
