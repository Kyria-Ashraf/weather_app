import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio = Dio();
  final String baseUrl =
      "https://weather.visualcrossing.com/VisualCrossingWebServices";
  final String apiKey = '9AY477ETK4HUN5KF6HK8B2M53';

  WeatherService(Dio dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    Response response = await dio.get(
        "$baseUrl/rest/services/timeline/$cityName?unitGroup=metric&key=$apiKey&contentType=json");

    try {
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      log("works");
      return weatherModel;
    } on DioException catch (e) {
      log(e.message!);
      String error = e.message ?? "Oops! there was an error, try later";
      throw Exception(error);
    } catch (e) {
      log(e.toString());
      throw Exception('There was an error, try later');
    }
  }
}
