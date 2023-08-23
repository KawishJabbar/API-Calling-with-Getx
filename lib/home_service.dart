import 'baseclintclass.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

class GetService {
  static Future<dynamic> getservices() async {
    var url = 'https://jsonplaceholder.typicode.com/posts';
    var responce = await BaseClientClass.get(url, '');
    try {
      if (responce is http.Response) {
        return getdataFromJson(responce.body);
      } else {
        return responce;
      }
    } catch (e) {
      return e;
    }
  }
}
