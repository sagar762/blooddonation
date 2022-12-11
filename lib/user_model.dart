class UserModel {
  final int id;
  final String email;
  final String firstname;
  final String lastname;
  final String avatar;

  UserModel(
      { required this.id,
       required this.firstname,
       required this.lastname,
       required this.email,
      required this.avatar});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        firstname: json['first_name'] ?? 'First Name',
        lastname: json['last_name'] ?? 'Last Name',
        email: json['email'],
        avatar: json['avatar'] ??
            'https://www.freepik.com/free-vector/cute-bot-say-users-hello-chatbot-greets-online-consultation_4015765.htm#query=hello&position=0&from_view=search&track=sph');
  }
}
