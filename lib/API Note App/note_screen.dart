import 'dart:developer';

import 'package:api/API%20Note%20App/details_screen.dart';
import 'package:api/API%20Note%20App/note_add_screen.dart';
import 'package:api/API%20Note%20App/search/search_screen.dart';
import 'package:api/custom_widget/app_text.dart';
import 'package:api/service/note_data.dart';
import 'package:flutter/material.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  List listData = [];
  Future<void> _detailsNote(int id)async{
    try{
      var satus =await NoteData().getDetailsData(id);
      if(satus != null){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: AppText(text: 'Note View')));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: AppText(text: 'data not found')));
      }
    }catch(error){
      log("$error");
    }
  }
  Future<void> deleteNote(int id, int index)async{
    bool? confirmDelete = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Delete Note"),
          content: const Text(
            "Are you sure you want to delete this note?",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text("Cancel"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text("Delete",style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
            ),
            ),
          ],
        );
      },
    );

    if (confirmDelete != true) {
      return;
    }
    var sucess =await NoteData().getDeleteData(id);
    if (sucess) {
      setState(() {
        listData.removeAt(index);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Note deleted successfully"),
        ),
      );
    }
  }
  Future<void> faceData() async {
    var data = await NoteData().getNoteData();

    if (!mounted) return;
    setState(() {
      listData.clear();
      listData.addAll(data);
    });
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
        title: AppText(text: "Note App", tSize: 18, tWeight: FontWeight.bold),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>NoteSearchScreen(listData: listData, faceData:  faceData,)));
          }, icon: Icon(Icons.search_rounded,size: 30,)),
          SizedBox(width: 10,),
        ],
      ),
      body: Center(
        child: listData.isEmpty
            ? CircularProgressIndicator()
            : ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: listData.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async{
                      final result =await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailsScreen(data: listData, index: index, faceData:faceData,),
                        ),
                      );
                      setState(() {

                      });
                      if(result == true){
                        faceData();
                      }
                    },
                    child: Card(
                      // color: Colors.white,
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    text: "${listData[index]['title']}",
                                    tSize: 15,
                                    tOverflow: TextOverflow.ellipsis,
                                    maxline: 1,
                                    tWeight: FontWeight.bold,
                                  ),
                                  RichText(
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    text: TextSpan(
                                      text: "${listData[index]['details']}",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    spacing: 5,
                                    children: [
                                      Icon(
                                        Icons.folder,
                                        size: 15,
                                        color: Colors.grey,
                                      ),
                                      AppText(text: "Uncatogrise", tSize: 10),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {

                                deleteNote(listData[index]['id'], index);
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,

        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NoteAddScreen(listData: listData, faceData: faceData,),
            ),
          );

          if (result == true) {
            faceData();
          }
        },
        child: Icon(Icons.add, size: 30, color: Colors.white),
      ),
    );
  }
}
