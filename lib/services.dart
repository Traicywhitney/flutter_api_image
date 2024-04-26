
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http ;
import 'package:flutter_image_api/model_together.dart';

class ApiService {
  /*static Future<DiscoveryModel> fetchModels() async {
    final response = await http.get(
        Uri.parse('https://api-stg.together.buzz/mocks/discovery?_page=1&_pagelimit=10'
        ));
    print('---->Reading from url');

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      print('${response.body}');
      return DiscoveryModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load lessons');
    }
  }*/ static Future<DiscoveryModel> fetchModels() async {
    print('Reading from asset');
    final String response =
    await rootBundle.loadString('assets/sample_discovery.json');

    if (response != null) {
      Map<String, dynamic> jsonResponse = jsonDecode(response);
      print('${jsonResponse}');

      return DiscoveryModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load lessons');
    }
  }

}
