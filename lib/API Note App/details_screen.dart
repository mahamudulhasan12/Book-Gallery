import 'package:api/custom_widget/app_text.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.data, required this.index,});
  final List<dynamic> data;
  final int index;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
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
    );
  }
}