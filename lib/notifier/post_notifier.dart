/// This class is used to notify the [PostNotifier] class.
///
/// This class is used to notify the [PostNotifier] class to add a post to the
/// list of posts, or to set the list of posts to a new list.

import 'package:flutter/material.dart';

import '../model/post_model.dart';
import '../repository/api_service.dart';

class PostsNotifier with ChangeNotifier {
  List<PostModel> _postList = [];


  bool get isNull => _postList.isEmpty;

  addPostToList(PostModel post) {
    _postList.add(post);
    notifyListeners();
  }

  setPostList(List<PostModel> postList) {
    _postList = [];
    _postList = postList;
    notifyListeners();
  }

  List<PostModel> getPostList() {
    return _postList;
  }

  Future<bool> uploadPost(PostModel post) async {
    return await ApiService.addPost(post, this);
  }
}
