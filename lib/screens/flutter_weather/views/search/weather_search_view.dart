import 'dart:developer';
import 'package:flutter/material.dart';
import '../../../../animation/animation.dart';

class WeatherSearchView extends StatelessWidget {
  const WeatherSearchView._();

  static Route<String> route() {
    return createPageRoute<String>(const WeatherSearchView._());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('City Search')),
      body: const Column(
        children: [
          WeatherSearchBar(),
        ],
      ),
    );
  }
}

class WeatherSearchBar extends StatefulWidget {
  const WeatherSearchBar({super.key});

  @override
  State<WeatherSearchBar> createState() => _WeatherSearchBarState();
}

class _WeatherSearchBarState extends State<WeatherSearchBar> {
  final FocusNode _focusNode = FocusNode();
  bool _isEditing = false;
  final _textController = TextEditingController();

  String get _text => _textController.text;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isEditing = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              focusNode: _focusNode,
              textInputAction: TextInputAction.search,
              onSubmitted: (_) {
                Navigator.of(context).pop(_text);
              },
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  // Adjust the radius here
                  borderSide: BorderSide.none, // Remove the border side
                ),
                filled: true,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 16.0),
              ),
            ),
          ),
          if (_isEditing) const SizedBox(width: 8.0),
          if (_isEditing)
            TextButton(
              onPressed: () {
                // Handle the cancel action here
                log('Cancel clicked');
                // Clear the TextField and remove focus
                _focusNode.unfocus();
                _textController.clear();
              },
              child: const Text('Cancel', style: TextStyle(fontSize: 20)),
            ),
        ],
      ),
    );
  }
}
