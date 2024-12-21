
import 'package:cryptext2/functions/general.dart';
import 'package:cryptext2/screens/authentication/login_or_register_screen.dart';
import 'package:cryptext2/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  @override
  void initState() {
    super.initState();
  }  
  @override
  Widget build(BuildContext context) {
  
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // print("Snapshot: $snapshot");
          if (snapshot.connectionState == ConnectionState.waiting) {
            print("waiting");
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          } else {
            if (snapshot.hasData) {
              

              return FutureBuilder(
                future: General().initializeAppState(context,snapshot.data), 
                builder: (context, AsyncSnapshot<void> futureSnapshot) {
                  if (futureSnapshot.connectionState == ConnectionState.waiting) {
                    return Scaffold(body: Center(child: CircularProgressIndicator()));
                  } else if (futureSnapshot.hasError) {
                    return Scaffold(body: Center(child: Text('Error: ${futureSnapshot.error}')));
                  } else {
                    return HomeScreen(); // Only return after getScreenSizeData() completes
                  }
                }
              );
              // return HomeScreen();
            }else {
              print("============================================");
              print("hm!");
              print("============================================");
              // setScreenSizeData(context);
              return LoginOrRegisterScreen();
            }
          } 
        },
      );
    
  }
}
