import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class AddData extends StatefulWidget {
  @override
  AddDataState createState() => AddDataState();
}

class AddDataState extends State<AddData> {
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: ListView(
          children: [
            TextField(
              controller: name,
              decoration: const InputDecoration(
                  hintText: 'Enter Name', labelText: "Enter Name"),
            ),
            TextField(
              controller: surname,
              decoration: const InputDecoration(
                  hintText: 'Enter Surname', labelText: "Enter Surname"),
            ),
            TextField(
              controller: email,
              decoration: const InputDecoration(
                  hintText: 'Enter Email', labelText: "Enter Email"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                child: const Text("Add Data", style: TextStyle(fontSize: 20)),
                onPressed: () {
                  insertdata();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => MyHome()));
                })
          ],
        ),
      ),
    );
  }

  void insertdata() {
    var url = "https://9925875396.000webhostapp.com/flutter%20crud/insert.php";

    http.post(Uri.parse(url), body: {
      "name": name.text.toString(),
      "surname": surname.text.toString(),
      "email": email.text.toString(),
    });
  }
}
