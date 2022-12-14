import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BadHabitsWidget extends StatefulWidget {
  const BadHabitsWidget({Key? key}) : super(key: key);

  @override
  State<BadHabitsWidget> createState() => _BadHabitsWidgetState();
}

Future<List> getHabits() async {
  await Hive.initFlutter();
  Box<dynamic> box = await Hive.openBox('storage');
  return box.values.toList();
}

Icon filteredIcon = Icon(Icons.arrow_downward);
bool flagSort = true;

var prioprity = [
  'Low',
  'Medium',
  'High',
];

var type = [
  'good',
  'bad',
];

class _BadHabitsWidgetState extends State<BadHabitsWidget> {
  List<dynamic> filteredEntries = [];

  Future<List> getSortedHabits(searchController) async {
    var mymap = await getHabits();
    List<dynamic> filteredEntries = [];
    if (searchController.text.isNotEmpty) {
      filteredEntries = mymap.where((element) {
        return element[0]
            .toLowerCase()
            .contains(searchController.text.toLowerCase());
      }).toList();
    } else {
      filteredEntries = mymap;
    }
    setState(() {});
    return filteredEntries;
  }

  List<dynamic> sortedHabits() {
    if (flagSort == true) {
      if (filteredEntries.isEmpty) {
      } else {
        filteredEntries.sort((a, b) => a[7].compareTo(b[7]));
      }
      filteredIcon = Icon(Icons.arrow_upward);
      flagSort = false;
    } else {
      if (filteredEntries.isEmpty) {
      } else {
        filteredEntries.sort((a, b) => b[7].compareTo(a[7]));
      }
      filteredIcon = Icon(Icons.arrow_downward);
      flagSort = true;
    }
    setState(() {});
    return filteredEntries;
  }

  void _boxUpdate(index, filteredEntries) async {
    await Hive.initFlutter();
    Box<dynamic> box = await Hive.openBox('storage');
    var value = filteredEntries[index];
    value[4] -= 1;
    box.putAt(index, value);
  }

  final _searchController = TextEditingController();

  void _searchHabits() async {
    filteredEntries = await getSortedHabits(_searchController);
    print(filteredEntries);
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_searchHabits);
  }

  bool flagInit = true;
  @override
  Widget build(BuildContext context) {
    if (flagInit == true) {
      _searchHabits();
      flagInit = false;
    }
    final currentWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        FutureBuilder(
            future: getSortedHabits(_searchController),
            builder: (context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isNotEmpty) {
                  return ListView.builder(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    padding: const EdgeInsets.only(top: 70),
                    itemCount: filteredEntries.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (filteredEntries[index][3] == 1) {
                        return Padding(
                          padding:
                              const EdgeInsets.only(top: 10, left: 5, right: 5),
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
                                                  color: Colors.black
                                                      .withOpacity(0.2)),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                )
                                              ]),
                                          child: Container(
                                            height: 240,
                                            color: Colors.white,
                                            child: Column(
                                              children: [
                                                Center(
                                                  child: Column(
                                                    children: [
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Container(
                                                          child: Text(
                                                              filteredEntries[
                                                                  index][0],
                                                              style:
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          23))),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        child: Text(
                                                          filteredEntries[index]
                                                              [1],
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 17),
                                                        ),
                                                        height: 100,
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Container(
                                                              child: Text(
                                                                prioprity[
                                                                    filteredEntries[
                                                                            index][2]
                                                                        as int],
                                                                style:
                                                                    const TextStyle(
                                                                        fontSize:
                                                                            20),
                                                              ),
                                                            ),
                                                            Container(
                                                              child: Text(
                                                                type[filteredEntries[
                                                                        index]
                                                                    [3] as int],
                                                                style:
                                                                    const TextStyle(
                                                                        fontSize:
                                                                            20),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Container(
                                                        child: Text(
                                                          filteredEntries[index]
                                                                  [5]
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 20),
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
                                            Navigator.pushNamed(
                                                context, '/add_habits',
                                                arguments: [
                                                  filteredEntries[index],
                                                  index
                                                ]);
                                            setState(() {});
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    if (filteredEntries[index][4].runtimeType !=
                                        int) {
                                      filteredEntries[index][4] =
                                          int.parse(filteredEntries[index][4]);
                                    }

                                    if (filteredEntries[index][4] > 0) {
                                      _boxUpdate(index, filteredEntries);
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              content: Text(
                                                  'You can do it ${filteredEntries[index][4]} more time(s)'),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, 'OK'),
                                                  child: const Text('OK'),
                                                ),
                                              ],
                                            );
                                          });
                                    } else {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text(
                                                  "You are breathtaking!"),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, 'OK'),
                                                  child: const Text('OK'),
                                                ),
                                              ],
                                            );
                                          });
                                    }
                                  },
                                  child: const Text('Done'),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  );
                } else {
                  return Container();
                }
              }
              return const CircularProgressIndicator();
            }),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                width: 30,
                child: IconButton(
                  icon: Icon(Icons.replay),
                  onPressed: () {
                    _searchHabits();
                  },
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: currentWidth - 90,
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelText: 'Search',
                    filled: true,
                    fillColor: Colors.white.withAlpha(235),
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                width: 30,
                child: IconButton(
                  icon: filteredIcon,
                  onPressed: () {
                    sortedHabits();
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
