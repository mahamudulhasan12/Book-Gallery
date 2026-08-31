import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class RegistationService {
  Future registationApi(
    // required String name,
    // required String email,
    // required String pass,
    // required String confirmPass,
  ) async {
    Uri uri = Uri.parse("https://b5.dokanibahe.com/api/v1/register");
    Map data = {
      "name": "Rahim",
      "email": "rahim@example.com",
      "password": "password123",
      "password_confirmation": "password123",
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
      log("=========${res.statusCode}========");
    }
  }
}
