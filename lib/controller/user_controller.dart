import 'dart:convert';

import 'package:get/get.dart';
//import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:http/http.dart' as http;
import '../Models/User_model.dart';

class getuserdata extends GetxController {
  @override
  void onInit() async {
    getuser2();
    getuser();
    super.onInit();
  }

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

  RxBool loading = false.obs;
  var data;
  Future<void> getuser2() async {
    loading.value = true;
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      loading.value = false;
      data = jsonDecode(response.body.toString());
    } else {
      loading.value = false;
    }
  }
}
