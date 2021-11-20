import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moods/models/customButtonDataModel.dart';

class ReadJsonDataProvider with ChangeNotifier {
  CustomButtonDataModel _items;

  CustomButtonDataModel get items => _items;

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('asstes/data/customButtonData.json');
    final data = await json.decode(response);

    _items = CustomButtonDataModel.fromJson(data);

    notifyListeners();
  }
}
