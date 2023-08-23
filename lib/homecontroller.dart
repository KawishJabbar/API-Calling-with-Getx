import 'package:get/get.dart';
import 'baseclintclass.dart';
//import 'home_service.dart';
import 'model.dart';

class getdata extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    getalldata();
  }

  RxBool loaddata = false.obs;

  List<Getdata> data = [Getdata()];
  getalldata() async {
    loaddata.value = true;
    var url = 'https://jsonplaceholder.typicode.com/posts';
    //Map = {'uru'};
    var responce = await BaseClientClass.get(url, '');

    //var responce = await GetService.getservices();
    if (responce is List<Getdata>) {
      loaddata.value = false;
      data = responce;
    } else {
      loaddata.value = false;
    }
  }
}
