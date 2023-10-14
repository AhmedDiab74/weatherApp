import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubits/weather_cubit/weather_cubit.dart';

// ignore: must_be_immutable
class SearchPageComponent extends StatelessWidget {
  SearchPageComponent({super.key, this.updateUi});
  VoidCallback? updateUi;
  String? country;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          onSubmitted: (data) async {
            country = data;
            BlocProvider.of<WeatherCubit>(context)
                .getWeather(cityName: country!);
            BlocProvider.of<WeatherCubit>(context).cityName = country;
            Navigator.pop(context);
          },
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
              label: const Text("City Name"),
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.language)),
              hintText: "City Name"),
        ),
      ),
    );
  }
}
