import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

//api request and parse json response
class ApiRequest {
  static Future<List<dynamic>?> getQuestions() async {
    String url =
        'https://opentdb.com/api.php?amount=10&category=9&difficulty=easy&type=multiple';
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      var questions = jsonResponse['results'];
      return questions;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }
}
