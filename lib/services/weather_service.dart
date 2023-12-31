import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/models/weather_model.dart';
class WeatherService{
  Future<WeatherModel> getWeather({required String cityName}) async {
    String baseUrl = 'http://api.weatherapi.com/v1';
    String apiKey='5d9e87d6004a4fa795f170840230108';
    Uri url = Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
   http.Response response = await http.get(url);
   Map<String,dynamic> data = jsonDecode(response.body);
    WeatherModel weatherModel= WeatherModel.fromJson(data);
    return weatherModel;
  }
}