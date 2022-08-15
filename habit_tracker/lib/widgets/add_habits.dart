import 'package:flutter/material.dart';

class AddHabitsWidget extends StatefulWidget {
  AddHabitsWidget({Key? key}) : super(key: key);

  @override
  State<AddHabitsWidget> createState() => _AddHabitsWidgetState();
}

InputDecoration decorator(text) {
  var Inputdecorator = InputDecoration(
    border: OutlineInputBorder(),
    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
String dropdownvalue = 'Medium';
int selectedValue = 0;

class _AddHabitsWidgetState extends State<AddHabitsWidget> {
  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          TextField(
            // controller: _loginTextController,
            decoration: decorator('Name'),
          ),
          TextField(
            // controller: _loginTextController,
            decoration: decorator('Description'),
          ),
          TextField(
            // controller: _loginTextController,
            decoration: decorator('Prioprity'),
          ),
          DropdownButton(
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
          RadioListTile(
            value: 0,
            groupValue: selectedValue,
            onChanged: (value) => setState(() => {selectedValue = value as int}),
            title: Text('good'),
          ),
          RadioListTile(
            value: 1,
            groupValue: selectedValue,
            onChanged: (value) => setState(() => {
              print(selectedValue),
              selectedValue = value as int,
              print(selectedValue),
              }),
            title: Text('bad'),
          ),
          TextField(
            // controller: _loginTextController,
            decoration: decorator('Type'),
          ),
          TextField(
            // controller: _loginTextController,
            decoration: decorator('Amount'),
          ),
          TextField(
            // controller: _loginTextController,
            decoration: decorator('Periodicity'),
          ),
          Center(
            child: TextButton(
              onPressed: () {},
              child: Text('Submit'),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Color.fromARGB(255, 16, 65, 104)),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                textStyle: MaterialStateProperty.all(
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(
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
