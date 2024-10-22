import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_application/global_variable.dart';
import 'package:mobile_application/models/activity.dart';

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

 // pagination request
static Future<List<ActivityModel>> getActivityList(int page, int pageSize,
      {String searchQuery = ''}) async {
    final queryParams = {
      'page': '$page',
      'limit': '$pageSize',
      'search': searchQuery, // Adding the search query to the URL
    };

    final link =
        Uri.parse('$uri/api/activity').replace(queryParameters: queryParams);
    final response = await http.get(link);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);

      // Extract the activities list from the response
      final List<dynamic> data = responseBody['activities'];
      List<ActivityModel> activities =
          data.map((activity) => ActivityModel.fromJson(activity)).toList();

      return activities;
    } else {
      throw Exception('Failed to load activities');
    }
  }

}
