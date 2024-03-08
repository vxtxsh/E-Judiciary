import 'dart:convert';

import 'package:ejudiapp/erepository/models/slider_model.dart';
import 'package:http/http.dart' as http;

//639d10116c964e13acf705f1d3235f69
class Sliders {
  List<sliderModel> sliders = [];

  Future<void> getSlider() async {
    String url =
          "https://newsapi.org/v2/everything?q=judiciary&from=2023-12-02&sortBy=publishedAt&apiKey=639d10116c964e13acf705f1d3235f69";
        //"https://newsapi.org/v2/top-headlines?country=in&from=2023-11-15&sortBy=publishedAt&apiKey=639d10116c964e13acf705f1d3235f69";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          sliderModel slidermodel = sliderModel(
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
            author: element["author"],
          );
          sliders.add(slidermodel);
        }
      });
    }
  }
}
