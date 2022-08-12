import 'package:flutter/material.dart';

class BadHabitsWidget extends StatefulWidget {
  BadHabitsWidget({Key? key}) : super(key: key);

  @override
  State<BadHabitsWidget> createState() => _BadHabitsWidgetState();
}

final List<String> entries = <String>['A', 'B', 'C'];
final List<int> colorCodes = <int>[600, 500, 100];

class _BadHabitsWidgetState extends State<BadHabitsWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber[colorCodes[index]],
            child: Center(child: Text('Entry ${entries[index]}')),
          );
        });
  }
}
