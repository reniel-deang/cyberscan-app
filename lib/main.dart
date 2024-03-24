import 'package:flutter/material.dart';
import 'package:text_link/text_link.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:virus_total_api/config/connect-api.dart';
import 'NoResult.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Homepage(),
  ));
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController searchController = TextEditingController();

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
            const Text('VIRUS CHECKER', style: TextStyle(fontSize: 20,color: Color.fromRGBO(134, 170, 249, 1))),
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings, size: 20,color: Colors.white)),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: Container(

            margin: const EdgeInsets.only(top: 0,right: 0,left: 0,bottom: 5),
            padding: const EdgeInsets.all(20),
            width: double.maxFinite,

            child: Column(
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Container(
                    child: Column(
                      children: [
                        const Text(textAlign: TextAlign.center,'Analyze suspicious URLs to detect malware and other breaches.', style: TextStyle(fontSize: 17,color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: Column(
                    children: [
                      const Text('URL',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Color.fromRGBO(134, 170, 249, 1)),),
                      const Divider(thickness: 1, color: Color.fromRGBO(134, 170, 249, 1)),
                      const SizedBox(height: 10,),

                      Center(
                        child: Text('🌐',style: TextStyle(fontSize: 100,color: Colors.white),),
                      ),



                      const SizedBox(height: 20),

                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:   Color.fromRGBO(134, 170, 249, 1),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextField(
                          controller: searchController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Search or scan a URL',
                            labelStyle: TextStyle(color: Colors.white),
                            floatingLabelBehavior: FloatingLabelBehavior.never, // Automatically move the label text
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.search,color: Colors.white,),
                            ),
                            filled: true,
                            fillColor: Colors.transparent,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:  BorderSide(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                      ),


                      const SizedBox(height: 27),



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
                            color: Colors.transparent  ,
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  scanUrl(searchController.text);
                                });
                              },
                              child: Text(
                                'Search',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),


                      const SizedBox(height: 60),



                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'By submitting data above, you are agreeing to our ',
                            style: const TextStyle(fontSize: 14, color: Colors.white),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Terms of Service ',
                                style: const TextStyle(color: Color.fromRGBO(134, 170, 249, 1), decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    _launchURL('https://docs.virustotal.com/docs/terms-of-service');
                                  },
                              ),
                              const TextSpan(
                                text: ' and ',
                                style: TextStyle(fontSize: 14, color: Colors.white),
                              ),
                              TextSpan(
                                text: 'Privacy Notice ',
                                style: const TextStyle(color: Color.fromRGBO(134, 170, 249, 1), decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    _launchURL('https://docs.virustotal.com/docs/privacy-policy');
                                  },
                              ),
                              const TextSpan(
                                text: ', and to the sharing of your URL submission with the security community. Please do not submit any personal information; VirusChecker is not responsible for the contents of your submission. ',
                                style: TextStyle(fontSize: 14, color: Colors.white),
                              ),
                              TextSpan(
                                text: 'Learn more.',
                                style: const TextStyle(color: Color.fromRGBO(134, 170, 249, 1), decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    _launchURL('https://docs.virustotal.com/docs/how-it-works');
                                  },
                              ),





                            ],
                          ),

                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 100,)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
