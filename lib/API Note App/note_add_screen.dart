import 'package:api/custom_widget/app_text.dart';
import 'package:api/service/note_data.dart';
import 'package:flutter/material.dart';

class NoteAddScreen extends StatefulWidget {
  const NoteAddScreen({super.key, required this.listData});
  final List<dynamic> listData;
  @override
  State<NoteAddScreen> createState() => _NoteAddScreenState();
}

class _NoteAddScreenState extends State<NoteAddScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController detailsController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(text: "Add Note", tWeight: FontWeight.bold, tSize: 18),
        actions: [
          IconButton(
              onPressed: () async{
                setState(() {

                });
                String titleData = titleController.text;
                String description = detailsController.text;
                if(titleData.isEmpty || description.isEmpty){
                  return;
                };

                var addData =await NoteData().getCreateData(title: titleData, details: description);
                Navigator.pop(context,addData);
                if(addData != null){
                 setState(() {
                   widget.listData.add(addData);
                 });
                }
          }, icon: Icon(Icons.check, size: 30)),
          SizedBox(width: 10),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          TextField(
            controller: titleController,
            maxLines: 1,
            decoration: InputDecoration(
              // prefixIcon: Icon(Icons.title),
              hintText: "Title",
              hintStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
              border: InputBorder.none,
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: detailsController,
            maxLines: 10,
            decoration: InputDecoration(
              hintText: "Descripton",
              hintStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
              border: InputBorder.none,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () async{
          setState(() {

          });
          String titleData = titleController.text.trim();
          String description = detailsController.text.trim();
          if(titleData.isEmpty || description.isEmpty){
            return;
          };
          var result =await NoteData().getCreateData(title: titleData, details: description);
          if(result == true){
            setState(() {

            });
            NoteData().getNoteData();
          }
          Navigator.pop(context);
        },
        child: AppText(
          text: "Save",
          colors: Colors.white,
          tWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
