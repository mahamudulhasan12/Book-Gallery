import 'package:api/custom_widget/app_text.dart';
import 'package:api/service/note_data.dart';
import 'package:flutter/material.dart';

class ApiCrudOperation extends StatefulWidget {
  const ApiCrudOperation({super.key});

  @override
  State<ApiCrudOperation> createState() => _ApiCrudOperationState();
}

class _ApiCrudOperationState extends State<ApiCrudOperation> {
  List data = [];
  faceData(){

  }

  @override
  void initState() {
    faceData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(text: "Note App", tWeight: FontWeight.bold, tSize: 18),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.refresh)),
          SizedBox(width: 10,)
        ],
      ),
      body: Column(
        spacing: 10,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                NoteData().getNoteData();
              },
              child: AppText(text: "Read Data"),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                NoteData().getDetailsData();
              },
              child: AppText(text: "Details Data"),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                NoteData().getCreateData();
              },

              child: AppText(text: "Create Data"),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                NoteData().getUpdateData();
              },
              child: AppText(text: "Update Data"),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                NoteData().getDeleteData(8);
              },
              child: AppText(text: "Delete Data"),
            ),
          ),
        ],
      ),
    );
  }
}
