import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                    shadowColor: const Color.fromARGB(255, 84, 84, 84),
                    color: getWeatherColor(
                        BlocProvider.of<GetWeatherCubit>(context)
                            .weatherModel
                            ?.condition),
                    foregroundColor: Colors.black),
                primarySwatch: getWeatherColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.condition),
              ),
              home: const HomeView(),
            );
          },
        ),
      ),
    ),
  );
}

MaterialColor getWeatherColor(String? weatherCondition) {
  if (weatherCondition == null) {
    return Colors.teal;
  } else if (weatherCondition.contains('Snow') ||
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
    return Colors.blueGrey; // Cold and snowy
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
    return Colors.blue; // Rainy
  } else if (weatherCondition.contains('Thunderstorm') ||
      weatherCondition == 'Funnel Cloud/Tornado') {
    return Colors.deepPurple; // Stormy
  } else if (weatherCondition == 'Clear') {
    return Colors.orange; // Sunny
  } else if (weatherCondition == 'Partially cloudy' ||
      weatherCondition == 'Overcast' ||
      weatherCondition == 'Smoke Or Haze' ||
      weatherCondition == 'Squalls' ||
      weatherCondition == 'Dust storm' ||
      weatherCondition == 'Mist' ||
      weatherCondition == 'Precipitation In Vicinity' ||
      weatherCondition == 'Diamond Dust') {
    return Colors.grey; // Cloudy
  } else {
    return Colors.teal; // Default color
  }
}
