import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HabitsWidget extends StatefulWidget {
  const HabitsWidget({Key? key}) : super(key: key);

  @override
  State<HabitsWidget> createState() => _HabitsWidgetState();
}

Future<List> getHabits() async {
  await Hive.initFlutter();
  Box<dynamic> box = await Hive.openBox('storage');
  return box.values.toList();
}

var prioprity = [
  'Low',
  'Medium',
  'High',
];

var type = [
  'good',
  'bad',
];

Future<List> getSortedHabits(searchController) async {
  var mymap = await getHabits();
  List<dynamic> filteredEntries = [];
  if (searchController.text.isNotEmpty) {
    filteredEntries = mymap.where((element) {
      return element.contains(searchController.text.toLowerCase());
    }).toList();
  } else {
    filteredEntries = mymap;
  }
  return filteredEntries;
}

void _boxUpdate(index, filteredEntries) async {
  await Hive.initFlutter();
  Box<dynamic> box = await Hive.openBox('storage');
  var value = filteredEntries[index];
  value[4] -= 1;
  box.putAt(index, value);
}

class _HabitsWidgetState extends State<HabitsWidget> {
  List<dynamic> filteredEntries = [];
  final _searchController = TextEditingController();

  void _searchHabits() async {
    filteredEntries = await getSortedHabits(_searchController);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_searchHabits);
  }

  @override
  Widget build(BuildContext context) {
    _searchHabits();
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
                      if (filteredEntries[index][3] == 0) {
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
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    try {
                                      int.parse(filteredEntries[index][4]);
                                    } catch (e) {}
                                    ;

                                    if (filteredEntries[index][4] > 0) {
                                      _boxUpdate(index, filteredEntries);
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              content: Text(
                                                  'You can do it ${filteredEntries[index][4]} times'),
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
                                                  'Stop doing this!'),
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
      ],
    );
  }
}
