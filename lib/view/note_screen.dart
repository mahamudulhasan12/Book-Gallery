import 'dart:developer';

import 'package:api/custom_widget/app_text.dart';
import 'package:api/service/note_data.dart';
import 'package:flutter/material.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  List data = [];

  faceData()async{
    // data.clear();
    // var d = await NoteData().getNoteData();
    // data.addAll(d);
    // log("-----${data.length}---");
    await NoteData().getNoteData();
    await NoteData().getDetailsData();
    await NoteData().getCreateData();
    await NoteData().getDetailsData();
    await NoteData().getUpdateData();
    // setState(() {
    //
    // });
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
        title: AppText(text: "Note App",tSize: 18,tWeight: FontWeight.bold,),
      ),
      body: Center(
        child: ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: 3,
          itemBuilder: (context,index){
            return Card(
              // color: Colors.white,
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(text: "Note Title",tSize: 15,tOverflow: TextOverflow.ellipsis,maxline: 1,tWeight: FontWeight.bold,),
                        AppText(text: "Note Details",maxline: 2,tSize: 13,tOverflow: TextOverflow.ellipsis,),
                        Row(
                          spacing: 5,
                          children: [
                            Icon(Icons.folder,size: 15,color: Colors.grey,),
                            AppText(text: "Uncatogrise",tSize: 10,)
                          ],
                        )
                      ],
                    ),

                  ],
                ),
              ),
            );
          },

        ),
      ),
    );
  }
}
