import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:navigation/models/posts_model.dart';

class PostsController {
  ValueNotifier<int> valorAleatorio = ValueNotifier<int>(0);
  ValueNotifier<List<Post>> posts = ValueNotifier<List<Post>>([]);
  ValueNotifier<bool> inLoading = ValueNotifier<bool>(false);

  random() async {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      valorAleatorio.value = Random().nextInt(1000);
    }
  }

  callApi() async {
    var client = http.Client();
    try {
      inLoading.value = true;
      var response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );
      var decodedResponse = jsonDecode(response.body) as List;
      posts.value = decodedResponse.map((e) => Post.fromJson(e)).toList();
      await Future.delayed(Duration(seconds: 2));
    } finally {
      client.close();
      inLoading.value = false;
    }
  }

  resetApiArray() {
    posts.value = [];
  }
}
