import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class RegistationService {
  Future registationApi({
    required String name,
    required String email,
    required String pass,
    required String confirmPass,
  }) async {
    try{
      Uri uri = Uri.parse("https://b5.dokanibahe.com/api/v1/register");
      Map data = {
        "name": name,
        "email": email,
        "password": pass,
        "password_confirmation": confirmPass,
      };
      var res = await http.post(
        uri,
        body: jsonEncode(data),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        log("=========${res.statusCode}========");
        return true;
      } else {
        log("=========${res.statusCode}========");
        return false;
      }
    }
    catch(error){
      log("$error");
      return false;
    }
  }
}
