class Calculation {
  String _text;
  Calculation(this._text);

  String output = "0", _output = "", _previous = "";
  double a = 0, b = 0;
  String operand;
  void calculate() {
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
}
