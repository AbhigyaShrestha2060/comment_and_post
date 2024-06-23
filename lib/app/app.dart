import 'package:comment_and_post/features/comment/presentation/view/comment_view.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pagination Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CommentView(),
    );
  }
}
