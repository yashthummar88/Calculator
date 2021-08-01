import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String output = "0", _output = "", _previous = "";
  double a = 0, b = 0;
  String operand;

  void ans() {}

  void calculate(String _text) {
    if (_text == "C") {
      output = "0";
      operand = "";
      _output = "";
      _previous = "";
    } else if (_text == ".") {
      if (operand.length < 1) {
        output = output + _text;
      } else {
        output = output + _text;
        _output = _output + _text;
      }
    } else if (_text == "+" ||
        _text == "-" ||
        _text == "*" ||
        _text == "/" ||
        _text == "%") {
      operand = _text;
      a = double.parse(output);
      output = output + _text;
    } else if (_text == "=") {
      _previous = output;
      b = double.parse(_output);
      _output = "";
      if (operand == "+")
        output = (a + b).toInt().toString();
      else if (operand == "-")
        output = (a - b).toInt().toString();
      else if (operand == "*")
        output = (a * b).toInt().toString();
      else if (operand == "/")
        output = (a ~/ b).toInt().toString();
      else if (operand == "%") output = (a % b).toInt().toString();
    } else if (_text == "+/-") {
      if (_output.length > 0) {
        if (double.parse(_output) > 0)
          _output = (double.parse(_output) * -1).toInt().toString();
        else
          _output = (double.parse(_output) * 1).toInt().toString();
      } else {
        if (double.parse(output) > 0)
          output = (double.parse(output) * -1).toInt().toString();
        else
          output = (double.parse(output) * 1).toInt().toString();
      }
    } else {
      if (output == "0") {
        output = "";
        output = output + _text;
      } else {
        if (operand.length > 0) {
          output = output + _text;
          _output = _output + _text;
        } else
          output = output + _text;
      }
    }
  }

  Widget _button(
      String _text, Color _textColor, Color _backColor, String _heroTag) {
    return FloatingActionButton(
      heroTag: _heroTag,
      backgroundColor: _backColor,
      onPressed: () {
        setState(() {
          calculate(_text);
        });
      },
      child: Text(
        _text,
        style: TextStyle(fontSize: 25, color: _textColor),
      ),
    );
  }

  var _theme = Brightness.light;
  Color bcolor1 = Colors.white, color1 = Colors.black;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: _theme,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10, top: 10),
                alignment: Alignment.topLeft,
                child: FloatingActionButton(
                  backgroundColor: bcolor1,
                  child: Icon(
                    Icons.nights_stay,
                    size: 30,
                    color: color1,
                  ),
                  onPressed: () {
                    setState(() {
                      if (_theme == Brightness.dark) {
                        _theme = Brightness.light;
                        bcolor1 = Colors.white;
                        color1 = Colors.black;
                      } else {
                        _theme = Brightness.dark;
                        bcolor1 = Colors.black;
                        color1 = Colors.white;
                      }
                    });
                  },
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.only(right: 20),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      _previous,
                      style: TextStyle(fontSize: 30, color: Colors.grey),
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(right: 20),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      output,
                      style:
                          TextStyle(fontSize: 55, fontWeight: FontWeight.w400),
                    ),
                  )),
              Expanded(
                child: Divider(
                  endIndent: 10,
                  indent: 10,
                  height: 5,
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: _button("C", Colors.grey, Colors.white, "b1"),
                      flex: 1,
                    ),
                    Expanded(
                      child: _button("+/-", Colors.grey, Colors.white, "b2"),
                      flex: 1,
                    ),
                    Expanded(
                      child: _button("%", Colors.grey, Colors.white, "b3"),
                      flex: 1,
                    ),
                    Expanded(
                      child:
                          _button("/", Colors.deepOrange, Colors.white, "b4"),
                      flex: 1,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: _button("7", Colors.grey, Colors.white, "b5")),
                    Expanded(
                        child: _button("8", Colors.grey, Colors.white, "b6")),
                    Expanded(
                        child: _button("9", Colors.grey, Colors.white, "b7")),
                    Expanded(
                        child: _button(
                            "*", Colors.deepOrange, Colors.white, "b8")),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: _button("4", Colors.grey, Colors.white, "b9")),
                    Expanded(
                        child: _button("5", Colors.grey, Colors.white, "b10")),
                    Expanded(
                        child: _button("6", Colors.grey, Colors.white, "b11")),
                    Expanded(
                        child: _button(
                            "-", Colors.deepOrange, Colors.white, "b12")),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: _button("1", Colors.grey, Colors.white, "b13")),
                    Expanded(
                        child: _button("2", Colors.grey, Colors.white, "14")),
                    Expanded(
                        child: _button("3", Colors.grey, Colors.white, "b15")),
                    Expanded(
                        child: _button(
                            "+", Colors.deepOrange, Colors.white, "b16")),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: _button("00", Colors.grey, Colors.white, "b17")),
                    Expanded(
                        child: _button("0", Colors.grey, Colors.white, "b18")),
                    Expanded(
                        child: _button(".", Colors.grey, Colors.white, "b19")),
                    Expanded(
                        child: _button(
                            "=", Colors.white, Colors.deepOrange, "b20")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
