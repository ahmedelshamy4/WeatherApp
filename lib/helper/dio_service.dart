import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/model/weather.dart';

class DioState extends ChangeNotifier {
  String cityname = 'cairo';
  static String apikey = 'fc2d381b42db820032dad787c1e8e95a';
  final TextEditingController searchBar = TextEditingController();

  Future<WeatherModel> getData() async {
    Response response;
    var dio = Dio();
    response = await dio.get(
      'https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$apikey',
    );

    if (response.statusCode == 200) {
      WeatherModel weatherResult = WeatherModel.fromJson(response.data);
      return weatherResult;
    } else {
      throw Exception('problem with status code : ${response.statusCode}');
    }
  }

  searchCity(String cityName) {
    cityname = cityName;
    getData();
    notifyListeners();
  }
}
