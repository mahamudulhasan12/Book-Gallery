import 'package:api/custom_widget/app_text.dart';
import 'package:flutter/material.dart';


class ViewBookScreen extends StatefulWidget {
  const ViewBookScreen({super.key});

  @override
  State<ViewBookScreen> createState() => _ViewBookScreenState();
}

class _ViewBookScreenState extends State<ViewBookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(text: "View Product",tWeight: FontWeight.bold,tSize: 17,),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Container(
            height: 150,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage("https://img.magnific.com/free-vector/book-floating-cartoon-vector-icon-illustration-education-object-icon-isolated-flat-vector_138676-13661.jpg?semt=ais_hybrid&w=740&q=80")
              )
            ),
          )
        ],
      ),
    );
  }
}

