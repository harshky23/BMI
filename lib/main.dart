import 'package:flutter/material.dart';
import 'pages/input_file.dart';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.black,
          scaffoldBackgroundColor: Colors.black
      ),
      initialRoute: '/',
      routes: {
        '/' : (context)=>InputPage(),
      },
    );
  }
}

