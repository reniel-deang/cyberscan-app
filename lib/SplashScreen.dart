import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main()=> runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Loading(),
));

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Future<void> getData() async {


  }
  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(22, 22, 37, 1),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 70.0, // Adjust the width as needed
                height: 70.0, // Adjust the height as needed
                child: CircularProgressIndicator(
                  color: Color.fromRGBO(134, 170, 249, 1),
                  strokeWidth: 7,
                ),
              ),
              SizedBox(height: 30,),
              Text('Virus Checker API', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
              SizedBox(height: 30,),

            ],
          ),
        ),
      ),
    );
  }
}