import 'package:flutter/material.dart';
import 'styles/theme.dart'; // Importando o tema

void main() {
  runApp(CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: AppTheme.darkTheme,
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String _output = "0";
  String _input = "";
  String _expression = "";
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  void _buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _input = "";
      num1 = 0;
      num2 = 0;
      operand = "";
      _output = "0";
      _expression = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "×" ||
        buttonText == "÷") {
      if (_input.isNotEmpty) {
        num1 = double.parse(_input);
        operand = buttonText;
        _expression = "$_input $operand";
        _input = "";
      }
    } else if (buttonText == "=") {
      if (_input.isNotEmpty) {
        num2 = double.parse(_input);
        switch (operand) {
          case "+":
            _output = (num1 + num2).toString();
            break;
          case "-":
            _output = (num1 - num2).toString();
            break;
          case "×":
            _output = (num1 * num2).toString();
            break;
          case "÷":
            _output = num2 != 0 ? (num1 / num2).toString() : "Erro";
            break;
        }
        _expression = "$num1 $operand $num2 =";
        _input = _output;
      }
    } else {
      _input += buttonText;
      _output = _input;
      _expression = "$num1 $operand $_input".trim();
    }

    setState(() {});
  }

  Widget _buildButton(String text, {bool isOperator = false, bool isClear = false}) {
    return ElevatedButton(
      style: isClear
          ? AppTheme.clearButtonStyle
          : isOperator
              ? AppTheme.operatorButtonStyle
              : AppTheme.numericButtonStyle,
      onPressed: () => _buttonPressed(text),
      child: Text(
        text,
        style: TextStyle(fontSize: 28.0),
      ),
    );
  }

  Widget _buildRow(List<String> texts, {List<bool>? operators, List<bool>? clears}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: texts
          .asMap()
          .entries
          .map(
            (entry) => Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: _buildButton(
                  entry.value,
                  isOperator: operators?[entry.key] ?? false,
                  isClear: clears?[entry.key] ?? false,
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Text(
              _expression,
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.grey[400],
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            child: Text(
              _output,
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(child: Divider(color: Colors.blueAccent)),
          Column(
            children: [
              _buildRow(["7", "8", "9", "÷"], operators: [false, false, false, true]),
              _buildRow(["4", "5", "6", "×"], operators: [false, false, false, true]),
              _buildRow(["1", "2", "3", "-"], operators: [false, false, false, true]),
              _buildRow([".", "0", "C", "+"], clears: [false, false, true, true]),
              _buildRow(["="], operators: [true]),
            ],
          )
        ],
      ),
    );
  }
}
