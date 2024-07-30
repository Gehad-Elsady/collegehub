import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:collegehub/models/user_model.dart'; // Adjust the path as needed
import 'package:collegehub/Auth/auth-fire/auth_services.dart'; // Adjust the path as needed
import 'package:firebase_auth/firebase_auth.dart';

class UserProfileProvider with ChangeNotifier {
  UserModel? _user;
  String? _currentUserEmail;

  UserModel? get user => _user;

  // Fetch current user email
  Future<void> fetchCurrentUser() async {
    final _authService = AuthServices();
    User? currentUser = await _authService.getCurrentUser();
    if (currentUser != null) {
      _currentUserEmail = currentUser.email ?? '';
      notifyListeners();
    }
  }

  // Fetch user data from Firestore
  Future<void> fetchUserData() async {
    if (_currentUserEmail == null) return;
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection("Admin Profile")
          .doc(_currentUserEmail)
          .get();

      if (doc.exists) {
        _user = UserModel.fromFirestore(doc.data() as Map<String, dynamic>);
        notifyListeners();
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  // Save user data to Firestore
  Future<void> saveUserData({
    required String firstName,
    required String lastName,
    required String governorate,
    required String city,
    required String university,
    required String phone,
  }) async {
    if (_currentUserEmail == null) return;

    if (firstName.isEmpty ||
        lastName.isEmpty ||
        governorate.isEmpty ||
        city.isEmpty ||
        university.isEmpty ||
        phone.isEmpty) {
      throw Exception('Please fill all fields');
    }

    if (phone.length != 11 ||
        !(phone.startsWith('015') ||
            phone.startsWith('011') ||
            phone.startsWith('010') ||
            phone.startsWith('012'))) {
      throw Exception('Please enter a correct phone number');
    }

    try {
      UserModel newUser = UserModel(
        firstName: firstName,
        lastName: lastName,
        email: _currentUserEmail!,
        governorate: governorate,
        city: city,
        university: university,
        phone: phone,
      );

      await FirebaseFirestore.instance
          .collection("Admin Profile")
          .doc(_currentUserEmail)
          .set(newUser.toMap());

      _user = newUser;
      notifyListeners();
    } catch (e) {
      print('Error saving data to Firestore: $e');
    }
  }

  // Update user data in memory
  void updateUserData({
    required String firstName,
    required String lastName,
    required String governorate,
    required String city,
    required String university,
    required String phone,
  }) {
    if (_user == null) return;

    _user = UserModel(
      firstName: firstName,
      lastName: lastName,
      email: _currentUserEmail!,
      governorate: governorate,
      city: city,
      university: university,
      phone: phone,
    );

    notifyListeners();
  }
}
