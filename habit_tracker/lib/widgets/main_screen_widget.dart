import 'package:flutter/material.dart';
import 'package:habit_tracker/widgets/add_habits.dart';
import 'package:habit_tracker/widgets/bad_habits_widget.dart';
import 'package:habit_tracker/widgets/habits_widget.dart';

class MainScreenWidget extends StatefulWidget {
  MainScreenWidget({Key? key}) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HabitsWidget(),
    BadHabitsWidget(),
  ];

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        Navigator.pushNamed(context, '/add_habits');
        },
        backgroundColor: Color.fromARGB(255, 16, 65, 104),
        child: const Icon(Icons.add_circle),
      ),
      appBar: AppBar(
        title: const Center(child: Text('HabitsApp')),
      ),
      body: Center(
        child: _widgetOptions[_selectedTab],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Good habits',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_filter),
            label: 'Bad habits',
          ),
        ],
        onTap: onSelectTab,
      ),
    );
  }
}
