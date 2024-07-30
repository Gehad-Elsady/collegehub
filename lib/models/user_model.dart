class UserModel {
  String firstName;
  String lastName;
  String email;
  String governorate;
  String city;
  String university;
  String phone;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.governorate,
    required this.city,
    required this.university,
    required this.phone,
  });

  // A method to convert Firestore data into a UserModel instance
  factory UserModel.fromFirestore(Map<String, dynamic> data) {
    return UserModel(
      firstName: data['first name'],
      lastName: data['last name'],
      email: data['email'],
      governorate: data['governorate'],
      city: data['city'],
      university: data['university'],
      phone: data['phone'],
    );
  }

  // A method to convert a UserModel instance into a Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'first name': firstName,
      'last name': lastName,
      'email': email,
      'governorate': governorate,
      'city': city,
      'university': university,
      'phone': phone,
    };
  }
}
