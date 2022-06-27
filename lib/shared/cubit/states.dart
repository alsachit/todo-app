import 'package:test1/shared/cubit/cubit.dart';

abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppBottomNavBarState extends AppStates {}

class AppChangeBottomSheetState extends AppStates {}

class AppCreateDatabaseState extends AppStates {}

class AppInsertToDatabaseState extends AppStates {}

class AppGetDataFromDatabaseState extends AppStates {}

class AppGetDataFromDatabaseStateLoadingState extends AppStates {}

class AppUpdateDatabaseState extends AppStates {}

class DeleteFromDatabaseState extends AppStates {}