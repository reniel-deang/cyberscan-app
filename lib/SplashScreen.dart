import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:virus_total_api/main.dart';
import 'config/connect-api.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  Future<void> getData() async {

    try
        {
          final response = await http.post(
            Uri.parse(apiUrl),
            headers: headers,
          );
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homepage()));
        }
        catch(e)
    {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Connecting error'),
            content: Text('Please check your internet and try again. '),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  SystemNavigator.pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
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
              Text('CyberScan API', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
              SizedBox(height: 30,),

            ],
          ),
        ),
      ),
    );
  }
}