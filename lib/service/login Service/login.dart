import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class LoginService{

  Future loginApi({required String email , required String password})async{
    try{
      Uri uri = Uri.parse("https://b5.dokanibahe.com/api/v1/login");
      Map data = {
        "email": email,
        "password":password
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
        return true;
      }else{
        log("=========${res.statusCode}==slgsadl======");
        return false;
      }

    }catch(error){
      return false;
    }
  }
}