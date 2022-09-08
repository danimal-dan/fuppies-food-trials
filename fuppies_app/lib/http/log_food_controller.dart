import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fuppies_app/model/food_log_entry.dart';
import 'base_http_controller.dart';

class LogFoodController {
  LogFoodController._privateConstructor();

  static final LogFoodController _instance =
      LogFoodController._privateConstructor();
  static final BaseHttpController _http = BaseHttpController();

  factory LogFoodController() {
    return _instance;
  }

  Future<FoodLogEntry> create(FoodLogEntry entry) async {
    var client = _http.initClient();
    try {
      var response = await client.post(_http.uriOf('event/food-log'),
          body: jsonEncode(entry.toJson()));

      if (response.statusCode != HttpStatus.ok) {
        debugPrint(
            "create food log entry failed ${response.statusCode} - ${response.body}");
        throw ErrorDescription("shart");
      }

      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes));

      return FoodLogEntry.fromJson(decodedResponse);
    } finally {
      client.close();
    }
  }
}
