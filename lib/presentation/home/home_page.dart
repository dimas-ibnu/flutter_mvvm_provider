import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvvm/presentation/post/post_page.dart';

import '../../notifier/post_notifier.dart';
import '../../repository/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  late PostsNotifier postNotifier;
  @override
  void initState() {
    postNotifier = Provider.of<PostsNotifier>(context, listen: false);
    ApiService.getPosts(postNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    postNotifier = Provider.of<PostsNotifier>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text("MVVM + Provider Demo"),
          actions: [
            IconButton(
                onPressed: () {
                  showAboutDialog(
                      context: context,
                      applicationName: "MVVM Provider",
                      applicationVersion: "1.0.0",
                      applicationIcon: const Icon(Icons.info),
                      applicationLegalese:
                          "Free to use and modify for any purpose",
                      children: [
                        Text("""
Author: Dimas Ibnu Malik
This is a demo app for MVVM + Provider
"""),
                      ]);
                },
                icon: const Icon(Icons.info))
          ],
        ),
        body: !postNotifier.isNull
            ? RefreshIndicator(
                onRefresh: () => ApiService.getPosts(postNotifier),
                child: Container(
                    color: Colors.black12,
                    child: ListView.builder(
                        itemCount: postNotifier.getPostList().length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.all(0),
                            key: ObjectKey(postNotifier.getPostList()[index]),
                            child: PostItemWidget(
                              post: postNotifier.getPostList()[index],
                            ),
                          );
                        })),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}
