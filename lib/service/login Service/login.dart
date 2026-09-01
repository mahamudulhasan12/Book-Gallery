import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class LoginService{

  Future loginApi()async{
    Uri uri = Uri.parse("https://b5.dokanibahe.com/api/v1/login");
    Map data = {
      "email": "mahamudul@example.com",
      "password":"Mahamudul12345"
    };
    var res = await http.post(
      uri,
      body: jsonEncode(data),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
    );
    if(res.statusCode ==200 || res.statusCode ==201){
      log("=========${res.statusCode}========");
    }else{
      log("=========${res.statusCode}==slgsadl======");
    }
  }
}