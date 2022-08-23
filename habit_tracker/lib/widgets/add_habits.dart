import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/generated/api.swagger.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../sources/api_keys.dart';

class AddHabitsWidget extends StatefulWidget {
  final List habit;
  final int index;
  const AddHabitsWidget({Key? key, required this.habit, required this.index})
      : super(key: key);
  @override
  State<AddHabitsWidget> createState() => _AddHabitsWidgetState(habit, index);
}

InputDecoration decorator(text) {
  var Inputdecorator = InputDecoration(
    border: const OutlineInputBorder(),
    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    isCollapsed: true,
    fillColor: Colors.red,
    focusColor: Colors.red,
    hoverColor: Colors.red,
    hintText: text,
  );
  return Inputdecorator;
}

var items = [
  'Low',
  'Medium',
  'High',
];
String dropdownvalue = items[1];
int selectedValue = 0;

class _AddHabitsWidgetState extends State<AddHabitsWidget> {
  _AddHabitsWidgetState(this.habit, this.index);
  List habit;
  int index;
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _amountController = TextEditingController();
  final _periodicityController = TextEditingController();

  void _addHabit(context) async {
    DateTime time = DateTime.now();
    final timestamp =
        DateTime.fromMicrosecondsSinceEpoch(time.microsecondsSinceEpoch);
    await Hive.initFlutter();
    var box = await Hive.openBox('storage');
    final habitsApi = Api.create();
    Response<Habit> response = await habitsApi.habitsPost(
        requestBody: AddHabit(
            title: _nameController.text,
            description: _descriptionController.text,
            priority: items.indexOf(dropdownvalue),
            type: selectedValue,
            count: int.parse(_amountController.text),
            frequency: int.parse(_periodicityController.text),
            color: 0,
            date: timestamp.millisecondsSinceEpoch),
        authorization: ApiKeys().authorization);
    await box.add([
      _nameController.text,
      _descriptionController.text,
      items.indexOf(dropdownvalue),
      selectedValue,
      _amountController.text,
      _periodicityController.text,
      response.body!.uid,
      timestamp.millisecondsSinceEpoch
    ]);
    Navigator.pop(context);
    return null;
  }

  void _updateHabit(context) async {
    Navigator.pop(context);
    await Hive.initFlutter();
    var box = await Hive.openBox('storage');
    box.putAt(index, [
      _nameController.text,
      _descriptionController.text,
      items.indexOf(dropdownvalue),
      selectedValue,
      _amountController.text,
      _periodicityController.text,
      box.values.last[6],
      box.values.last[7],
    ]);
  }

  void _deleteHabit(context) async {
    print(habit);
    Navigator.pop(context);
    await Hive.initFlutter();
    var box = await Hive.openBox('storage');
    box.deleteAt(index);
    final habitsApi = Api.create();
    Response<Success> response = await habitsApi.habitsIdDelete(
        id: habit[6], authorization: ApiKeys().authorization);
  }

  bool flagUpdate = true;
  bool flagInit = true;
  @override
  Widget build(BuildContext context) {
    if (flagInit == true) {
      print(habit);
      if (habit.isEmpty) {
        habit = ['', '', 1, 0, '', ""];
        flagUpdate = false;
      } else {
        _nameController.text = habit[0];
        _descriptionController.text = habit[1];
        _amountController.text = habit[4].toString();
        _periodicityController.text = habit[5].toString();
        String dropdownvalue = items[habit[2]];
        int selectedValue = habit[3];
      }
      flagInit = false;
    }
    InputDecoration textFieldDecorator = const InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      isCollapsed: true,
      fillColor: Colors.red,
      focusColor: Colors.red,
      hoverColor: Colors.red,
    );
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    filled: true,
                    fillColor: Colors.white.withAlpha(235),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    filled: true,
                    fillColor: Colors.white.withAlpha(235),
                    border: const OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: DropdownButton(
                value: dropdownvalue,
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(
                    () {
                      dropdownvalue = newValue!;
                    },
                  );
                },
              ),
            ),
          ),
          RadioListTile(
            value: 0,
            groupValue: selectedValue,
            onChanged: (value) =>
                setState(() => {selectedValue = value as int}),
            title: const Text('good'),
          ),
          RadioListTile(
            value: 1,
            groupValue: selectedValue,
            onChanged: (value) =>
                setState(() => {selectedValue = value as int}),
            title: const Text('bad'),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
            ),
            child: Column(
              children: [
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _amountController,
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    filled: true,
                    fillColor: Colors.white.withAlpha(235),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _periodicityController,
                  decoration: InputDecoration(
                    labelText: 'Periodicity',
                    filled: true,
                    fillColor: Colors.white.withAlpha(235),
                    border: const OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                if (flagUpdate == false) {
                  _addHabit(context);
                } else {
                  _updateHabit(context);
                }
              },
              child: const Text('Submit'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 16, 65, 104)),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                textStyle: MaterialStateProperty.all(
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: TextButton(
              onPressed: () {
                if (flagUpdate == true) {
                  _deleteHabit(context);
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: const Text("You can't delete this"),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text('Delete'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 16, 65, 104)),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                textStyle: MaterialStateProperty.all(
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
