import 'dart:convert';
import 'dart:io';

import 'package:html/dom.dart';
import 'package:html/dom_parsing.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  Future callApiService(String partUrl) async {
    var baseUrl = 'https://maharishiji.net/';
    String username = "mahagroup1008@gmail.com";
    String password = "123456";
    String basicAuth ='Basic ' + base64.encode(utf8.encode('$username:$password'));
    //Expectation is that each module will send send part of request
    print(baseUrl + partUrl);
    var url = Uri.parse(baseUrl + partUrl);
    var response = await http.get(url, headers: <String, String>{'authorization': basicAuth});
    //  print('Response status: ${response.statusCode}');
    if (response.statusCode == 200) {
      // print('Response body: ${response.body}');
      return  response;
    }
    return null;
  }
}
