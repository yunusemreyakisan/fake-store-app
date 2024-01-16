import 'package:fakestoreapp/view_models/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    // Fetch product data when the state object is inserted into the tree.
    final productViewModel = Provider.of<UserViewModel>(context, listen: false);
    productViewModel.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: userViewModel.loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : userViewModel.errorMessage.isNotEmpty
              ? Center(
                  child: Text(userViewModel.errorMessage),
                )
              : ListView.builder(
                  itemCount: userViewModel.users.length,
                  itemBuilder: (context, index) {
                    final user = userViewModel.users[index];

                    // Display a list of users with their name, email, and ID.
                    return ListTile(
                      title: Text(user.name!),
                      subtitle: Text(user.website!),
                      leading: CircleAvatar(
                        child: Text(user.id.toString()),
                      ),
                    );
                  },
                ),
    );
  }
}
