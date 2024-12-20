import 'package:cryptext2/firebase_options.dart';
import 'package:cryptext2/resources/auth_service.dart';
import 'package:cryptext2/screens/home_page.dart';
import 'package:cryptext2/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // auth service 
    final authService = AuthService();
    return MaterialApp(
      home: StreamBuilder(
        stream: authService.authStateChanges(), 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
          } else if (snapshot.connectionState == ConnectionState.active) {
            final user = snapshot.data;
            /// unauthenticated => redirect to login page
            if (user == null) {
              return const LoginScreen();
            }
            /// authenticated => redirect to home page
            else {
              return const HomeScreen();
            }
          } else {
            return Scaffold(body: Center(child: Text("an error occured"),));
          }
        }
      ),
    );
  }
}
