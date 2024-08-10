import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_magenta/screens/flutter_weather/views/weather/weather_view.dart';
import 'package:flutter_magenta/screens/github_search/views/github_search_view.dart';
import 'package:flutter_magenta/screens/home/widgets/home_list_item.dart';

import '../../../animation/animation.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [
        SizedBox(height: 64.0),
        HomeSearchBar(),
        Expanded(child: HomeBody()),
      ],
    ));
  }
}

class HomeSearchBar extends StatefulWidget {
  const HomeSearchBar({super.key});

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  final FocusNode _focusNode = FocusNode();
  bool _isEditing = false;

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
              focusNode: _focusNode,
              textInputAction: TextInputAction.search,
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
              },
              child: const Text('Cancel', style: TextStyle(fontSize: 20)),
            ),
        ],
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    // 定義你的項目列表
    final items = [
      {
        'text': 'GitHub Search',
        'image': Image.asset(
          'assets/github_search_icon_1.png',
          fit: BoxFit.cover, // 讓圖片填充整個卡片
        ),
        'view': const GithubSearchView(),
      },
      {
        'text': 'Weather Search',
        'image': Image.asset(
          'assets/weather_search_icon_1.png',
          fit: BoxFit.cover, // 讓圖片填充整個卡片
        ),
        'view': const WeatherView(),
      },
      // 如果有新的項目，可以在這裡添加
      // {
      //   'text': 'New Feature',
      //   'icon': Icons.new_releases,
      //   'view': const NewFeatureView(),
      // },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 設定列數為 2
                crossAxisSpacing: 8.0, // 列與列之間的間距
                mainAxisSpacing: 8.0, // 行與行之間的間距
                childAspectRatio: 1.0, // 調整每個項目的寬高比
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
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
        );
      },
    );
  }
}
