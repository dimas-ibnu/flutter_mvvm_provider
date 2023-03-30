// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:provider_mvvm/presentation/post/post_view_model.dart';

import '../../model/post_model.dart';

class PostItemWidget extends StatefulWidget {
  final PostModel post;

  const PostItemWidget({super.key, required this.post});

  @override
  State createState() {
    return PostPageState(post);
  }
}

class PostPageState extends State<PostItemWidget> {
  PostModel post;
  late PostViewModel? postViewModel;

  PostPageState(this.post) {
    postViewModel = PostViewModel();
    postViewModel?.setPost(post);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: new Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 0,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 0,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            (postViewModel?.post?.id ?? '0').toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            postViewModel?.post?.title ?? '',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Divider(
                height: 1,
              ),
            ),
            Expanded(
              flex: 0,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(postViewModel?.post?.body ?? ''),
              ),
            ),
            Expanded(
              flex: 0,
              child: Divider(
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
