import 'package:flutter/material.dart';
import 'package:flutter_magenta/screens/flutter_weather/views/weather_search_view.dart';
import 'package:flutter_magenta/screens/github_search/views/github_search_view.dart';
import 'package:flutter_magenta/screens/home/widgets/home_list_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 24, left: 16),
          child: Row(
            children: [
              Icon(Icons.ac_unit),
              SizedBox(
                width: 8,
              ),
              Text('Evan Lin'),
            ],
          ),
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              children: [
                const SizedBox(height: 8),
                HomeListItem(
                  text: 'GitHub Search',
                  icon: const Icon(Icons.image),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const GithubSearchView(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 8),
                HomeListItem(
                  text: 'Weather Search',
                  icon: const Icon(Icons.image),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const WeatherSearchView(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.search, semanticLabel: 'Search'),
        onPressed: () {},
      ),
    );
  }
}
