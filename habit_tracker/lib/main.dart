import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/widgets/add_habits.dart';
import 'package:habit_tracker/widgets/bad_habits_widget.dart';
import 'package:habit_tracker/widgets/habits_widget.dart';
import 'package:habit_tracker/widgets/main_screen_widget.dart';

import 'generated/api.swagger.dart';
import 'package:logging/logging.dart';

import 'sources/api_keys.dart';

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

void main() async {
  _setupLogging();
  final api = Api.create();
  print(api);
  Response<Habits> getResult = await api.habitsGet(authorization: ApiKeys().authorization);
  // for(var x in getResult.body!.habits!){
  //   print(x);
  //   print('-');
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Georgia',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 16, 65, 104),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color.fromARGB(255, 16, 65, 104),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
      ),
      routes: {
        '/good_habits': (context) => HabitsWidget(),
        '/bad_habits': (context) => BadHabitsWidget(),
        '/': (context) => MainScreenWidget(),
        '/add_habits': ((context) => AddHabitsWidget()),
      },
      initialRoute: '/',
    );
  }
}
