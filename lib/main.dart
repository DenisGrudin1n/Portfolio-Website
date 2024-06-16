import 'package:flutter/material.dart';
import 'package:portfolioapp/controllers/navtitles_controller.dart';
import 'package:portfolioapp/views/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NavTitlesProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Portfolio',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
