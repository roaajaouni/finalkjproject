// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AdminChildModel {
 final String name;
final String age;
  AdminChildModel({
    required this.name,
    required this.age,
  });

  AdminChildModel copyWith({
    String? name,
    String? age,
  }) {
    return AdminChildModel(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
    };
  }

  factory AdminChildModel.fromMap(Map<String, dynamic> map) {
    return AdminChildModel(
      name: map['name'] ==null ? 'd' :map['name']as String,
      age: map['age'] ==null ?'s': map['age']  as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AdminChildModel.fromJson(String source) => AdminChildModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AdminChild(name: $name, age: $age)';

  @override
  bool operator ==(covariant AdminChildModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.age == age;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}
