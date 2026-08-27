import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class NoteData {
  getNoteData() async {
    Uri url = Uri.parse("https://b5.dokanibahe.com/api/v1/notes");
    var res = await http.get(url);
    // log("=====${res.statusCode}===");
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      // log("======${data}====");
      log("Title: ${data['data'][0]}");
    } else if (res.statusCode == 404) {
      log("Data Not Found");
    } else {
      log("Not Found");
    }
  }

  getDetailsData() async {
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

  var add = {"title": "Note App ", "details": "Mahamudul Hasan Testing"};
  getCreateData() async {
    Uri url = Uri.parse("https://b5.dokanibahe.com/api/v1/notes");
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
    } else if (res.statusCode == 422) {
      log("========${res.statusCode}====");
    }
  }

  getUpdateData() async {
    Uri url = Uri.parse("https://b5.dokanibahe.com/api/v1/notes/8");
    var res = await http.put(
      url,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      body: jsonEncode(add),
    );
    if (res.statusCode == 200) {
      log("===${res.body}=");
    }
  }

  getDeleteData(int id) async {
    Uri url = Uri.parse("https://b5.dokanibahe.com/api/v1/notes/$id");
    var res = await http.delete(url);
    if (res.statusCode == 200 || res.statusCode == 204) {
      log("Note Delete Sucessfully");
    } else if (res.statusCode == 404) {
      log("Data Not Found");
    } else {
      log("Delete Failed ${res.statusCode}");
    }
  }
}
