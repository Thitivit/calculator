import 'package:calculator/allFile/constantcalculator.dart';

int precedence(String op) {
  if (op == ButtonId.plus || op == ButtonId.minus) return 1;
  if (op == ButtonId.multiplication || op == ButtonId.division) return 2;
  return 0;
}


double _applyOpration(double a, double b, String op) {
  if (op == ButtonId.plus) return a + b;
  if (op == ButtonId.minus) return a - b;
  if (op == ButtonId.multiplication) return a * b;
  return a / b;
}

String reOpertoion(double a, double b, String op) {
  if (op == ButtonId.plus) return  "+" ;
  if (op == ButtonId.minus) return "-" ;
  if (op == ButtonId.multiplication) return  "*" ;
  return  "/" ;
}

double calculate(String expression) {
  expression = expression.replaceAll(',', '');
  try {
    List<double> values = [];
    List<String> operators = [];
    for (int i = 0; i < expression.length; i++) {
      if (expression[i] == ButtonId.openParantes) {
        operators.add(expression[i]);
      } else if (RegExp(r'\d').hasMatch(expression[i])) {
        String value = '';
        while (i < expression.length &&
            (RegExp(r'\d').hasMatch(expression[i]) ||
                expression[i] == ButtonId.point)) {
          value += expression[i];
          i++;
        }
        values.add(double.parse(value));
        i--;
      } else if (expression[i] == ButtonId.closeParantes) {
        while (operators.isEmpty == false &&
            operators.last != ButtonId.openParantes) {
          double secondValue = values.removeLast();
          double firstValue = values.removeLast();

          String op = operators.removeLast();
          print("op$op");
          values.add(_applyOpration(firstValue, secondValue, op));
        }
        if (operators.isEmpty == false) {
          operators.removeLast();
        }
      } else {
        while (operators.isEmpty == false &&
            precedence(operators.last) >= precedence(expression[i])) {
          double secondValue = values.removeLast();
          double firstValue = values.removeLast();
          String op = operators.removeLast();
          values.add(_applyOpration(firstValue, secondValue, op));
        }
        operators.add(expression[i]);
      }
    }
    if(operators.isEmpty){
      while (operators.isEmpty == true) {
        double secondValue = values.removeLast();
        double firstValue = values.removeLast();
        // String op = operators.removeLast();
        values.add(_applyOpration(firstValue, secondValue, ""));
      }
    }else{
      // print("operator$operators");

      while (operators.isEmpty == false) {
        double secondValue = values.removeLast();
        double firstValue = values.removeLast();
        String op = operators.removeLast();
        values.add(_applyOpration(firstValue, secondValue, op));
      }
    }

    return values.last;
  } catch (error) {
    print(error);
  }

  return double.infinity;
}
