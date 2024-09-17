import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_magenta/screens/flutter_weather/views/weather/weather_view.dart';
import 'package:flutter_magenta/screens/github_search/views/github_search_view.dart';
import 'package:flutter_magenta/screens/home/widgets/home_list_item.dart';

import '../../../animation/animation.dart';
import '../../music_player/view/playlist/playlist_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String _searchQuery = '';

  void _updateSearchQuery(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(height: 72.0),
        HomeSearchBar(onSearch: _updateSearchQuery),
        Expanded(
            child: HomeBody(
          searchQuery: _searchQuery,
        )),
      ],
    ));
  }
}

class HomeSearchBar extends StatefulWidget {
  final Function(String) onSearch;

  const HomeSearchBar({super.key, required this.onSearch});

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  final FocusNode _focusNode = FocusNode();
  bool _isEditing = false;
  final _textController = TextEditingController();

  // if want to get TextField text
  // String get _text => _textController.text;

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
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              focusNode: _focusNode,
              textInputAction: TextInputAction.search,
              onChanged: widget.onSearch,
              onSubmitted: (_) {},
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
                widget.onSearch('');
                _textController.clear();
              },
              child: const Text('Cancel', style: TextStyle(fontSize: 20)),
            ),
        ],
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  final String searchQuery;

  const HomeBody({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    // 定義你的項目列表
    final items = [
      {
        'text': 'GitHub Search',
        'image': Image.asset(
          'assets/images/github_search_icon_1.png',
          fit: BoxFit.cover, // 讓圖片填充整個卡片
        ),
        'view': const GithubSearchView(),
      },
      {
        'text': 'Weather Search',
        'image': Image.asset(
          'assets/images/weather_search_icon_1.png',
          fit: BoxFit.cover, // 讓圖片填充整個卡片
        ),
        'view': const WeatherView(),
      },
      {
        'text': 'Music Player',
        'image': Image.asset(
          'assets/images/music_player_icon_1.png',
          fit: BoxFit.cover, // 讓圖片填充整個卡片
        ),
        'view': const PlaylistView(),
      },
      // 如果有新的項目，可以在這裡添加
      // {
      //   'text': 'New Feature',
      //   'icon': Icons.new_releases,
      //   'view': const NewFeatureView(),
      // },
    ];

    final filteredItems = items
        .where((item) => (item['text'] as String)
            .toLowerCase()
            .contains(searchQuery.toLowerCase()))
        .toList();

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 設定列數為 2
                  crossAxisSpacing: 8.0, // 列與列之間的間距
                  mainAxisSpacing: 16.0, // 行與行之間的間距
                  childAspectRatio: 1.0, // 調整每個項目的寬高比
                ),
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  final item = filteredItems[index];
                  return HomeListItem(
                    text: item['text'] as String,
                    image: item['image'] as Image,
                    onTap: () {
                      Navigator.of(context).push(
                        createPageRoute(item['view'] as Widget),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
