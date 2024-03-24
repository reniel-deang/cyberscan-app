
import 'package:flutter/material.dart';

class NoResult extends StatefulWidget {
  const NoResult({super.key});

  @override
  State<NoResult> createState() => _NoResultState();
}

class _NoResultState extends State<NoResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(22, 22, 37, 1),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color.fromRGBO(22, 22, 37, 1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.list, size: 20,color: Colors.white)),
            const Text('⌨️ VIRUS CHECKER', style: TextStyle(fontSize: 20,color: Color.fromRGBO(134, 170, 249, 1))),
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings, size: 20,color: Colors.white)),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(90.0),
                child: Column(
                  children: [
                    Image.network("https://cdn-icons-png.flaticon.com/512/1157/1157077.png",color: Colors.white,height: 150, ),
                    SizedBox(height: 20,),
                    Text(textAlign: TextAlign.center,"No matches found",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,color: Color.fromRGBO(134, 170, 249, 1)),),
                    SizedBox(height: 39,),
                    Text(textAlign: TextAlign.center,"Alternatively, do you want to locate your threat based on static, dynamic, content, attribution or other advanced IoC context? VT Intelligence allows you to search across VirusTotal's entire threat corpus using a myriad of modifiers, learn more.",style: TextStyle(color: Colors.white),),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 200,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromRGBO(134, 170, 249, 1),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Container(
                              color: Color.fromRGBO(22, 22, 37, 1),
                              child: TextButton(
                                onPressed: () {
                                },
                                child: Text(
                                  'Try a new search',
                                  style: TextStyle(color: Color.fromRGBO(134, 170, 249, 1), fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),

                  ],
                ),
              ),
            )

          ],
        ),

      ),
    );
  }
}
