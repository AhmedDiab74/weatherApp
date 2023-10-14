// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/weather_cubit/weather_cubit.dart';
import 'package:weatherapp/cubits/weather_cubit/weather_state.dart';
import 'package:weatherapp/models/weather_model.dart';

class HomePageComponent extends StatelessWidget {
  const HomePageComponent({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
      if (state is WeatherLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is WeatherSuccess) {
       
        return SuccessStateWidget(model: state.weatherModel);
      } else if (state is WeatherFailure) {
        return const Center(
          child: Text("Some Thing Went  Wrong"),
        );
      } else {
        return const Center(
          child: Text(
            "Search For Your Country",
            style: TextStyle(fontSize: 25),
          ),
        );
      }
    });
  }
}

class SuccessStateWidget extends StatelessWidget {
  const SuccessStateWidget({
    super.key,
    required this.model,
  });

  final WeatherModel? model;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 3,
          ),
           Text(
            BlocProvider.of<WeatherCubit>(context).cityName!,
            style: const TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Ubdated: ${model!.date.substring(10)}",
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.sunny,
                color: Colors.yellow,
                size: 75,
              ),
              Text(
                model!.temp.toInt().toString(),
                style: const TextStyle(fontSize: 30),
              ),
              Column(
                children: [
                  Text("maxTemp: ${model!.maxTemp.toInt()}"),
                  Text("minTemp: ${model!.minTemp.toInt()}")
                ],
              )
            ],
          ),
          const Spacer(),
          Text(
            model!.weatherStateName,
            style: const TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(
            flex: 5,
          )
        ],
      ),
    );
  }
}
