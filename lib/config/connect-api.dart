import 'dart:convert';
import 'package:http/http.dart' as http;

String? id;
String? type;
String? status;
String? link;
int? maliciouscount;

int? code;


Map<String, dynamic> analysiscontainer = {};

//PUT YOUR API KEY HERE FROM VIRUS TOTAL API
final String apiKey = '';
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

    final analysisReportData = jsonDecode(analysisReport.body);
    //id
    id = analysisReportData['data']['id'].toString();
    //malicious count
    maliciouscount = analysisReportData['data']['attributes']['stats']['malicious'];
    //status
    status = analysisReportData['data']['attributes']['status'].toString();
    //analysis
    analysiscontainer = analysisReportData['data']['attributes']['results'];
    //link
    link = analysisReportData['meta']['url_info']['url'].toString();

  } else {
    code = 404;
  }
}