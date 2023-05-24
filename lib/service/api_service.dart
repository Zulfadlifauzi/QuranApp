import 'dart:convert';

import 'package:http/http.dart' as http;

class APISERVICE {
  final String baseUrl = 'https://equran.id/api/v2/';
  Future fetchIndexSurah() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/surat'));
      final bodyResponse = json.decode(response.body);
      return bodyResponse['data'];
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future fetchShowSurah(int id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/surat/$id'));
      final bodyResponse = json.decode(response.body);
      return bodyResponse['data'];
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
