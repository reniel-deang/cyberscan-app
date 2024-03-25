import 'dart:convert';
import 'package:http/http.dart' as http;

String? id;
String? type;
String? status;
int? code;

final Map<String, dynamic> result = {};

final String apiKey = 'e6fdf2866cbf74913cfcf254d9071340fc65ab97419004f11c6998fb53ceaf5a';
final String apiUrl = 'https://www.virustotal.com/api/v3/urls';

final Map<String, String> headers = {
  'x-apikey': apiKey,
};

Future<void> scanUrl(String url) async {
  final Map<String, dynamic> body = {
    'url': url,
  };

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: headers,
    body: body,
  );

  if (response.statusCode == 200) {
    //api link response = "responseData['data']['links']['self']"
    final responseData = jsonDecode(response.body);

    String analysisLink = responseData['data']['links']['self'].toString();

    final analysisReport = await http.get(
      Uri.parse(analysisLink),
      headers: headers,);

    //Debugging print only
    print(analysisReport.body);

  } else {
    print('Error: ${response.body}');
    code = 404;
  }
}