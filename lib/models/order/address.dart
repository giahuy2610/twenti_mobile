class Address {
  int iDAddress;
  String city;
  String district;
  String addressDetail;
  String ward;
  String phone;
  int isDeleted;
  String firstName;
  String lastName;
  String? email;

  Address(
      {required this.iDAddress,
      required this.city,
      required this.district,
      required this.addressDetail,
      required this.ward,
      required this.phone,
      required this.isDeleted,
      required this.firstName,
      required this.lastName,
      this.email});

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        iDAddress: json['IDAddress'],
        city: json['City'],
        district: json['District'],
        addressDetail: json['AddressDetail'],
        ward: json['Ward'],
        phone: json['Phone'],
        isDeleted: json['IsDeleted'],
        firstName: json['FirstName'],
        lastName: json['LastName'],
        email: json['Email'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IDAddress'] = this.iDAddress;
    data['City'] = this.city;
    data['District'] = this.district;
    data['AddressDetail'] = this.addressDetail;
    data['Ward'] = this.ward;
    data['Phone'] = this.phone;
    data['IsDeleted'] = this.isDeleted;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['Email'] = this.email;
    return data;
  }
}
