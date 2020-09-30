import 'package:all_testing_pg/choice_effect.dart';
import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'What happened before?',
        home: _InputChipExample(),
        theme: new ThemeData(scaffoldBackgroundColor: Colors.red[100]));
  }
}

class _InputChipExample extends StatefulWidget {
  @override
  _InputChipExampleState createState() => new _InputChipExampleState();
}

class _InputChipExampleState extends State<_InputChipExample> {
  List<int> _selectedIndex = [];
  List<String> _options = [
    'Relationship Problem',
    'Family Conflict',
    'loosing Someone',
    'Rape and Sexual Abuse',
    'Work Problem',
    'Cling to Someone'
  ];
  // var _ShowSelectedItem = [];

  // getItems() {
  //   _options.forEach((key, value) {
  //     if (value == true) {
  //       _ShowSelectedItem.add(key);
  //     }
  //   });
  //   print(_options);
  // }

  Widget _buildChips() {
    List<Widget> chips = new List();

    for (int i = 0; i < _options.length; i++) {
      ChoiceChip choiceChip = ChoiceChip(
        selected: _selectedIndex.contains(i),
        label: Text(_options[i], style: TextStyle(color: Colors.white)),
        //avatar: FlutterLogo(),
        elevation: 10,
        pressElevation: 5,
        shadowColor: Colors.teal,
        backgroundColor: Colors.pinkAccent,
        selectedColor: Colors.lightBlue[300],
        onSelected: (bool selected) {
          setState(() {
            if (selected) {
              _selectedIndex.add(i);
            } else {
              _selectedIndex.remove(i);
            }
          });
          
        },
      );

      chips.add(Padding(
          padding: EdgeInsets.symmetric(horizontal: 10), child: choiceChip));
    }

    return ListView(
      // This next line does the trick.
      scrollDirection: Axis.vertical,
      children: chips,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[200],
        title: Text('What happened before?'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              child: _buildChips(),
            ),
            new RaisedButton(
              color: Colors.cyanAccent,
              child: new Text("Choice your feeling"),
              onPressed: () {
                //setState(() {
                 // _options.add("Relationship");
                  //Fluttertoast.showToast(msg: _options.toString());
                //});
                // getItems();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Effect()));
              },
            )
          ],
        ),
      ),
    );
  }
}
