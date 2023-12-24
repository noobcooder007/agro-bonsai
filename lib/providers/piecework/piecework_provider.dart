import 'package:flutter/material.dart';

import 'package:agro_bonsai/domain/models/piecework.dart';

class PieceworkProvider with ChangeNotifier {
  final List<Piecework> _pieceworks = List.empty(growable: true);

  List<Piecework> get pieceworks {
    return _pieceworks;
  }

  addPiecework(Piecework piecework) {
    _pieceworks.add(piecework);
    notifyListeners();
  }
}
