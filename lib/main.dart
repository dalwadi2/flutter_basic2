import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _state createState() => new _state();
}

class _state extends State<MyApp> {
  bool value1 = false;
  bool value2 = false;

  double sliderValue = 0.0;

  String dateValue = '';

  Future selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2019));
    if (picked != null) {
      setState(() {
        dateValue = picked.toString();
      });
    }
  }

  void setSliderValue(double value) => setState(() => sliderValue = value);

  void onChange1(bool value) => setState(() => value1 = value);

  void onChange2(bool value) => setState(() => value2 = value);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('My Title'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text('Value: ${(sliderValue * 100).round()}'),
              new Switch(value: value1, onChanged: onChange1),
              new SwitchListTile(
                value: value2,
                onChanged: onChange2,
                title: new Text(
                  'Switch',
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green),
                ),
              ),
              new Slider(value: sliderValue, onChanged: setSliderValue),
              new IconButton(
                  icon: new Icon(Icons.date_range), onPressed: selectDate),
              new Text(dateValue),
            ],
          ),
        ),
      ),
    );
  }
}
