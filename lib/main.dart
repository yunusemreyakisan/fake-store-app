import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:fakestoreapp/data/repositories/product_repository.dart';
import 'package:fakestoreapp/data/services/api_service_impl.dart';
import 'package:fakestoreapp/ui/screens/home_screen.dart';
import 'package:fakestoreapp/ui/theme/theme_data.dart';
import 'package:fakestoreapp/utils/extensions.dart';
import 'package:fakestoreapp/view_models/product_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // Create Dio instance for HTTP requests
  final Dio dio = Dio();

  // Create ApiService instance with the Dio instance
  final ApiServiceImpl apiService = ApiServiceImpl(dio: dio);

  // Create UserRepository instance with the ApiService instance
  final ProductRepository repository =
      ProductRepository(apiService: apiService);

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MultiProvider(
        providers: [
          // Provide the ProductViewModel with ProductRepository dependency to manage product data and API calls
          ChangeNotifierProvider<ProductViewModel>(
            create: (context) => ProductViewModel(repository: repository),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fake Magazam',
      theme: context.isDarkMode
          ? ThemeData(colorScheme: darkColorScheme)
          : ThemeData(colorScheme: lightColorScheme),
      home: const HomeScreen(),
    );
  }
}
