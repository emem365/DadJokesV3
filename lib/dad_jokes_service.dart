import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class DadJokesService {
  static String url = "https://icanhazdadjoke.com/";
  static Future<String> getRandomJoke() async {
    var response = await http.get(url, headers: {'Accept': 'text/plain'});
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "Error with status code : ${response.statusCode}";
    }
  }

  static Future<String> getJokeByTopic(String topic) async {
    String searchURL='$url/search?term=$topic&limit=30';
    var response = await http.get(searchURL, headers: {'Accept': 'application/json'});
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return (jsonResponse['results']..shuffle()).last['joke'];
    } else {
      return "Error with status code : ${response.statusCode}";
    }
  }
}
