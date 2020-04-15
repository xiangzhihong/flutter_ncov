import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {
  static show(String msg) {
    Fluttertoast.showToast(msg: msg);
  }
}
