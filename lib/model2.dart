class Model2 {
  int? userId;
  int? id;
  String? title;
  String? body;

  Model2({this.userId, this.id, this.title, this.body});

  Model2.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
//----------------
// import 'dart:convert';

// PostsModel postsModelFromJson(String str) =>
//     PostsModel.fromJson(json.decode(str));
// String postsModelToJson(PostsModel data) => json.encode(data.toJson());

// class PostsModel {
//   PostsModel({
//     this.userId,
//     this.id,
//     this.title,
//     this.body,
//   });

//   PostsModel.fromJson(dynamic json) {
//     userId = json['userId'];
//     id = json['id'];
//     title = json['title'];
//     body = json['body'];
//   }
//   num? userId;
//   num? id;
//   String? title;
//   String? body;
//   PostsModel copyWith({
//     num? userId,
//     num? id,
//     String? title,
//     String? body,
//   }) =>
//       PostsModel(
//         userId: userId ?? this.userId,
//         id: id ?? this.id,
//         title: title ?? this.title,
//         body: body ?? this.body,
//       );
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['userId'] = userId;
//     map['id'] = id;
//     map['title'] = title;
//     map['body'] = body;
//     return map;
//   }
// }
//------------------
// To parse this JSON data, do
//
//     final model2 = model2FromJson(jsonString);


