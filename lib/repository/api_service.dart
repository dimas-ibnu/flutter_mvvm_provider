import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/post_model.dart';
import '../notifier/post_notifier.dart';

class ApiService {
  static const baseUrl = "https://jsonplaceholder.typicode.com/posts";

  static Uri API_ENDPOINT = Uri.parse(baseUrl);

  static getPosts(PostsNotifier postNotifier) async {
    List<PostModel> postList = [];
    http.get(API_ENDPOINT).then((response) {
      print('Response status: ${response.statusCode}');
      if (response.statusCode == 200) {
        print('Response body: ${response.body}');
      }

      List posts = jsonDecode(response.body);
      posts.forEach((element) {
        postList.add(PostModel.fromMap(element));
      });

      print(postList.length);
      postNotifier.setPostList(postList);
    });
  }
  static Future<bool> addPost(PostModel post,PostsNotifier postNotifier) async{
    print("addPost");
    bool result = false;
    await http.post(API_ENDPOINT,headers: {
    "Content-type": "application/json; charset=UTF-8"
    },body: json.encode(post.toMap())).then((response){

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');


      if(response.statusCode == 201){
        print("successful");
        result = true;
        postNotifier.addPostToList(post);
      }
    });

    return result;
  }
}