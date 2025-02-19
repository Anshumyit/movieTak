import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movietask/data/modeldata.dart';


class ApiService {
  static const String apiUrl = 'https://imdb-top-100-movies.p.rapidapi.com/';
  static const Map<String, String> headers = {
    'X-RapidAPI-Key': '2d04a639f1mshbe9c8d2ac8b49e5p1f4ea3jsna2973b846f27',
    'X-RapidAPI-Host': 'imdb-top-100-movies.p.rapidapi.com'
  };

  static Future<List<Movie>> fetchMovies() async {
    final response = await http.get(Uri.parse(apiUrl), headers: headers);
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
