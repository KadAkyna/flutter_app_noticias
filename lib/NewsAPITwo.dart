import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsApiTwo{

  String url = "https://raw.githubusercontent.com/KadAkyna/flutter_app_noticias/master/lib/json/file.json";

  Future <List> loadNews() async{
    // Make a HTTP GET request to the CoinMarketCap API.
    // Await basically pauses execution until the get() function returns a Response
    try{
      http.Response response = await http.get(url);
      // Using the JSON class to decode the JSON String
      const JsonDecoder decoder = const JsonDecoder();
      return decoder.convert(response.body);

    } on Exception catch(_){
      return null;
    }

  }

}