import 'package:flutter/material.dart';

 class Effect extends StatefulWidget {
  @override
  _EffectState createState() => new _EffectState();
}

class _EffectState extends State<Effect> with TickerProviderStateMixin {
  List<int> _selectedIndex = [];
  List<String> _options = [
    'Sleeping Problem',
    'Lossing Appetite',
    'Weight Up or Weight gain',
    'Focus Problem',
    'Easily Angry',
    'Constant Worrying',
    'Loneless and Isolation',
    'Feeling Overwhelmed',
    'Unhappy',
    'Suicidal Thought',
    'Feeling Sad or Down',
    'Overuse Alchol or Drugs',
    'Withdraw Friends',
    'Withdraw Activity',
    'Sex Drive Change',
    'Mood Swims'
  ];

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
            print("_selectedIndex");
          });
        },
      );

      chips.add(Column(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal:10), child: choiceChip),
        ],
      ));
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
        title: Text('Choice your feeling now'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Container(
                height: 700,
                child: _buildChips(),
              ),
            ],
          )),
    );
  }
}
