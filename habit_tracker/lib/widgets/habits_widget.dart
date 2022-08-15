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
    return Stack(
      children: [
        ListView.builder(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.only(top: 70),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
              child: Container(
                height: 270,
                child: Column(
                  children: [
                    Container(
                      height: 220,
                      child: Stack(
                        fit: StackFit.loose,
                        children: [
                          Container(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.black.withOpacity(0.2)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                    )
                                  ]),
                              child: Container(
                                height: 220,
                                color: Colors.amber[colorCodes[index]],
                                child: Column(
                                  children: [
                                    Center(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                              child: Text(
                                                  'Entry ${entries[index]}',
                                                  style:
                                                      TextStyle(fontSize: 23))),
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    'priority',
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    'type',
                                                    style:
                                                        TextStyle(fontSize: 20),
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
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                print('-');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        print('done');
                      },
                      child: Text('Done'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Search',
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: OutlineInputBorder(),

            ),
          ),
        ),
      ],
    );
  }
}
