import 'dart:async';
import 'dart:convert';

import 'package:postgres/postgres.dart';

class NewsApi{

  Future <List> loadNews() async{


    var connection = new PostgreSQLConnection("host", 5432, "data_base", username: "xxx", password: "xxx",  useSSL: true);
    await connection.open();

    List<Map<String, Map<String, dynamic>>> querie = await connection.mappedResultsQuery(
        "SELECT url_img, tittle, date, description FROM notices");

    await connection.close();


    return querie;

  }

}
