class Post {
  final String email;
  final String password;
  // final String name;
  // final String phone_number;

  Post({required this.email, required this.password, });

  factory Post.fromMap(Map<String, dynamic> e) {
    return Post(email: e['email'], password: e['password']);
  }
}