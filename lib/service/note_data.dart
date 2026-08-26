import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

class NoteData {
  getNoteData() async {
    Uri url = Uri.parse("https://b5.dokanibahe.com/api/v1/notes");
    var res = await http.get(url);
    if (res.statusCode == 200) {
      // print("=======${res.body}=====");
    } else {
      print("Data Not Found");
    }
  }

  getDetailsData() async {
    Uri url = Uri.parse("https://b5.dokanibahe.com/api/v1/notes");
    var res = await http.get(url);
    if (res.statusCode == 200) {
      // print("=======${res.body}");
    } else if (res.statusCode == 402) {
      print("Data Alrady Delete");
    } else {
      print("Data Not Found");
    }
  }

  getCreateData() async {
    Uri url = Uri.parse("https://b5.dokanibahe.com/api/v1/notes");
    var res = await http.post(
      url,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        
      },
      body: jsonEncode({'title':"Developer","details":"Flutter Mobile App Developer"})
    );
    if (res.statusCode == 201) {
      print("Sucessfully");
    } else if (res.statusCode == 422) {
      print("Places input value");
    }
  }

  getDeleteData() async {
    Uri url = Uri.parse("https://b5.dokanibahe.com/api/v1/notes/");
    var res = await http.get(url);
    print("=======111====");
    if (res.statusCode == 200) {
      print("=====222===");
    } else if (res.statusCode == 404) {
      print("Data Alrady Delete or Wrong Data");
    }
  }

  getUpdateData() async {}
}
