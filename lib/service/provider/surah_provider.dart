// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:alquranapp/service/api_service.dart';
import 'package:flutter/material.dart';

class IndexSurah with ChangeNotifier {
  var _indexSurah;
  get indexSurah => _indexSurah;
  Future fetchIndexSurah() async {
    final bodyResponse = await APISERVICE().fetchIndexSurah();
    _indexSurah = bodyResponse;
    notifyListeners();
  }

  var _showSurah;
  get showSurah => _showSurah;
  Future fetchShowSurah(int id) async {
    final bodyResponse = await APISERVICE().fetchShowSurah(id);
    _showSurah = bodyResponse;
    notifyListeners();
  }
}
