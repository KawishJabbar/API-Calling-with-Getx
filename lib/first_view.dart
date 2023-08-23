//import 'package:flutter/foundation.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_api/model2.dart';
import 'package:http/http.dart' as http;

class FirstView extends StatefulWidget {
  const FirstView({super.key});

  @override
  State<FirstView> createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView> {
  List<Model2> list2 = [];
  Future<List<Model2>> getpostapi() async {
    final Response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(Response.body.toString());
    if (Response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        list2.add(Model2.fromJson(i));
        print(list2);
        return list2;
      }
    } else {
      return list2;
    }
    return list2;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("API"),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getpostapi(),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text("loading");
                  } else {
                    return ListView.builder(
                        itemCount: list2.length,
                        itemBuilder: ((context, index) {
                          return Text(list2[index].title.toString());
                          //Text(index.toString());
                        }));
                  }
                })),
          )
        ],
      ),
    );
  }
}
//import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// //import '../models/Posts_model.dart';
// import 'model2.dart';

// // import '../models/posts_model.dart';

// class homescreen extends StatefulWidget {
//   const homescreen({super.key});

//   @override
//   State<homescreen> createState() => _homescreenState();
// }

// class _homescreenState extends State<homescreen> {
//   List<PostsModel> postlist = []; //no name ofr array and use this

//   Future<List<PostsModel>> getpostapi() async {
//     final response =
//         await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
//     var data = jsonDecode(response.body.toString()); //decode
//     if (response.statusCode == 200) {
//       for (Map i in data) {
//         postlist.add(PostsModel.fromJson(i));
//       }
//       return postlist;
//     } else {
//       return postlist;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           "Home Screen",
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 20,
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: FutureBuilder(
//               future: getpostapi(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return Center(
//                     child: CircularProgressIndicator(
//                       color: Colors.black,
//                       backgroundColor: Colors.grey,
//                       strokeWidth: 5.0,
//                     ),
//                   );
//                 } else {
//                   return ListView.builder(
//                     itemCount: postlist.length,
//                     itemBuilder: (context, index) {
//                       //return Text(index.toString());

//                       //return Text(postlist[index].title.toString());
//                       return Padding(
//                         padding: EdgeInsets.all(20),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Container(
//                               height: 40,
//                               width: 7000,
//                               decoration: BoxDecoration(
//                                 color: Colors.black,
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Text(
//                                 postlist[index].title.toString(),
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 15),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Container(
//                               height: 40,
//                               width: 7000,
//                               decoration: BoxDecoration(
//                                 color: Colors.white10,
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Text(
//                                 postlist[index].body.toString(),
//                                 style: TextStyle(
//                                     color: Colors.black54, fontSize: 15),
//                               ),
//                             ),

//                             // Text(postlist[index].body.toString()),
//                           ],
//                         ),
//                       );
//                     },
//                   );
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
