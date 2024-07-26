import 'package:flutter/material.dart';

class WeatherSearchView extends StatefulWidget {
  const WeatherSearchView({super.key});

  @override
  State<WeatherSearchView> createState() => _WeatherSearchViewState();
}

class _WeatherSearchViewState extends State<WeatherSearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Search'),
      ),
    );
  }
}
