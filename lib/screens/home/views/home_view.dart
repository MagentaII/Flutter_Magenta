import 'package:flutter/material.dart';

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
              SizedBox(width: 8,),
              Text('Evan Lin'),
            ],
          ),
        ),
      ),
      body: const Center(
        child: Text('This is Home Page'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.search, semanticLabel: 'Search'),
        onPressed: () {},
      ),
    );
  }
}
