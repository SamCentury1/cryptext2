import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreMethods {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// generates a map that can be used in various sign in methods
  Map<String,dynamic> generateUserDocument(String uid, String? username, String? email, String? photoUrl, String provider, String os) {
    return {
        "uid": uid,
        "username": username,
        "email": email,
        "photoUrl": null,
        "parameters" : {
          "muted": false,
          "soundOn": true,
          "theme": 'dark',
        },
        "createdAt": DateTime.now().toIso8601String(),
        "providerData": "none",
        "os": os,
        "balance": 200      
    };
  }

  Future<void> saveUserToDatabase(UserCredential cred, String providerData) async {
    late String os = "";
    if (Platform.isAndroid) {
      os = 'android';
    } else {
      os = 'iOS';
    }        
    if (cred.additionalUserInfo!.isNewUser) {
      final Map<String,dynamic> userDocument = generateUserDocument(
        cred.user!.uid,
        cred.user!.displayName,
        cred.user!.email,
        cred.user!.photoURL,
        providerData,
        os
      );
      await _firestore.collection("users").doc(cred.user!.uid).set(userDocument);
   
    }    
  }

}