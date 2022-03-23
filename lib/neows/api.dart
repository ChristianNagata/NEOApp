import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map> fetchData() async {
  const apiKey = 'hKuFyqogFT5y2egU9TjUUdWrEd7PPc7vKmOB5PrY';
  const url = 'https://api.nasa.gov/neo/rest/v1/feed/today?detailed=true&api_key=$apiKey';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return jsonDecode(response.body)['near_earth_objects'];
    // return NearEarthObjects.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}