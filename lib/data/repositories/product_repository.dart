import 'package:fakestoreapp/data/models/product.dart';
import 'package:fakestoreapp/data/services/api_service_impl.dart';
import 'package:fakestoreapp/utils/logger.dart';

class ProductRepository {
  final ApiServiceImpl apiService;

  ProductRepository({required this.apiService});

//Fetching all products
  Future<List<Product>> getAllProducts() async {
    try {
      final data = await apiService.getAllProducts();
      return data.map((json) => Product.fromJson(json)).toList();
    } catch (e) {
      Logger.getInstance().log(e.toString());
      throw Exception('Failed to fetch product');
    }
  }
}
