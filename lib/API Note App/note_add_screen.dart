import 'package:api/custom_widget/app_text.dart';
import 'package:flutter/material.dart';

class NoteAddScreen extends StatefulWidget {
  const NoteAddScreen({super.key});

  @override
  State<NoteAddScreen> createState() => _NoteAddScreenState();
}

class _NoteAddScreenState extends State<NoteAddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(text: "Add Note",tWeight: FontWeight.bold,tSize: 18,),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.check,size: 30,)),
          SizedBox(width: 10,),
        ]
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          TextField(
            maxLines: 1,
            decoration: InputDecoration(
              // prefixIcon: Icon(Icons.title),
              hintText: "Title",
              hintStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey
              ),
              border: InputBorder.none,
            ),
          ),
          SizedBox(height: 20,),
          TextField(
            maxLines: 10,
            decoration: InputDecoration(
              hintText: "Descripton",
              hintStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey
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
        child: AppText(text: "Save",colors: Colors.white,tWeight: FontWeight.bold,)

      ),
    );
  }
}
