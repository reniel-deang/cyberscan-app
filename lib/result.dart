import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'config/connect-api.dart';
import 'main.dart';
import 'package:intl/intl.dart';


class Result extends StatelessWidget {
  const Result({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    String currentDate = DateFormat.yMMMMd('en_US').format(DateTime.now());
    return Scaffold(
      backgroundColor: Color.fromRGBO(22, 22, 37, 1),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color.fromRGBO(22, 22, 37, 1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: Color.fromRGBO(134, 170, 249, 1)),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homepage())); // Navigate back when back button is pressed
              },
            ),
            Spacer(), // Add a spacer to push the title to the center
            const Text('CyberScan', style: TextStyle(fontSize: 20, color: Color.fromRGBO(134, 170, 249, 1))),
            Spacer(), // Add another spacer to push the title to the center
          ],
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05), // Adjust padding
          child: Column(
            children: [
              SizedBox(height: 20), // Adjust vertical spacing
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(22, 22, 37, 1), // Adjust container color
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(47, 61, 92, 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  maliciouscount == 0
                                      ? '✔️ No security vendors flagged this URL as malicious'
                                      : '$maliciouscount / 93 security vendors flagged this domain as malicious',
                                  style: TextStyle(
                                    color: maliciouscount == 0 ? Colors.greenAccent : Colors.red,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              TextButton(onPressed: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homepage()));
                              }, child: Text('↻ Reanalyze', style: TextStyle(color: Colors.white))),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(35, 44, 66, 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("$link", style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ),
                              SizedBox(width: 15), // Adjust horizontal spacing
                              Container(width: 1, height: 30, color: Colors.grey), // Vertical line
                              SizedBox(width: 15), // Adjust horizontal spacing
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Status', style: TextStyle(color: Colors.white)),
                                  Text('200', style: TextStyle(color: Colors.white)),
                                ],
                              ),
                              SizedBox(width: 15), // Adjust horizontal spacing
                              Container(width: 1, height: 30, color: Colors.grey), // Vertical line
                              SizedBox(width: 15), // Adjust horizontal spacing
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Last Analysis Date', style: TextStyle(color: Colors.white)),
                                  Text(currentDate, style: TextStyle(color: Colors.white, fontSize: 10)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20), // Adjust vertical spacing
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('DETECTION', style: TextStyle(fontSize: 17, color: Color.fromRGBO(134, 170, 249, 1))),
                          Divider(thickness: 1, color: Color.fromRGBO(134, 170, 249, 1)),
                          SizedBox(height: 10), // Adjust vertical spacing
                          Text("Security vendors' analysis 🛈", style: TextStyle(color: Colors.white)),
                          SizedBox(height: 10), // Adjust vertical spacing
                          Divider(thickness: 1, color: Colors.white12),
                          SizedBox(height: 10), // Adjust vertical spacing
                        ],
                      ),


                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.4, // Adjust the height as needed
                child: ListView.builder(
                  itemCount: analysiscontainer.length,
                  itemBuilder: (BuildContext context, int index) {
                    String key = analysiscontainer.keys.elementAt(index);
                    Map<String, dynamic> value = analysiscontainer[key]!;
                    return ListTile(
                      title: Text(key),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Table(
                                  children: [
                                    TableRow(
                                        children: [
                                          Text('${value['engine_name']}',style: TextStyle(color: Colors.white,fontSize: 15),),
                                          Text('Category: ${value['category']}',style: TextStyle(color: Colors.white,fontSize: 15),),
                                          Text(
                                            'Result: ${value['result']}',
                                            style: TextStyle(
                                              color: value['result'] == 'clean' ? Colors.green :
                                              value['result'] == 'malicious' ? Colors.red :
                                              Colors.grey,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ]
                                    ),

                                  ],
                                ),
                                SizedBox(height: 10,),
                                Divider(thickness: 0.5,color: Colors.grey,)
                              ],
                            ),
                          )

                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
