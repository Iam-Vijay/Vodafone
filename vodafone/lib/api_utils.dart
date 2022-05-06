
import 'dart:convert';
import 'package:vodafone/SpinnerClass.dart';
import 'package:http/http.dart' as http;



class api_utils{

  Future<List<SpinnerClass>> fetchPosts() async {
    http.Response response = await http.get(Uri.parse("https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/index.json"));
    List responseJson = json.decode(response.body);
    return responseJson.map((m) => new SpinnerClass.fromJson(m)).toList();
  }

}