import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddProvider with ChangeNotifier {
  final List<String> _addnote = [];
  List<String> get addnote => _addnote;
  void addNote(String value) {
    addnote.add(value);
    notifyListeners();
  }

  void removenote(String value) {
    addnote.remove(value);
    notifyListeners();
  }
}
