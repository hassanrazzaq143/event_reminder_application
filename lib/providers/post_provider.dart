import 'package:fhooks1_lec6/models/post.dart';
import 'package:flutter/material.dart';

class PostProvider extends ChangeNotifier {
  Post? _post;
  Post get getPost => _post!;
  Future<void> refreshUser() async {}
}
