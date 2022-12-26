import 'dart:convert';

import 'package:blooddonation/model/post.dart';
import 'package:blooddonation/model/user.dart';
import 'package:blooddonation/model/Usermodel.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static Future<List<ProductModeL>> fetchUsers() async {
    print('fetchUsers called');
    const url = 'http://192.168.1.159:8000/api/auth/login';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    print(response.body);
    final body = response.body;
    final json = jsonDecode(body);
    final results = jsonDecode(body) as List<dynamic>;
    final users = results.map((json) {
      return ProductModeL.fromJson(json);
    }).toList();
    return users;
  }
}

// class PostApi {
//   static Future<List<Post>> fetchUsers() async {
//     print('fetchUsers called');
//     const url = 'http://192.168.1.159:8000/api/auth/';
//     final uri = Uri.parse(url);
//     final response = await http.get(uri);
//     print(response.body);
//     final body = response.body;
//     final json = jsonDecode(body);
//     final results = jsonDecode(body) as List<dynamic>;
//     final users = results.map((e) {
//       return Post.fromMap(e);
//     }).toList();
//     return users;
//   }
// }