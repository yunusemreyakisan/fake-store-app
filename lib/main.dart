import 'package:dio/dio.dart';
import 'package:fakestoreapp/data/repositories/repository.dart';
import 'package:fakestoreapp/data/services/api_service.dart';
import 'package:fakestoreapp/ui/screens/home_screen.dart';
import 'package:fakestoreapp/view_models/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // Create Dio instance for HTTP requests
  final Dio dio = Dio();

  // Create ApiService instance with the Dio instance
  final ApiService apiService = ApiService(dio: dio);

  // Create UserRepository instance with the ApiService instance
  final UserRepository userRepository = UserRepository(apiService: apiService);

  runApp(
    MultiProvider(
      providers: [
        // Provide the UserViewModel with UserRepository dependency to manage user data and API calls
        ChangeNotifierProvider<UserViewModel>(
          create: (context) => UserViewModel(userRepository: userRepository),
        ),
      ],
      child: const MyApp(),
    ),
  );
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fake Magazam',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
