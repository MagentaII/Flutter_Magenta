import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_magenta/screens/flutter_weather/blocs/weather_bloc/weather_bloc.dart';
import 'package:flutter_magenta/screens/flutter_weather/views/search/weather_search_view.dart';
import 'package:flutter_magenta/screens/flutter_weather/views/setting/weather_setting_view.dart';

import '../../widgets/widgets.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              log(
                'Navigation from WeatherPage to SettingsPage at ${DateTime.now()}',
              );
              Navigator.of(context).push(
                WeatherSettingView.route(),
              );
            },
          )
        ],
      ),
      body: Center(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            return switch (state) {
              WeatherStateInitial() => const WeatherEmpty(),
              WeatherStateLoading() => const WeatherLoading(),
              WeatherStateFailure() => const WeatherError(),
              WeatherStateSuccess() => WeatherPopulated(
                  weather: state.weather,
                  units: state.weather.temperature.units,
                  onRefresh: () async {
                    context
                        .read<WeatherBloc>()
                        .add(RefreshWeather(weather: state.weather));
                  },
                ),
            };
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.search, semanticLabel: 'Search'),
        onPressed: () async {
          final city =
              await Navigator.of(context).push(WeatherSearchView.route());
          if (!context.mounted) return;
          log('city : $city');
          context.read<WeatherBloc>().add(LocationChanged(query: city));
        },
      ),
    );
  }
}
