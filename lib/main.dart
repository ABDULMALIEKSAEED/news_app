
import 'package:flutter/material.dart';
import 'package:news_app/view/bottomnavigationbar.dart';
import 'package:news_app/view/homepage.dart';

void main() async {
  runApp(const Test());
}

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}
class _TestState extends State<Test> {
  
  @override
  Widget build(BuildContext context) {
    
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
     home: BottomNavigationBarExampleApp(),
    );
  }
}