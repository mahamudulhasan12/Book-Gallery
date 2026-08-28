import 'dart:developer';

import 'package:api/API%20Note%20App/details_screen.dart';
import 'package:api/API%20Note%20App/note_add_screen.dart';
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

  faceData() async {
    listData.clear();

    Future.delayed(Duration(microseconds: 500));
    var data = await NoteData().getNoteData();
    // await NoteData().getCreateData(title: "", details: "");
    // log("====$data========");
    listData.addAll(data);
    // log("======$data====");
    setState(() {});
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
      ),
      body: Center(
        child: listData.isEmpty
            ? CircularProgressIndicator()
            : ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: listData.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailsScreen(data: listData, index: index),
                        ),
                      );
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
            MaterialPageRoute(builder: (context) => NoteAddScreen(listData: listData,)),
          );

          if (result == true) {
            NoteData().getNoteData();
          }
        },

        child: Icon(Icons.add, size: 30, color: Colors.white),
      ),
    );
  }
}
