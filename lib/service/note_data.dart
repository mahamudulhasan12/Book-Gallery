import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class NoteData {
  getNoteData() async {
    Uri url = Uri.parse("https://b5.dokanibahe.com/api/v1/notes");
    var res = await http.get(url);
    // log("=====${res.statusCode}===");
    if(res.statusCode == 200){
      log("${jsonDecode(res.body)[0]['title']}");
    }else if(res.statusCode == 404){
      log("Data Not Found");
    }else{
      log("Not Found");
    }
  }
}