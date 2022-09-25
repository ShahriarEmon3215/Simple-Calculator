import 'package:flutter/cupertino.dart';

class CalculatorProvider with ChangeNotifier {
  String? text = "";
  double finalResult = 0.0;
  setText({String? t}) {
    if (t == " ") {
      this.text = "";
    } else if (t == "  ") {
      this.text = "Invalid format !";
    } else {
      this.text = text! + t!;
    }
    notifyListeners();
  }

  setFinalResult(double val) {
    this.finalResult = val;
    notifyListeners();
  }

  String? get getFinalResult {
    return this.finalResult != 0.0 ? this.finalResult.toString() : "= ";
  }

  String? get getText {
    return this.text;
  }

  void result() {
    String num = "";

    String pSign = "";
    int i, length, is_num_started;
    double? result = 0.0;
    text = text! +
        " "; // a space created for execute last digit and end the last number, otherwise it will not count last number.
    length = text!.length;
    is_num_started = 0;

    for (i = 0; i < length; i++) {
      if (text![i] == '0' ||
          text![i] == '1' ||
          text![i] == '2' ||
          text![i] == '3' ||
          text![i] == '4' ||
          text![i] == '5' ||
          text![i] == '6' ||
          text![i] == '7' ||
          text![i] == '8' ||
          text![i] == '9' ||
          text![i] == '.') {
        if (is_num_started == 0) {
          is_num_started = 1;
        }

        num = num + text![i];
      } else {
        if (is_num_started == 1) {
          is_num_started = 0;
        }

        if (result == 0.0) {
          result = double.parse(num);
          num = "";
          pSign = text![i];
        } else {
          try {
            if (pSign == '+') {
              result = result! + double.parse(num);
            } else if (pSign == '-') {
              result = result! - double.parse(num);
            } else if (pSign == '*') {
              result = result! * double.parse(num);
            } else if (pSign == '\u00F7') {
              result = result! / double.parse(num);
            } else if (pSign == '%') {
              result = (result! / 100) * double.parse(num);
            }
          } catch (e) {
            setText(t: "");
            setText(t: "  ");
          }

          num = "";

          pSign = text![i];
        }
      }
    }
    backspace(); // for delete a space which was created in line 34
    setFinalResult(result!);
  }

  void backspace() {
    if (this.text!.length > 0 && this.text != null) {
      List<String> c = text!.split("");
      c.removeLast();
      text = c.join();
      notifyListeners();
    }
  }
}
