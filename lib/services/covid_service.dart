import 'package:flutter_trial_three/models/country.dart';
import 'package:flutter_trial_three/models/country_summary.dart';
import 'package:flutter_trial_three/models/global_summary.dart';
import 'package:flutter_trial_three/screen/data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class CovidService{
//
  Future<GlobalSummaryModel> getGlobalSummary() async{
    final data = await http.Client().get("https://api.covid19api.com/summary");

    if(data.statusCode != 200)
      throw Exception();

    GlobalSummaryModel summary = new GlobalSummaryModel.fromJson(json.decode(data.body));

    return summary;
  }

  Future<List<CountrySummaryModel>> getCountrySummary(String slug) async{
    final data = await http.Client().get("https://api.covid19api.com/total/dayone/country/" + slug);

    if(data.statusCode != 200)
      throw Exception();

    List<CountrySummaryModel> summaryList = (json.decode(data.body) as List).map((item) => new CountrySummaryModel.fromJson(item)).toList();

    return summaryList;
  }

  Future<List<CountryModel>> getCountryList() async{
    final data = await http.Client().get("https://api.covid19api.com/countries");

    if(data.statusCode != 200)
      throw Exception();

    List<CountryModel> countries = (json.decode(data.body) as List).map((item) => new CountryModel.fromJson(item)).toList();

    return countries;
  }

}