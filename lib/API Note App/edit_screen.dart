import 'package:api/custom_widget/app_text.dart';
import 'package:flutter/material.dart';

class NoteEditScreeen extends StatefulWidget {
  const NoteEditScreeen({super.key});

  @override
  State<NoteEditScreeen> createState() => _NoteEditScreeenState();
}

class _NoteEditScreeenState extends State<NoteEditScreeen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(text: "Edit",tWeight: FontWeight.bold,tSize: 18,),
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
        onPressed: () {
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
