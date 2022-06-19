import 'package:calculator/allFile/cal.dart';
import 'package:calculator/allFile/constantcalculator.dart';
import 'package:calculator/allFile/keyboard.dart';
import 'package:calculator/allFile/utilscal.dart';
import 'package:flutter/material.dart';


class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _primaryDisplayerText = '';
  String _secondaryDisplayerText = '';
  String? a;
  String? b;

  Future<void> resultSum(String sum) async {
    print(sum);
    double results = calculate(sum);
    if (sum.contains("+") ||
        sum.contains("−") ||
        sum.contains("×") ||
        sum.contains("÷")) {
      if (results != double.infinity) {
        _secondaryDisplayerText = _primaryDisplayerText;
        _primaryDisplayerText = cleanResult(results);
      } else {
        _secondaryDisplayerText = 'กรอกไม่ถูกต้อง';
      }
    } else {
      _secondaryDisplayerText = _primaryDisplayerText;
      _primaryDisplayerText = cleanResult(results);
    }
  }

  void buttonPressed(String id) {
    setState(
          () {
        if (id == ButtonId.ac) {
          _primaryDisplayerText = '';
          _secondaryDisplayerText = '';
        } else if (id == ButtonId.equal) {
          resultSum(_primaryDisplayerText);
        } else if (id == ButtonId.backspace) {
          _primaryDisplayerText = _primaryDisplayerText.replaceAll(RegExp(r'.$'), '');
          double result = calculate(_primaryDisplayerText);
          if (result != double.infinity)
            _secondaryDisplayerText = cleanResult(result);
        } else {
          _primaryDisplayerText += id;
          double result = calculate(_primaryDisplayerText);
          if (result != double.infinity)
            _secondaryDisplayerText = cleanResult(result);
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width * 0.93,
          margin: EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                child: SingleChildScrollView(
                                  reverse: true,
                                  child: Text(
                                    _primaryDisplayerText,
                                    textAlign: TextAlign.end,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 36,),
                                  ),
                                ),
                                width: MediaQuery.of(context).size.width * 0.65,
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _primaryDisplayerText =
                                          _primaryDisplayerText.replaceAll(RegExp(r'.$'), '');
                                    });
                                  },
                                  icon: Icon(Icons.backspace_outlined)),
                            ],),
                        ],
                      ),
                    )
                ),
                Expanded(
                  flex: 2,
                  child: Keyboard(buttonPressed),
                ),
              ]),
        ),
      ),
    );
  }
}
