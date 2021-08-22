class RegisterRequest {
  String id;
  String email;
  String password;
  String fName;
  String lName;
  String city;
  String country;
  RegisterRequest({
    this.id,
    this.email,
    this.password,
    this.fName,
    this.lName,
    this.city,
    this.country,
  });

   toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'fName': fName,
      'lName': lName,
      'city': city,
      'country': country,
    };
  }
}
