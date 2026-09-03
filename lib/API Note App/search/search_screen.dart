import 'package:api/API%20Note%20App/details_screen.dart';
import 'package:flutter/material.dart';

import '../../custom_widget/app_text.dart';
class NoteSearchScreen extends StatefulWidget {
  const NoteSearchScreen({super.key, required this.listData, required this.faceData});

  final List listData;
  final VoidCallback faceData;
  @override
  State<NoteSearchScreen> createState() => _NoteSearchScreenState();
}

class _NoteSearchScreenState extends State<NoteSearchScreen> {
  TextEditingController search = TextEditingController();
  late List unfilderData;
  @override
  void initState() {
    unfilderData = List.from(widget.listData);
    super.initState();
  }
  void searchData(String str){
    if(str.isNotEmpty){
      var filterData = [];
      for(int i =0;i < unfilderData.length;i++){
        if(unfilderData[i]['title'].toString().toLowerCase().contains(str.toLowerCase())){
          filterData.add(unfilderData[i]);
        }
      }
      setState(() {
        unfilderData = filterData;
      });
    }else{
      unfilderData = List.from(widget.listData);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: search,
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: Colors.grey.shade200,
            hintText: "Search for Notes",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
          ),
          onChanged: (String str) {
            // searchData(str);
            setState(() {
              searchData(str);
            });
          },
        ),
      ),
      body: ListView.builder(
      itemCount: unfilderData.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(data: unfilderData, index: index, faceData: widget.faceData,)));
          },
          child: ListTile(
            title: Text(
              unfilderData[index]['title'].toString(),
            ),
            subtitle: Text(
              unfilderData[index]['details'].toString(),
            ),
          ),
        );
      },
    ),
    );
  }
}

