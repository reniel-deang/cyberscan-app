import 'dart:math';

import 'package:flutter/material.dart';
import 'package:text_link/text_link.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:virus_total_api/config/connect-api.dart';
import 'NoResult.dart';


class Result extends StatefulWidget {
  const Result({super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(22, 22, 37, 1),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color.fromRGBO(22, 22, 37, 1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text('VIRUS CHECKER', style: TextStyle(fontSize: 20,color: Color.fromRGBO(134, 170, 249, 1))),

          ],
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(47,61,92,1)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('✔️ No security vendors flagged this URL as malicious',style: TextStyle(color: Colors.greenAccent),),
                                  TextButton(onPressed: (){}, child: Text('↻ Reanalyze',style: TextStyle(color: Colors.white)))
                                ],
                              ),
                            ),
                          ),
                        ),

                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(35,44,66,1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Container(
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('https://www.onlinegdb.com/',style: TextStyle(color: Colors.white),),
                                          Text('www.onlinegdb.com',style: TextStyle(color: Colors.white),),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),




                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 1, // Width
                                        height: 30, // Height
                                        color: Colors.grey, // Color
                                      ),
                                      SizedBox(width: 15),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Status', style: TextStyle(color: Colors.white)),
                                          Text('200', style: TextStyle(color: Colors.white),),
                                        ],
                                      ),
                                      SizedBox(width: 15),
                                      Container(
                                        width: 1,
                                        height: 30,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(width: 15),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Last Analysis Date', style: TextStyle(color: Colors.white),),
                                          Text('data3', style: TextStyle(color: Colors.white),),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),


                            ],
                          ),
                        ),


                        const SizedBox(height: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('DETECTION',style: TextStyle(fontSize: 17,color: Color.fromRGBO(134, 170, 249, 1)),),
                            const Divider(thickness: 1, color: Color.fromRGBO(134, 170, 249, 1)),
                            const SizedBox(height: 10,),
                            const Text("Security vendors' analysis 🛈",style: TextStyle(color: Colors.white),),
                            const SizedBox(height: 10,),
                            const Divider(thickness: 1, color: Colors.white12),
                            const SizedBox(height: 10,),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}