import 'package:bicsom/widgets/news_card.dart';
import 'package:flutter/material.dart';

import 'UI/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bicsom',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

