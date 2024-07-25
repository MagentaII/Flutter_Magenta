import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/home/views/home_view.dart';

class MagentaAppView extends StatelessWidget {
  const MagentaAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Magenta',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
        ),
        textTheme: GoogleFonts.robotoSlabTextTheme(),
      ),
      home: const HomeView(),
    );
  }
}
