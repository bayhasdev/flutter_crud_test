import 'dart:convert';

class Employee {
  int? id;
  String? name;
  String? phone;
  String? countryCode;
  String? createDate;
  Employee({
    this.id,
    this.name,
    this.phone,
    this.countryCode,
    this.createDate,
  });

  Employee copyWith({
    int? id,
    String? name,
    String? phone,
    String? countryCode,
    String? createDate,
  }) {
    return Employee(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      countryCode: countryCode ?? this.countryCode,
      createDate: createDate ?? this.createDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'countryCode': countryCode,
      'createDate': createDate,
    };
  }

  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
      id: map['id']?.toInt(),
      name: map['name'],
      phone: map['phone'],
      countryCode: map['countryCode'],
      createDate: map['createDate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Employee.fromJson(String source) => Employee.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Employee(id: $id, name: $name, phone: $phone, countryCode: $countryCode, createDate: $createDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Employee &&
        other.id == id &&
        other.name == name &&
        other.phone == phone &&
        other.countryCode == countryCode &&
        other.createDate == createDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ phone.hashCode ^ countryCode.hashCode ^ createDate.hashCode;
  }
}
