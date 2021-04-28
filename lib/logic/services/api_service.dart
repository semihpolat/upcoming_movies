import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:movies_project/logic/model/movies_model.dart';

class ApiServices {
  static var client = http.Client();

  static Future getPosts() async {
    var response = await client.get(
        'https://raw.githubusercontent.com/FEND16/movie-json-data/master/json/movies-coming-soon.json');
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print('response.body : ' + response.body.toString());
      List<MoviesModel> movies = (json.decode(jsonString) as List)
          .map((data) => MoviesModel.fromJson(data))
          .toList();
      /*  List<MoviesModel> movies = json
          .decode(response.body)
          .map((data) => MoviesModel.fromJson(data))
          .toList(); */
      /*      Iterable l = json.decode(response.body);
      List<MoviesModel> movies =
          List<MoviesModel>.from(l.map((model) => MoviesModel.fromJson(model))); */
      return movies;
      //return MoviesModel.fromJson(json.decode(jsonString)).toList();
    } else {
      return null;
    }
  }
}
