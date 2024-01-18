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

  List<Product> _cartProducts = [];

  List<Product> get products => _products;
  List<Product> get cartProducts => _cartProducts;
  bool get loading => _loading;
  String get errorMessage => _errorMessage;

  //Fetch all products method
  Future<void> fetchAllProducts() async {
    _loading = true;
    _errorMessage = '';

    try {
      _products = await repository.getAllProducts();
    } catch (e) {
      Logger.getInstance().log(e.toString());
      _errorMessage = 'Failed to fetch products';
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  //Remove product from bottom sheet
  void removeProduct(Product product) {
    _cartProducts.remove(product);
    notifyListeners();
  }

  //Add product for bottom sheet
  void addProduct(Product product) {
    _cartProducts.add(product);
    notifyListeners();
  }
}
