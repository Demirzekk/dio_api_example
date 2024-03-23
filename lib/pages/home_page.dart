import 'dart:developer';

import 'package:dio_api_example/pages/home_page_model_view.dart';
import 'package:flutter/material.dart';

import 'post_model.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<PostModel> postList = [];
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    postList = await HomePageModelView().getPost();
    log("postList: ${postList.toString()}");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post"),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("News Post"),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: postList.length,
                  itemBuilder: (context, index) {
                    final post = postList[index];
                    return ListTile(
                      title: Text(post.title ?? ""),
                    );
                  }))
        ],
      ),
    );
  }
}
