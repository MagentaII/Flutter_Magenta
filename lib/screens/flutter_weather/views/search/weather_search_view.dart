import 'package:flutter/material.dart';

class WeatherSearchView extends StatefulWidget {
  const WeatherSearchView._();

  static Route<String> route() {
    return MaterialPageRoute(
      builder: (_) => const WeatherSearchView._(),
    );
  }

  @override
  State<WeatherSearchView> createState() => _WeatherSearchViewState();
}

class _WeatherSearchViewState extends State<WeatherSearchView> {
  final TextEditingController _textController = TextEditingController();

  String get _text => _textController.text;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('City Search')),
      body: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  labelText: 'City',
                  hintText: 'Chicago',
                ),
              ),
            ),
          ),
          IconButton(
            key: const Key('searchPage_search_iconButton'),
            icon: const Icon(Icons.search, semanticLabel: 'Submit'),
            onPressed: () => Navigator.of(context).pop(_text),
          )
        ],
      ),
    );
  }
}
