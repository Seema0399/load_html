import 'package:flutter/material.dart';
import 'package:load_html_view/screens/loadview_html_screen/loadview_html_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: LoadviewHtml(),
      debugShowCheckedModeBanner: false,
    );
  }
}

