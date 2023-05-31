import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'adddata.dart';
import 'delet.dart';

void main() {
  runApp(MaterialApp(
    title: "Online database Example",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.blue),
    home: MyHome(),
  ));
}

class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => MyHomeState();
}

class MyHomeState extends State<MyHome> {
  Future getdata() async {
    final response = await http.get(Uri.parse(
        "https://9925875396.000webhostapp.com/flutter%20crud/view.php"));
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Json Parsing"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => AddData())),
          child: Icon(Icons.add),
        ),
        body: FutureBuilder(
          future: getdata(),
          builder: (build, ss) {
            if (ss.hasError) {
              print("Error");
            }

            if (ss.hasData) {
              return Items(list1: ss.data);
            } else {
              return const CircularProgressIndicator();
            }
          },
        ));
  }
}

class Items extends StatelessWidget {
  List list1;

  Items({required this.list1});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list1 == null ? 0 : list1.length,
        itemBuilder: (build, i) {
          return ListTile(
            title: Text(list1[i]["name"]),
            subtitle: Text(list1[i]["email"]),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) =>
                    Details(list: list1, index: i))),
          );
        });
  }
}
