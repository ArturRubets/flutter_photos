import 'dart:convert';

import 'package:http/http.dart' as http;

import 'configuration.dart';
import 'model/photo.dart';

class PhotoApiClient {
  final http.Client _httpClient;

  PhotoApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  Future<List<Photo>> photos(String clientId, int page) async {
    final request = Uri.https(
      Configuration.baseUrl,
      'photos',
      <String, String>{
        'client_id': clientId,
        'page': '$page',
      },
    );

    final response =
        await _httpClient.get(request).timeout(const Duration(seconds: 5));

    if (response.statusCode != 200) {
      throw PhotoRequestFailure();
    }

    final json = jsonDecode(response.body) as List;

    if (json.isEmpty) {
      throw PhotoNotFoundFailure();
    }

    return json
        .map((photo) => Photo.fromJson(photo as Map<String, dynamic>))
        .toList();
  }
}

class PhotoRequestFailure implements Exception {}

class PhotoNotFoundFailure implements Exception {}
