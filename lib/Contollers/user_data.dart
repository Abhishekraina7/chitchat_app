
import 'package:flutter/cupertino.dart';
class Userdata extends ChangeNotifier{
  static String name = '';

  void setName(String newName){
    name = newName;
    notifyListeners();
  }
}
