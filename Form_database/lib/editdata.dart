import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'main.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({required this.list, required this.index});

  @override
  EditState createState() => EditState();
}

class EditState extends State<EditData> {
  late TextEditingController cname;
  late TextEditingController cemail;

  void editdata() {
    var url = "https://9925875396.000webhostapp.com/flutter%20crud/update.php";

    http.post(Uri.parse(url), body: {
      'id': widget.list[widget.index]['id'],
      'name': cname.text.toString(),
      'email': cemail.text.toString(),
    });
  }

  @override
  void initState() {
    cname = TextEditingController(text: widget.list[widget.index]['name']);
    cemail = TextEditingController(text: widget.list[widget.index]['email']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
              controller: cname,
              decoration: const InputDecoration(
                  hintText: "Enter Name", labelText: "Enter Name"),
            ),
            TextField(
              controller: cemail,
              decoration: const InputDecoration(
                  hintText: "Enter Email", labelText: "Enter Email"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                child: Text("Edit Data"),
                onPressed: () {
                  editdata();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => MyHome()));
                })
          ],
        ),
      ),
    );
  }
}
