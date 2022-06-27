import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:test1/shared/components/components.dart';
import 'package:test1/shared/cubit/cubit.dart';
import 'package:test1/shared/cubit/states.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

   var scaffoldKey = GlobalKey<ScaffoldState>();
   var formKey = GlobalKey<FormState>();
   var titleController = TextEditingController();
   var dateController = TextEditingController();
   var timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state){
          if (state is AppInsertToDatabaseState){
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentIndex]),
            ),
            body: ConditionalBuilder(
              condition: state is! AppGetDataFromDatabaseStateLoadingState ,
              builder: (context) => cubit.screens[cubit.currentIndex],
              fallback: (context) => const Center(child: CircularProgressIndicator(),),
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
              currentIndex:  cubit.currentIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book),
                  label: "New Tasks",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.check_circle_outline),
                  label: "Done Tasks",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.archive_outlined),
                  label: "Archive Tasks",
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(cubit.fabIcon),
              onPressed: (){
                if (cubit.isBottomSheetShown) {
                  if (formKey.currentState!.validate()){
                    cubit.insertToDatabase(title: titleController.text, date: dateController.text, time: timeController.text);
                    cubit.changeBottomSheetState(isShown: false, icon: Icons.edit);
                  }
                  return;
                }else {
                  scaffoldKey.currentState!.showBottomSheet((context) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            defaultTextFormField(
                                controller: titleController,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return "You must put a task title";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.text,
                                label: "Task Title",
                                prefixIcon: Icons.edit
                            ),
                            const SizedBox(height: 16,),
                            defaultTextFormField(
                                controller: dateController,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return "You must put a task date";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.datetime,
                                label: "Task Date",
                                prefixIcon: Icons.calendar_month_outlined,
                              onTap: (){
                                  showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse("2030-07-01"),
                                  ).then((value) {
                                    dateController.text = DateFormat.yMMMd().format(value!);
                                  });
                              }
                            ),
                            const SizedBox(height: 16,),
                            defaultTextFormField(
                                controller: timeController,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return "You must put a task time";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.datetime,
                                label: "Task Time",
                                prefixIcon: Icons.watch_later_outlined,
                              onTap: () {
                                  showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                  ).then((value) {
                                    timeController.text = value!.format(context).toString();
                                  });
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  }).closed.then((value) {
                    cubit.changeBottomSheetState(isShown: false, icon: Icons.edit);
                  });
                  cubit.changeBottomSheetState(isShown: true, icon: Icons.add);
                }
              },
            ),
          );
        },
      ),
    );
  }
}
