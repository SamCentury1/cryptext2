import 'package:cryptext2/providers/color_palette.dart';
import 'package:cryptext2/providers/settings_state.dart';
import 'package:cryptext2/resources/firestore_methods.dart';
import 'package:cryptext2/settings/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class General {
  Future<void> initializeAppState(BuildContext context, User? user) async {
    SettingsState settingsState = context.read<SettingsState>(); // No need for late declaration
    SettingsController settings = context.read<SettingsController>();
    ColorPalette palette = context.read<ColorPalette>();
    
    print("============================================");
    print("we are inside the getScreenSizeData function ==== ${user}");
    print("============================================");
    /// SCREEN SIZE DATA
    final double paddingTop = MediaQuery.of(context).padding.top;
    final Size size = MediaQuery.of(context).size; // Use Size instead of dynamic for clarity
    final AppBar appBar = AppBar();
    final double appBarHeight = appBar.preferredSize.height;
    // Calculate cryptex height
    final double cryptexHeight = (size.height - paddingTop - appBarHeight) * 0.3;
    final double actualCryptexHeight = cryptexHeight < 180.0 ? 180.0 : cryptexHeight;

    /// SET USER DATA FROM FIREBASE TO LOCAL STORAGE
    Map<String,dynamic> userData = await FirestoreMethods().getFirestoreDocument(user!.uid);

    List<Map<dynamic,dynamic>> levelData = await FirestoreMethods().getLevelsFromFirestore();

    // Set the screen size data directly
    WidgetsBinding.instance.addPostFrameCallback((_) {
      
      settingsState.setScreenSizeData({
        "width": size.width, 
        "height": size.height - paddingTop,  
        "cryptexHeight": actualCryptexHeight,
        "cryptexExtraWidgetWidth": size.width * 0.15,
        "cryptexTileAreaWidth": size.width * 0.7,
        "sizeFactor" : size.height < 600 ? 0.7 : 1.0,
      });

      settingsState.setUserData(userData);
      settings.setUserData(userData);
      palette.getThemeColors(userData['parameters']['theme']);
      settingsState.setLevelData(levelData);
    });
  }
}



