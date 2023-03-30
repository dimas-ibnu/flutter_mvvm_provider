import '../../model/post_model.dart';

class PostViewModel {
  PostModel? _post;

  setPost(PostModel post) {
    _post = post;
  }

  PostModel? get post => _post;
}
