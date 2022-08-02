import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fhooks1_lec6/models/post.dart';
import 'package:uuid/uuid.dart';

class FireStorage {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //Upload the post to firestre
  Future<String> uploadPost(String uid, String title, String category,
      String iconUrl, bool isSelected, DateTime date, DateTime time) async {
    String res = "Some error occured";
    try {
      String postId = const Uuid().v1();
      Post post = Post(
        postId: postId,
        title: title,
        uid: uid,
        date: date,
        time: time,
        category: category,
        iconUrl: iconUrl,
        isSelected: isSelected,
      );

      await _firestore
          .collection("users")
          .doc(uid)
          .collection("Posts")
          .doc(postId)
          .set(
            post.tojson(),
          );
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
