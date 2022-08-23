import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/widgets/add_habits.dart';
import 'package:habit_tracker/widgets/bad_habits_widget.dart';
import 'package:habit_tracker/widgets/habits_widget.dart';
import 'package:habit_tracker/widgets/main_screen_widget.dart';
import 'generated/api.swagger.dart';
import 'package:logging/logging.dart';
import 'sources/api_keys.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../sources/api_keys.dart';

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

void _apiSynchronizer() async{
  final habitsApi = Api.create();
  await Hive.initFlutter();
  var box = await Hive.openBox('storage');
  if (box.values.isEmpty){
    Response<Habits> response = await habitsApi.habitsGet(authorization: ApiKeys().authorization);
    for (var habit in response.body!.habits!){
      box.add([habit.title,habit.description, habit.priority, habit.type, habit.count, habit.frequency,habit.uid, habit.uid,habit.date]);
    }
  }
}

void main() async {
  _setupLogging();
  _apiSynchronizer();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Georgia',
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 16, 65, 104),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color.fromARGB(255, 16, 65, 104),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
      ),
      routes: {
        '/good_habits': (context) => HabitsWidget(),
        '/bad_habits': (context) => BadHabitsWidget(),
        '/': (context) => const MainScreenWidget(),
        '/add_habits': (context)  {
          final arguments = ModalRoute.of(context)!.settings.arguments;
          if (arguments is List) {
            return AddHabitsWidget(habit: arguments[0], index: arguments[1],);
          } else {
            return const AddHabitsWidget(habit: [], index: 0);
          }
        },
      },
      initialRoute: '/',
    );
  }
}
