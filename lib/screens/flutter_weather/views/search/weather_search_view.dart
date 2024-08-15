import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../animation/animation.dart';
import '../../blocs/search_record_bloc/search_record_bloc.dart';

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
          Expanded(child: SearchHistory()),
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

class SearchHistory extends StatefulWidget {
  const SearchHistory({super.key});

  @override
  State<SearchHistory> createState() => _SearchHistoryState();
}

class _SearchHistoryState extends State<SearchHistory> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchRecordBloc, SearchRecordState>(
      builder: (context, state) {
        if (state is SearchRecordStateLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchRecordStateLoaded) {
          final history = state.records;

          return Column(
            children: [
              if (history.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${history.length} items',
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 20.0),
                      ),
                      TextButton(
                        onPressed: () {
                          context.read<SearchRecordBloc>().add(ClearAllSearchRecords());
                        },
                        child: const Text('Clear All',
                            style:
                                TextStyle(color: Colors.red, fontSize: 18.0)),
                      ),
                    ],
                  ),
                ),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 0.0),
                  itemCount: history.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final item = history[index];
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                      title: Text(item.city),
                      leading: const Icon(Icons.history),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.black45),
                        onPressed: () {
                          context.read<SearchRecordBloc>().add(RemoveSearchRecord(record: item));
                        },
                      ),
                      onTap: () {
                        Navigator.of(context).pop(item.city);
                        // Handle search history item click
                        log('Search history item tapped: $item');
                      },
                    );
                  },
                ),
              ),
            ],
          );
        } else if (state is SearchRecordStateError) {
          return const Center(child: Text('Error loading records'));
        }
        return const Center(child: Text('No records found'));
      },
    );
  }
}
