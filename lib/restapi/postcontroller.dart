import 'package:blooddonation/restapi/post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ApiRequest.dart';

class PostsController extends GetxController {
  void onReady(){
    super.onReady();
    getPosts();
  }
  var posts = <Post>[].obs;
  var loading = false.obs;

  PostProvider _provider = PostProvider();

  getPosts() async {
    loading(true);
    var response = await _provider.getPosts();
    if(!response.status.hasError){
      posts.value = postFromJson(response.bodyString.toString());
    }
    loading(false);
  }

  sendPost() async {
    loading(true);
    var response = await _provider.sendPost({
      'title': 'foo',
      'body': 'bar',
      'userId': 1,
    });
    if(!response.status.hasError){
      Get.snackbar('Success', 'Post added successfully',
      snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white
      );
    }
    loading(false);
  }
}