import 'package:api/custom_widget/app_text.dart';
import 'package:api/datbase/api/app_data.dart';
import 'package:api/view/home/view%20book/view_book.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List data = [];
  getData() async {
    var a = await AppData().getData();
    data.clear();
    data.addAll(a);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppText(text: "All",tWeight: FontWeight.bold,tSize: 16,),
        actions: [
          AppText(text: "${data.length} Stock",tWeight: FontWeight.bold,),
          SizedBox(width: 15,)
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // mainAxisSpacing: 5,
          // crossAxisSpacing: 2,
          mainAxisExtent: 200
          // childAspectRatio: 0.99
        ),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.menu_book),

                        AppText(
                          text: "# ${data[index]["id"]}",
                          tWeight: FontWeight.bold,
                          tSize: 15,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    AppText(
                      text: "${data[index]["title"]}",
                      tOverflow: TextOverflow.ellipsis,
                      tWeight: FontWeight.bold,
                      tSize: 15,
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(Icons.description, size: 18),
                        const SizedBox(width: 5),
                        AppText(
                          text: "${data[index]['pageCount']}",
                          tSize: 18,
                          tWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    Row(
                      spacing: 5,
                      children: [
                        Icon(Icons.person_outline, size: 18),
                        AppText(
                          text: "${data[index]["authors"].length} Authors",
                          tSize: 15,
                          tWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewBookScreen()));
                        }, child: AppText(text: "View More",tWeight: FontWeight.bold,))
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
