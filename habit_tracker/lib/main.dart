import 'package:flutter/material.dart';
import 'package:habit_tracker/widgets/bad_habits_widget.dart';
import 'package:habit_tracker/widgets/habits_widget.dart';
import 'package:habit_tracker/widgets/main_screen_widget.dart';

void main() {
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
      },
      initialRoute: '/',
    );
  }
}
