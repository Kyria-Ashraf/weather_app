import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              getWeatherColor(weatherModel.condition),
              getWeatherColor(weatherModel.condition)[300]!,
              getWeatherColor(weatherModel.condition)[50]!
            ]),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                weatherModel.cityName ?? "No city Name",
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "updated at ${weatherModel.lastUpdated ?? "00:00"}",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const Padding(padding: EdgeInsets.all(12)),
              Row(
                children: [
                  const Padding(padding: EdgeInsets.only(left: 8)),
                  Image.asset(
                    getWeatherImage(weatherModel.condition ?? ""),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    weatherModel.temp.toString(),
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Column(
                    children: [
                      Text(
                        "Maxtemp: ${weatherModel.maxTemp.toString()}",
                        style: const TextStyle(fontSize: 12),
                      ),
                      Text(
                        "Mintemp: ${weatherModel.minTemp.toString()}",
                        style: const TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(right: 8)),
                ],
              ),
              const Padding(padding: EdgeInsets.all(12)),
              Text(
                weatherModel.condition ?? "No condition",
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String getWeatherImage(String weatherCondition) {
    if (weatherCondition.contains('Snow') ||
        weatherCondition == 'Freezing Fog' ||
        weatherCondition == 'Ice' ||
        weatherCondition == 'Heavy Freezing Rain' ||
        weatherCondition == 'Heavy Snow' ||
        weatherCondition == 'Light Snow' ||
        weatherCondition == 'Light Freezing Rain' ||
        weatherCondition == 'Freezing Drizzle/Freezing Rain' ||
        weatherCondition == 'Heavy Freezing Drizzle/Freezing Rain' ||
        weatherCondition == 'Hail Showers' ||
        weatherCondition == 'Snow And Rain Showers' ||
        weatherCondition == 'Snow Showers' ||
        weatherCondition == 'Light Freezing Drizzle/Freezing Rain') {
      return "assets/images/snow.png"; // Cold and snowy
    } else if (weatherCondition == 'Rain' ||
        weatherCondition == 'Heavy Rain' ||
        weatherCondition == 'Light Rain' ||
        weatherCondition == 'Rain Showers' ||
        weatherCondition == 'Heavy Rain And Snow' ||
        weatherCondition == 'Light Rain And Snow' ||
        weatherCondition == 'Heavy Drizzle/Rain' ||
        weatherCondition == 'Light Drizzle/Rain' ||
        weatherCondition == 'Drizzle' ||
        weatherCondition == 'Blowing Or Drifting Snow' ||
        weatherCondition == 'Heavy Drizzle') {
      return "assets/images/rainy.png"; // Rainy
    } else if (weatherCondition.contains('Thunderstorm') ||
        weatherCondition == 'Funnel Cloud/Tornado') {
      return "assets/images/thunderstorm.png"; // Stormy
    } else if (weatherCondition == 'Clear') {
      return "assets/images/clear.png"; // Sunny
    } else if (weatherCondition == 'Partially cloudy' ||
        weatherCondition == 'Overcast' ||
        weatherCondition == 'Smoke Or Haze' ||
        weatherCondition == 'Squalls' ||
        weatherCondition == 'Dust storm' ||
        weatherCondition == 'Mist' ||
        weatherCondition == 'Precipitation In Vicinity' ||
        weatherCondition == 'Diamond Dust') {
      return "assets/images/partially_cloudy.png"; // Cloudy
    } else {
      return 'assets/images/clear.png'; // Default color
    }
  }
}
