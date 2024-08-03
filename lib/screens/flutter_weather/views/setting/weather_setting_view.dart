import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_magenta/screens/flutter_weather/blocs/weather_bloc.dart';
import 'package:flutter_magenta/screens/flutter_weather/models/weather.dart';

class WeatherSettingView extends StatelessWidget {
  const WeatherSettingView._();

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (_) => const WeatherSettingView._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Settings')),
        body: ListView(
          children: [
            BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  return ListTile(
                    title: const Text('Temperature Units'),
                    isThreeLine: true,
                    subtitle: const Text(
                      'Use metric measurements for temperature units.',
                    ),
                    trailing: Switch(
                      value: state.weather.temperature.units.isCelsius,
                      onChanged: (_) =>
                          context.read<WeatherBloc>().add(ToggleUnits(weather: state.weather)),
                    ),
                  );
                }
            )
          ],
        )
    );
  }
}
