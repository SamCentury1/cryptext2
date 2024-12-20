import 'package:cryptext2/resources/auth_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {


    final authService = AuthService();

    // user email
    String email = authService.getUserEmail();
    

        
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        actions: [
          IconButton(
            onPressed: () => authService.signOut(), 
            icon: const Icon(Icons.logout)
          )
        ],
      ),
      body: Center(
        child: Text("Welcome ${email}"),
      ),
    );
  }
}