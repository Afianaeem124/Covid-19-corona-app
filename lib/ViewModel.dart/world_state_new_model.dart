import 'dart:convert';

import 'package:covid_tracker/Model/world_statemodel.dart';
import 'package:covid_tracker/ViewModel.dart/utilities.dart/appurl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class WorldStateViewModel {
  Future<WorldStatesModel> fetchWorldStats() async {
    final response = await get(Uri.parse(AppUrl.WorldStatesApi));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      return WorldStatesModel.fromJson(body);
    } else {
      throw Exception('error');
    }
  }

  Future<List<dynamic>> fetchcountrieslist() async {
    var data;
    final response = await get(Uri.parse(AppUrl.CountriesList));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('error');
    }
  }
}
