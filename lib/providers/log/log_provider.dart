import 'package:flutter/material.dart';

import 'package:agro_bonsai/domain/models/log.dart';

class LogProvider with ChangeNotifier {
  final List<Log> _logs = List.empty(growable: true);

  List<Log> get logs {
    return _logs;
  }
}
