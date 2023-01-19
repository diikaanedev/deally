class AuthModel {
  final String id;
  final String token;
  final String phone;
  final String role;
  final String sexe;
  final String firstName;
  final String lastName;
  final String contry;
  final String password;

  AuthModel({
    required this.id,
    required this.token,
    required this.phone,
    required this.role,
    required this.sexe,
    required this.firstName,
    required this.lastName,
    required this.contry,
    this.password = "",
  });

  set role(String roles) {
    role = roles;
  }

  set sexe(String sexe) => sexe = sexe;

  set firstName(String firstName) => firstName = firstName;

  set lastName(String lastName) => lastName = lastName;

  set contry(String contry) => contry = contry;

  set phone(String phone) => phone = phone;

  set password(String password) => password = password;

  set confirmPassword(String confirmPassword) =>
      confirmPassword = confirmPassword;

  Map<String, dynamic> toMap() {
    return {
      "role": role,
      "sexe": sexe,
      "firstName": firstName,
      "lastName": lastName,
      "contry": contry,
      "password": password,
      "phone": phone,
    };
  }

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      id: json['data']['user']['id'],
      token: json['token'],
      phone: json['data']['user']['phone'],
      role: json['data']['user']['role'],
      sexe: json['data']['user']['sexe'],
      firstName: json['data']['user']['firstName'],
      lastName: json['data']['user']['lastName'],
      contry: json['data']['user']['contry'],
    );
  }
}
