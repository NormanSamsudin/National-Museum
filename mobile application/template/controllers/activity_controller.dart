import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:booking_app/models/Activity.dart';
import 'package:http/http.dart' as http;
import 'package:booking_app/global_variable.dart';

class ActivityController {

  Future<List<ActivityModel>> loadActivitys() async {
    try {
      http.Response response = await http
          .get(Uri.parse("$uri/api/Activity"), headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      });

      debugPrint(response.body);
      
      
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        List<ActivityModel> Activitys =
            data.map((Activity) => ActivityModel.fromJson(Activity)).toList();
        return Activitys;
      } else {
        throw Exception('Failed to load Activity');
      }
    } catch (e) {
      throw Exception('Error load Activity');
    }
  }
}
