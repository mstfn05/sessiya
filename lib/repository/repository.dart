import 'dart:convert';
import 'package:flutter_application_1/model/user.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<List<User>> getPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
