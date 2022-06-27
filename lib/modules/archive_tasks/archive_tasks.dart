import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class ArchiveTaskScreen extends StatelessWidget {
  const ArchiveTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      builder: (context, state) {
        return taskBuilder(tasks: AppCubit.get(context).archiveTasks);
      },
      listener: (context, state) {},
    );
  }
}
