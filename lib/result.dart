import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({Key? key}) : super(key: key);

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
            const Text('VIRUS CHECKER', style: TextStyle(fontSize: 20, color: Color.fromRGBO(134, 170, 249, 1))),
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
                                  '✔️ No security vendors flagged this URL as malicious',
                                  style: TextStyle(color: Colors.greenAccent),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              TextButton(onPressed: () {}, child: Text('↻ Reanalyze', style: TextStyle(color: Colors.white))),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(35, 44, 66, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('https://www.onlinegdb.com/', style: TextStyle(color: Colors.white)),
                                    Text('www.onlinegdb.com', style: TextStyle(color: Colors.white)),
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
                                  Text('data3', style: TextStyle(color: Colors.white)),
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
            ],
          ),
        ),
      ),
    );
  }
}
