// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UpdateMotherInfoModel {
  final String username;
    final String email;
   final String phone;
   final String address;
  UpdateMotherInfoModel({
    required this.username,
    required this.email,
    required this.phone,
    required this.address,
  });

  UpdateMotherInfoModel copyWith({
    String? username,
    String? email,
    String? phone,
    String? address,
  }) {
    return UpdateMotherInfoModel(
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'phone': phone,
      'address': address,
    };
  }

  factory UpdateMotherInfoModel.fromMap(Map<String, dynamic> map) {
    return UpdateMotherInfoModel(
      username: map['username']== null ?'username unknown ': map['username'] as String,
      email: map['email']==null ?'email unknown': map['email'] as String,
      phone: map['phone'] ==null?'phone unknown':map['phone']  as String,
      address: map['address']== null ?'address unknown': map['address'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdateMotherInfoModel.fromJson(String source) => UpdateMotherInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UpdateMotherInfoModel(username: $username, email: $email, phone: $phone, address: $address)';
  }

  @override
  bool operator ==(covariant UpdateMotherInfoModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.username == username &&
      other.email == email &&
      other.phone == phone &&
      other.address == address;
  }

  @override
  int get hashCode {
    return username.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      address.hashCode;
  }
}
