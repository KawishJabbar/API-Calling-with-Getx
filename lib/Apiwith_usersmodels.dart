import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api/Models/User_model.dart';
import 'package:http/http.dart' as http;

class Example_Models extends StatefulWidget {
  const Example_Models({super.key});

  @override
  State<Example_Models> createState() => _Example_ModelsState();
}

class _Example_ModelsState extends State<Example_Models> {
  List<UserModel> userlist = [];
  Future<List<UserModel>> getuser() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        userlist.add(UserModel.fromJson(i));
      }
      return userlist;
    } else {
      return userlist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text("Api With Models"),
      )),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: getuser(),
                  builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    } else {
                      return ListView.builder(
                          itemCount: userlist.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Column(
                                children: [
                                  Reuse(
                                      title: 'name',
                                      value: snapshot.data![index].name
                                          .toString()),
                                  Reuse(
                                      title: 'username',
                                      value: snapshot.data![index].username
                                          .toString()),
                                  Reuse(
                                      title: 'email',
                                      value: snapshot.data![index].email
                                          .toString()),
                                  Reuse(
                                      title: 'address',
                                      value: snapshot
                                          .data![index].address!.geo!.lat
                                          .toString()),
                                ],
                              ),
                            );
                          });
                    }
                  }))
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class Reuse extends StatelessWidget {
  String title, value;
  Reuse({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title), Text(value)],
      ),
    );
  }
}
