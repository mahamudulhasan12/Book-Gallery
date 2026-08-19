import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class AppData {
  Future getData()async{
    var url = Uri.parse("https://fakeapi.extendsclass.com/books");
    var res = await http.get(url);
    if(res.statusCode == 200){
      return jsonDecode(res.body);
    }else{
      log("Sorry ! Plase server is can't unavle");
    }
  }
  
}