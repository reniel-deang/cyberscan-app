import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: scanner_homepage(),
  ));
}

class scanner_homepage extends StatefulWidget {
  const scanner_homepage({super.key});

  @override
  State<scanner_homepage> createState() => _scanner_homepageState();
}

class _scanner_homepageState extends State<scanner_homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
