
import 'dart:convert';

import 'package:flutter_covid19_trackingapp/Model/WorldStatesModel.dart';
import 'package:flutter_covid19_trackingapp/Services/Utilities/app_urls.dart';
import 'package:http/http.dart' as http;

//for data fetch from apis

class StatesServices{

  Future<WorldStatesModel> fetchWorldStatesRecords() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));

    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      return WorldStatesModel.fromJson(data);
    } else{
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> countriesListApi() async {
    var data;
    final response = await http.get(Uri.parse(AppUrl.countriesList));

    if(response.statusCode == 200){
       data = jsonDecode(response.body);
      return data;
    } else{
      throw Exception('Error');
    }
  }


}