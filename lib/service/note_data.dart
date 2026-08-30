import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class NoteData {
  Future getNoteData() async {
    Uri url = Uri.parse("https://b5.dokanibahe.com/api/v1/notes");
    var res = await http.get(url);

    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      List<Map<String, dynamic>> note = List<Map<String, dynamic>>.from(
        jsonData['data'],
      );
      return note;
    } else {
      return [];
    }
  }

  Future getDetailsData() async {
    Uri url = Uri.parse("https://b5.dokanibahe.com/api/v1/notes");
    var res = await http.get(url);
    // log("=====${res.statusCode}===");
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      // log("======${data}====");
      log("Title: ${data['data']}");
    } else if (res.statusCode == 404) {
      log("Data Not Found");
    } else {
      log("Not Found");
    }
  }

  Future<bool> getCreateData({
    required String title,
    required String details,
  }) async {
    Uri url = Uri.parse("https://b5.dokanibahe.com/api/v1/notes");
    var add = {"title": title, "details": details};
    var res = await http.post(
      url,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },

      body: jsonEncode(add),
    );

    if (res.statusCode == 201) {
      log("Note Add Sucessfully");
      return true;
    } else {
      return false;
    }
  }

  // var body = {"title": "Hello", "details": "Developer"};
  Future<bool> getUpdateData({required String title, required String details,required dynamic id}) async {
    Uri url = Uri.parse("https://b5.dokanibahe.com/api/v1/notes/$id");
    var body = {
      "title" : title,
      "details":details,
    };
    var res = await http.patch(
      url,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      body: jsonEncode(body),
    );
    if (res.statusCode == 200) {
      log("===${res.statusCode}===");
      return true;


    }else{

      return false;
    }
  }

  Future<bool> getDeleteData(int id) async {
    Uri url = Uri.parse("https://b5.dokanibahe.com/api/v1/notes/$id");
    var res = await http.delete(url);
    if (res.statusCode == 200 || res.statusCode == 204) {
      return true;
    } else if (res.statusCode == 404) {
      return false;
    } else {
      return false;
      log("Delete Failed ${res.statusCode}");
    }
  }
}
