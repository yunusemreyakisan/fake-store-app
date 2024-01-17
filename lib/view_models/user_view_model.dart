import 'package:fakestoreapp/data/models/product.dart';
import 'package:fakestoreapp/data/repositories/product_repository.dart';
import 'package:fakestoreapp/utils/logger.dart';
import 'package:flutter/material.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductRepository repository;

  ProductViewModel({required this.repository});

  List<Product> _products = [];
  bool _loading = false;
  String _errorMessage = '';

  List<Product> get products => _products;
  bool get loading => _loading;
  String get errorMessage => _errorMessage;

  //Fetch all products method
  Future<void> fetchAllProducts() async {
    _loading = true;
    _errorMessage = '';

    try {
      // Call the getUsers() method from the ProductRepository to fetch product data from the API.
      _products = await repository.getAllProducts();
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
