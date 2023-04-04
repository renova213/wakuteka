import 'package:http/http.dart' as http;

import 'config.dart';

class ApiConfig {
  Future<http.Response> get(
      {required String path, required String apiKey}) async {
    final url = Uri.parse('${EnvironmentConfig.apiUrl}/$path');
    final headers = {'Authorization': 'Bearer $apiKey'};
    return await http.get(url, headers: headers);
  }
}
