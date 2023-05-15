import 'package:alquranapp/model/surah_index_model.dart';
import 'package:http/http.dart' as http;

class APISERVICE {
  final String baseUrl = 'https://equran.id/api/v2/';
  Future<IndexSurah> fetchIndexSurah() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/surat'));
      final bodyResponse = indexSurahFromJson(response.body);
      return bodyResponse;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
