import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

final menuProvider = _MenuProvider();

class _MenuProvider {
  List<dynamic> options = [];

  _MenuProvider() {
    loadData();
  }

  Future<List> loadData() async {
    final data = await rootBundle.loadString('data/menu_opts.json');

    Map<String, dynamic> jsonMap = json.decode(data);
    options = jsonMap['rutas'];

    return options;
  }
}
