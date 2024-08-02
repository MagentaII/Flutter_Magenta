import 'package:flutter/material.dart';

class WeatherSettingView extends StatelessWidget {
  const WeatherSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: const Text('this is setting page'),
    );
  }
}
