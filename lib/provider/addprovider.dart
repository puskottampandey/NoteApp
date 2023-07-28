import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddProvider with ChangeNotifier {
  final List<String> _addnote = [];

  List<String> get addnote => _addnote;
//  Adding the note
  void addNote(String value) {
    addnote.addAll([value]);
    notifyListeners();
  }

// removing the note
  void removenote(String value) {
    addnote.remove(value);
    notifyListeners();
  }

  String _searchquery = "";
  String get searchquery => _searchquery;
// searchin the note
  void setSearchquery(String query) {
    _searchquery = query;
    notifyListeners();
  }

  //filtering the note

  List<String> get filternote {
    if (_searchquery.isEmpty) {
      return _addnote;
    } else {
      return _addnote
          .where((note) => note.startsWith(_searchquery.toLowerCase()))
          .toList();
    }
  }

//sorting the note with the note length
  void sort() {
    _addnote.sort(((a, b) => a.length.compareTo(b.length)));
    notifyListeners();
  }
}
