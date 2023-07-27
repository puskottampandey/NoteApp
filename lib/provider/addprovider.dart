import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddProvider with ChangeNotifier {
  List<String> _addnote = [];

  List<String> get addnote => _addnote;

  void addNote(String value) {
    addnote.addAll([value]);
    notifyListeners();
  }

  void removenote(String value) {
    addnote.remove(value);
    notifyListeners();
  }

  String _searchquery = "";
  String get searchquery => _searchquery;

  void setSearchquery(String query) {
    _searchquery = query;
    notifyListeners();
  }

  List<String> flternote = [];
  List<String> get filternote {
    if (_searchquery.isEmpty) {
      return _addnote;
    } else {
      return _addnote
          .where((note) => note.startsWith(_searchquery.toLowerCase()))
          .toList();
    }
  }

  void sort() {
    _addnote.sort(((a, b) => a.length.compareTo(b.length)));
    notifyListeners();
  }
}
