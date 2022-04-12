import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final String url = "https://jsonplaceholder.typicode.com/posts";
  late List data;
  var dio = Dio();
  @override
  void initState() {
    super.initState();
    getJsonData();
  }

  void getJsonData() async {
    var res = await dio.get(url);
    setState(() {
      data = res.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Display data from api'),
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  constraints:
                      const BoxConstraints(maxHeight: 300, maxWidth: 300),
                  width: 200,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(children: [
                        ListTile(
                          title: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("${data[index]["title"]}"),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("${data[index]["body"]}"),
                          ),
                        ),
                      ])),
                )
              ],
            ));
          }),
    );
  }
}
