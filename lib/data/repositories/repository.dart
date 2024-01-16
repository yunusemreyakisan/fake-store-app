import 'package:fakestoreapp/data/models/models.dart';
import 'package:fakestoreapp/data/services/api_service.dart';
import 'package:fakestoreapp/utils/logger.dart';

class UserRepository {
  final ApiService apiService;

  UserRepository({required this.apiService});

//Fetching users
  Future<List<User>> getUsers() async {
    try {
      final data = await apiService.getUsers();
      return data.map((json) => User.fromJson(json)).toList();
    } catch (e) {
      Logger.getInstance().log(e.toString());
      throw Exception('Failed to fetch user');
    }
  }
}
