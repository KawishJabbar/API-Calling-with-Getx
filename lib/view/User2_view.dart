//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:flutter_api/controller/user_controller.dart';
//import 'package:flutter_api/homecontroller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class UserInfo2 extends StatelessWidget {
  UserInfo2({super.key});
  var Usercontroller2 = Get.put(getuserdata());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("API Without Model"),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
              height: 600,
              width: 400,
              child: Obx(
                () => Usercontroller2.loading.value
                    ? CircularProgressIndicator()
                    : ListView.builder(
                        itemCount: Usercontroller2.data.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              children: [
                                Reuse(
                                    title: 'name',
                                    value: Usercontroller2.data[0]['name']
                                        .toString()),
                                Reuse(
                                    title: 'Username',
                                    value: Usercontroller2.data[1]['username']
                                        .toString())
                              ],
                            ),
                          );
                        }),
              ))
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
