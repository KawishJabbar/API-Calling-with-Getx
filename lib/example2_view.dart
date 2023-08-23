import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;

class Example2 extends StatefulWidget {
  const Example2({super.key});

  @override
  State<Example2> createState() => _Example2State();
}

class _Example2State extends State<Example2> {
  List<photos> listphotos = [];
  Future<List<photos>> getphotos() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        photos p = photos(title: i['title'], url: i['url'], id: i['id']);
        listphotos.add(p);
        print(listphotos.length);
      }
      return listphotos;
    } else {
      return listphotos;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Api Example"),
        ),
      ),
      body: Column(
        children: [
          Text("ok2"),
          Expanded(
              child: FutureBuilder(
                  future: getphotos(),
                  builder: (context, AsyncSnapshot<List<photos>> snapshot) {
                    return ListView.builder(
                        itemCount: listphotos.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  snapshot.data![index].url.toString()),
                            ),
                            subtitle:
                                Text(snapshot.data![index].title.toString()),
                            title: Text(
                                'name' + snapshot.data![index].id.toString()),
                          );
                        });
                  }))
        ],
      ),
    );
  }
}

class photos {
  String title, url;
  int id;
  photos({required this.title, required this.url, required this.id});
}
