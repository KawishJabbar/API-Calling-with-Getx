//import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'homecontroller.dart';
//import 'package:http/http.dart' as http;
//import 'model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var post = Get.put(getdata());
  //List<Model> list = [];
  // Future<List<Model>> getpostapi() async {
  //   final Response =
  //       await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  //   var data = jsonDecode(Response.body.toString());
  //   if (Response.statusCode == 200) {
  //     for (Map i in data) {
  //       list.add(Model.fromJson(i));
  //       return list;
  //     }
  //   } else {
  //     return list;
  //   }
  //   return list;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("API")),
        ),
        body: Container(
            child: Obx(() => post.loaddata.value
                ? CircularProgressIndicator()
                : ListView.builder(
                    itemCount: post.data.length,
                    itemBuilder: ((context, index) {
                      return Text(post.data[index].title.toString());
                    })))));
  }
}
