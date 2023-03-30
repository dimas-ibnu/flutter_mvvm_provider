import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvvm/notifier/post_notifier.dart';
import 'package:provider_mvvm/presentation/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PostsNotifier>(create: (_) => PostsNotifier()),
        Provider<Logger>(
          create: (_) => Logger(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter State Management Basic',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(title: 'Flutter State Management Basic'),
      ),
    );
  }
}
