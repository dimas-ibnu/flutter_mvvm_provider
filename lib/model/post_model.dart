class PostModel {
  int? id;
  int? userId;
  String? body;
  String? title;

  PostModel();

  PostModel.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    userId = data['userId'];
    body = data['body'];
    title = data['title'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'body': body,
      'title': title,
    };
  }
}
