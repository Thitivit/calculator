import 'package:calculator/allFile/constantcalculator.dart';
import 'package:flutter/material.dart';

class KeyboardButton extends StatelessWidget {
  final String id;
  final VoidCallback onPressed;
  KeyboardButton({required this.id, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return (id==ButtonId.zero)?Container(
      height: double.infinity,
      margin: EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width*0.357,
      child: ElevatedButton(
        onPressed: onPressed,
        onLongPress: onPressed,
        style: ElevatedButton.styleFrom(
          alignment: Alignment.centerLeft,
          elevation: 0.0,
          primary: Color(0xFF272B33),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60.0),
          ),
        ),
        child: setChild(id),
      ),
    ):Expanded(
      child: Container(
        height: double.infinity,
        margin: EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: onPressed,
          onLongPress: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            primary: ((id == ButtonId.ac) ||
                (id == ButtonId.openParantes) ||
                (id == ButtonId.closeParantes))
                ? Color(0xFFA177F7)
                : ((id == ButtonId.division) ||
                (id == ButtonId.minus) ||
                (id == ButtonId.multiplication) ||
                (id == ButtonId.equal) ||
                (id == ButtonId.plus))
                ? Color(0xFF673AD1)
                : Color(0xFF272B33),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(60.0),
            ),
          ),
          child: setChild(id),
        ),
      ),
    );
  }
}

Widget? setChild(String id) {

  if (id == ButtonId.ac|| id == ButtonId.closeParantes||id == ButtonId.openParantes)
    return Text(
        id,
        style: TextStyle(fontSize: 22,color: Colors.black,decoration: TextDecoration.none,)
    );
  if (id == ButtonId.zero)
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
          "$id ",

          style: TextStyle(fontSize: 22,color: Colors.grey[300],decoration: TextDecoration.none,)

      ),
    );

  if (RegExp(r'[\d\.]').hasMatch(id))
    return Text(
        id,
        style: TextStyle(fontSize: 30,color: Colors.grey[300],decoration: TextDecoration.none,)
    );

  return Text(
      id,
      style: TextStyle(fontSize: 30,color: Colors.grey[300],decoration: TextDecoration.none,)
  );
}
