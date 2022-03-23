

import 'dart:convert';

import 'package:http/http.dart';
import 'package:neo/post_model.dart';

class HttpService {
  final String postUrl = 'https://api.nasa.gov/neo/rest/v1/feed/today?detailed=true&api_key=hKuFyqogFT5y2egU9TjUUdWrEd7PPc7vKmOB5PrY';

  Future<List<NearEarthObject>> getPosts() async {
    Response res = await get(Uri.parse(postUrl));

    if (res.statusCode == 200) {
      Map<String, dynamic> neo = jsonDecode(res.body)['near_earth_objects'];
      List dates = neo.keys.toList();
      List<dynamic> body = neo[dates[0]];

      List<NearEarthObject> posts = body.map((dynamic item) => NearEarthObject.fromJson(item)).toList();
      return posts;

    } else {
      throw "Can't get posts";
    }
  }
}