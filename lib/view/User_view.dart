//import 'dart:ffi';

import 'package:flutter/material.dart';
//import 'package:flutter_api/Models/User_model.dart';
//import 'package:flutter_api/homecontroller.dart';
import 'package:get/get.dart';

import '../controller/user_controller.dart';
//import 'package:get/get_core/src/get_main.dart';

// ignore: must_be_immutable
class UsersInfo extends StatelessWidget {
  UsersInfo({super.key});
  var Usercontroller = Get.put(getuserdata());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text("API"),
      )),
      body: Column(
        children: [
          //Text("kawish"),
          SizedBox(
            height: 600,
            width: 400,
            child: ListView.builder(
                itemCount: Usercontroller.userlist.length,
                itemBuilder: (BuildContext context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Reuse(
                            title: 'Name',
                            value:
                                Usercontroller.userlist[index].name.toString()),
                        Reuse(
                            title: 'Username',
                            value: Usercontroller.userlist[index].username
                                .toString()),
                        Reuse(
                            title: 'Email',
                            value: Usercontroller.userlist[index].email
                                .toString()),
                      ],
                    ),
                  );
                }),
          ),
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
