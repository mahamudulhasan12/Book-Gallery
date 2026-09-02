import 'package:api/custom_widget/app_text.dart';
import 'package:api/service/note_data.dart';
import 'package:flutter/material.dart';

class NoteUpdateScreeen extends StatefulWidget {
  const NoteUpdateScreeen({super.key, required this.titleData, required this.detailsData, required this.id});
  final String titleData;
  final String detailsData;
  final int id;
  @override
  State<NoteUpdateScreeen> createState() => _NoteUpdateScreeenState();
}

class _NoteUpdateScreeenState extends State<NoteUpdateScreeen> {
  late TextEditingController titleController;
  late TextEditingController detailsController ;
  Future<void> updateData()async{
    final sucess =await NoteData().getUpdateData(title: titleController.text, details: detailsController.text, id: widget.id);
    if (sucess) {
      Navigator.pop(context,true);
    }
  }

  @override
  void initState() {
    titleController = TextEditingController(
      text: widget.titleData,
    );
    detailsController = TextEditingController(
      text: widget.detailsData
    );

    super.initState();
  }
  void dispose(){
    super.dispose();
    titleController.dispose();
    detailsController.dispose();
  }
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
              hintText: "description",
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
          updateData();
          // Navigator.pop(context);
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
