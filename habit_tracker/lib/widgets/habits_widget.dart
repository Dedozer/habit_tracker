import 'package:flutter/material.dart';

class HabitsWidget extends StatefulWidget {
  HabitsWidget({Key? key}) : super(key: key);

  @override
  State<HabitsWidget> createState() => _HabitsWidgetState();
}

final List<String> entries = <String>['A', 'B', 'C'];
final List<int> colorCodes = <int>[1, 1, 1];

class _HabitsWidgetState extends State<HabitsWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
          child: Container(
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black.withOpacity(0.2)),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                    )
                  ]),
              child: Container(
                height: 220,
                color: Colors.amber[colorCodes[index]],
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          child: Text('Entry ${entries[index]}',
                              style: TextStyle(fontSize: 23))),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                          'description',
                          style: TextStyle(fontSize: 17),
                        ),
                        height: 100,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: Text(
                                'priority',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Container(
                              child: Text(
                                'type',
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                          'period',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
