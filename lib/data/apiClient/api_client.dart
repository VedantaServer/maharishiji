import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  Future callApiService(String partUrl) async {
    var baseUrl =  GetStorage().read('serverUrl'); //   'https://maharishiji.net/';
    String username =  "mlodhi630@gmail.com"; // GetStorage().read('LoggedInUser') ;// "mahagroup1008@gmail.com";
    String password = "1234567"; // GetStorage().read('LoggedInPassword') ;// // "123456";

    // device.write('LoggedInUser', _loggedInUser);
    // device.write('LoggedInPassword', password);
    String basicAuth ='Basic ' + base64.encode(utf8.encode('$username:$password'));
    //Expectation is that each module will send send part of request
     //print(baseUrl + partUrl);
    var url = Uri.parse(baseUrl + partUrl);
    var response = await http.get(url, headers: <String, String>{'authorization': basicAuth});
    //print('Response status: ${response.statusCode}');
    if (response.statusCode == 200) {
       //print('Response body: ${response.body}');
      return  response;
    }
    return null;
  }
}
