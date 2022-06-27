import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test1/shared/cubit/states.dart';
import '../../modules/archive_tasks/archive_tasks.dart';
import '../../modules/done_tasks/done_tasks.dart';
import '../../modules/new_task/new_task_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  int currentIndex = 0;

  late List<Map> tasks = [];

  late Database database;

  List<Widget> screens = const [
    NewTaskScreen(),
    DoneTaskScreen(),
    ArchiveTaskScreen()
  ];

  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archiveTasks = [];

  IconData fabIcon = Icons.edit;
  bool isBottomSheetShown = false;

  List<String> titles = ["New Tasks", "Done Tasks", "Archive Tasks"];

  static AppCubit get(context) => BlocProvider.of(context);

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(AppBottomNavBarState());
  }

  void changeBottomSheetState({required bool isShown, required IconData icon}) {
    fabIcon = icon;
    isBottomSheetShown = isShown;
    emit(AppChangeBottomSheetState());
  }

  void createDatabase() {
     openDatabase(
        'tasks2.db', version: 1,
        onCreate: (database, version) {
          print("Database created");
          database.execute("CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)").then((value) {
            print("Table created");
          }).catchError((error){
            print("${error.toString()} when crete table");
          });
        },
      onOpen: (database) {
          print("Database opened");
          getDataFromDatabase(database);
      }
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
     });
  }

  void insertToDatabase({required String title, required String date, required String time}) async {
    await database.transaction((txn) {
     return txn.rawInsert("INSERT INTO tasks (title, date, time, status) VALUES ('$title', '$date', '$time', 'new')");
    }).then((value) {
      print("$value insert successfully ");
      emit(AppInsertToDatabaseState());
      getDataFromDatabase(database);
    }).catchError((error){
      print("${error.toString()} when inserting data");
    });
  }

  void getDataFromDatabase(Database database) {

    newTasks = [];
    doneTasks = [];
    archiveTasks = [];

    emit(AppGetDataFromDatabaseStateLoadingState());

    database.rawQuery("SELECT * FROM tasks").then((value) {
      for (var element in value) {
        if (element['status'] == "new") {
          newTasks.add(element);
        }else if(element['status'] == "done") {
          doneTasks.add(element);
        }else {
          archiveTasks.add(element);
        }
      }
      emit(AppGetDataFromDatabaseState());
      print(value);
    });
  }

  void updateDatabase({required String status, required int id}) {
    database.rawUpdate('UPDATE tasks SET status = ? WHERE id = ? ', [status, id]).then((value) {
      print(value);
      getDataFromDatabase(database);
      emit(AppUpdateDatabaseState());
    });
  }

  void deleteData({required int id}) {
    database.rawDelete("DELETE FROM tasks WHERE id = ?", [id]).then((value) {
      emit(DeleteFromDatabaseState());
      getDataFromDatabase(database);
    });
  }

}