import 'package:xml2json/xml2json.dart';

import './custom_exception.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';

class ApiProvider {
  final String _baseUrl =
      "https://en.wikipedia.org/w/api.php?action=featuredfeed&format=json&feed=featured";

  Future<dynamic> get() async {
    dynamic responseJson;
    try {
      final xml2json = Xml2Json();
      http.Response response = await http.get(Uri.parse(_baseUrl));
      var xmlResponse = response.body;
      xml2json.parse(xmlResponse);
      var jsonArticles = xml2json.toParker();
      var decodedArticlesData = await jsonDecode(jsonArticles);
      responseJson = await decodedArticlesData["rss"]["channel"]["item"];
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }
}
