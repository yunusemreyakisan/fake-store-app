import 'package:fakestoreapp/ui/providers/counter_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Consumer<CounterModel>(
        builder: (context, value, child) => const Scaffold(
          body: Center(
            child: SizedBox(
              child: Text("Home Screen"),
            ),
          ),
        ),
      ),
    );
  }
}
