import 'dart:convert';

import 'package:http/http.dart' as http;

class FetchGithubDetails {
  Future<dynamic> fetchGithubDetails(String username) async {
    final response = await http.get(Uri.parse(
        "https://api.github.com/users/$username/repos?per_page=100&sort=updated"));
    if (response.statusCode == 200) {
      return await jsonDecode(response.body);
    } else {
      throw Exception('Failed to load Github details');
    }
  }
}
