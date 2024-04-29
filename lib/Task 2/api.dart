import 'dart:convert';

import 'package:flutter_task/Task%202/api_model.dart';
import 'package:http/http.dart' as http;

//Task 2
class Api {
  static Future<void> fetchMapData() async {
    const String url =
        "https://firebasestorage.googleapis.com/v0/b/jill-soap-6a1ac.appspot.com/o/maps.json?alt=media&token=bfd28b0f-06d7-4d25-8d45-e218466c7449";

    final response = await HttpHelper.getData(url);

    if (response == null) {
      return;
    }

    final Map<String, dynamic> data = json.decode(response);

    if (data["routes"] != null) {
      final List<dynamic> routes = data["routes"];

      if (routes.isNotEmpty) {
        final Map<String, dynamic> firstRoute = routes[0];

        final Map<String, LatLng> bounds = {};
        if (firstRoute["legs"] != null) {
          firstRoute["bounds"].forEach((key, value) {
            bounds[key] = LatLng.fromJson(value);
          });
        }

        final List<Legs> legs =
            firstRoute["legs"] != null ? List<Legs>.from(firstRoute["legs"].map((e) => Legs.fromJson(e))) : [];

        print(bounds);
        print(legs);
      }
    }
  }
}

class HttpHelper {
  static Future<dynamic> getData(endpoint) async {
    final response = await http.get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load');
    }
  }
}
