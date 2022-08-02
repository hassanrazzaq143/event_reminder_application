class Post {
  final String title;
  final String category;
  final String iconUrl;
  final bool isSelected;
  final String uid;
  final String postId;
  final DateTime date;
  final DateTime time;

  Post({
    required this.postId,
    required this.title,
    required this.category,
    required this.iconUrl,
    required this.isSelected,
    required this.uid,
    required this.date,
    required this.time,
  });
  Map<String, dynamic> tojson() => {
        "uid": uid,
        "postId": postId,
        "title": title,
        "category": category,
        "iconUrl": iconUrl,
        "date": date,
        "time": time,
        "isSelected": isSelected,
      };
}
