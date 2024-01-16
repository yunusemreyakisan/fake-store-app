import 'package:fakestoreapp/data/models/models.dart';
import 'package:fakestoreapp/data/repositories/repository.dart';
import 'package:fakestoreapp/utils/logger.dart';
import 'package:flutter/material.dart';

class UserViewModel extends ChangeNotifier {
  final UserRepository userRepository;

  UserViewModel({required this.userRepository});

  List<User> _users = [];
  bool _loading = false;
  String _errorMessage = '';

  List<User> get users => _users;
  bool get loading => _loading;
  String get errorMessage => _errorMessage;

  //Fetch user method
  Future<void> fetchUsers() async {
    _loading = true;
    _errorMessage = '';

    try {
      // Call the getUsers() method from the ProductRepository to fetch product data from the API.
      _users = await userRepository.getUsers();
    } catch (e) {
      Logger.getInstance().log(e.toString());
      // If an exception occurs during the API call, set the error message to display the error.
      _errorMessage = 'Failed to fetch users';
    } finally {
      // After API call is completed, set loading flag to false and notify listeners of data change.
      _loading = false;
      notifyListeners();
    }
  }
}
