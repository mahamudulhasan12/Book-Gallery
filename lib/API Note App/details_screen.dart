import 'package:api/API%20Note%20App/note_update_screen.dart';
import 'package:api/custom_widget/app_text.dart';
import 'package:api/service/note_data.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.data, required this.index, required this.faceData,});
  final List<dynamic> data;
  final int index;
  final VoidCallback faceData;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  // void initState() {
  //   widget.faceData();
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(text: "Details",tWeight: FontWeight.bold,tSize: 17,),
      ),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          AppText(text: widget.data[widget.index]['title'],tSize: 16,tWeight: FontWeight.bold,maxline: 2,tOverflow: TextOverflow.ellipsis,),
          SizedBox(height: 10,),
          RichText(
            softWrap: true,
            text: TextSpan(
              children: [
                TextSpan(text: widget.data[widget.index]['details'],style: TextStyle(
                  fontSize: 13,
                  color: Colors.black
                )),
              ]
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,

        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>NoteUpdateScreeen(titleData: '${widget.data[widget.index]['title']}', detailsData: '${widget.data[widget.index]['details']}', id: widget.data[widget.index]['id'],),
            ),
          );
          if(result == true){
            setState(() {
              widget.faceData();
              widget.data[widget.index]['title'] = result["title"];
              widget.data[widget.index]['details'] = result["details"];
            });
          }
        },
        child: Icon(Icons.edit, size: 30, color: Colors.white),
      ),

    );
  }
}