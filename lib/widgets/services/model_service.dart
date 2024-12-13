import 'dart:convert';

import 'package:moofy/widgets/models/movie.dart';
import 'package:http/http.dart' as http;

class ModelService {
  final BASE_URL = "";
  final headers = {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0NWI3Y2QwNjIwNDg1NTFkMDQxNWUxNzBmZThkNGM2OSIsIm5iZiI6MTczMzkxOTMxNi42LCJzdWIiOiI2NzU5ODI1NGFkOTE4NzIxZDBkZWViNDgiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.lS7kbghYqkxz-f8YOAOS3HYtsDGpZx1sRbFf2XR9Evo',
    'accept': 'application/json'
  };

  Future<List<Movie>> fetchtopRatedMovie() async {
    final response = await http
        .get(Uri.parse('${BASE_URL}?top_rated?language=id-ID&page=1'));

    if (response.statusCode == 200) {
      return (json.decode(response.body)['results'] as List)
          .map((data) => Movie.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to load movie');
    }
  }
}
