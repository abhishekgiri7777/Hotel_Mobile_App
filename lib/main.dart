import 'package:flutter/material.dart';
import 'views/homepage.dart';

void main() {
  runApp(ApiIntegration());
}

class ApiIntegration extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _ApiIntegrationState createState() => _ApiIntegrationState();
}

class _ApiIntegrationState extends State<ApiIntegration> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
