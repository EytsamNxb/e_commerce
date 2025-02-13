class LoginDto{
  String username;
  String password;

  LoginDto({required this.username, required this.password});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}