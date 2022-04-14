class UserInformation {
  String? password;
  String? gToken;
  String? lastName;
  String? uid;
  String? emailId;
  String? firstName;

  UserInformation(
      {this.password,
      this.gToken,
      this.lastName,
      this.uid,
      this.emailId,
      this.firstName});

  UserInformation.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    gToken = json['g_token'];
    lastName = json['last_name'];
    uid = json['uid'];
    emailId = json['email_id'];
    firstName = json['first_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['password'] = password;
    data['g_token'] = gToken;
    data['last_name'] = lastName;
    data['uid'] = uid;
    data['email_id'] = emailId;
    data['first_name'] = firstName;
    return data;
  }
}
