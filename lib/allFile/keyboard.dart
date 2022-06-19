import 'package:calculator/allFile/constantcalculator.dart';
import 'package:calculator/allFile/keyboardButton.dart';
import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  final Function passToButton;
  Keyboard(this.passToButton);

  Widget rowButton(List<String> buttons) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: buttons
            .map((id) =>
            KeyboardButton(id: id, onPressed: () => passToButton(id)))
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:
        Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: <Widget>[
          rowButton([
            ButtonId.ac,
            ButtonId.openParantes,
            ButtonId.closeParantes,
            ButtonId.division,
          ]),
          rowButton([
            ButtonId.seven,
            ButtonId.eight,
            ButtonId.nine,
            ButtonId.multiplication,
          ]),
          rowButton([
            ButtonId.four,
            ButtonId.five,
            ButtonId.six,
            ButtonId.minus,
          ]),
          rowButton([
            ButtonId.one,
            ButtonId.two,
            ButtonId.three,
            ButtonId.plus,
          ]),
          rowButton([
            ButtonId.zero,
            ButtonId.point,
            ButtonId.equal,
          ]),
        ],
      ),
    );
  }
}
