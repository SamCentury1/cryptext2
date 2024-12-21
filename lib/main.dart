import 'package:cryptext2/app_lifecycle/app_lifecycle.dart';
import 'package:cryptext2/firebase_options.dart';
import 'package:cryptext2/providers/animation_state.dart';
import 'package:cryptext2/providers/color_palette.dart';
import 'package:cryptext2/providers/game_play_state.dart';
import 'package:cryptext2/providers/settings_state.dart';
import 'package:cryptext2/resources/auth_service.dart';
import 'package:cryptext2/screens/authentication/auth_screen.dart';
import 'package:cryptext2/screens/home/home_screen.dart';
import 'package:cryptext2/screens/authentication/login_screen.dart';
import 'package:cryptext2/settings/persistence/local_storage_settings_persistence.dart';
import 'package:cryptext2/settings/persistence/settings_persistence.dart';
import 'package:cryptext2/settings/settings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp(
    settingsPersistence: LocalStorageSettingsPersistence(),
  ));
}

class MyApp extends StatefulWidget {
  final SettingsPersistence settingsPersistence;
  const MyApp({
    super.key,
    required this.settingsPersistence
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // auth service 
    // final authService = AuthService();
    return AppLifecycleObserver(
      child: MultiProvider(
        providers: [
            ChangeNotifierProvider(create: (_) => GamePlayState()),
            ChangeNotifierProvider(create: (_) => SettingsState()),
            ChangeNotifierProvider(create: (_) => AnimationState()),
            ChangeNotifierProvider(create: (_) => ColorPalette(),),        
        
          // Provider<AdsController?>.value(value: widget.adsController), /// *** uncomment when ad listener ***
      
          /// *********************** SETTINGS ************************
          Provider<SettingsController>(
            lazy: false,
            create: (context) => SettingsController(
              persistence: widget.settingsPersistence,
            )..loadStateFromPerisitence(),
          ),
          // ******************** AUDIO *********************************
          // ProxyProvider2<SettingsController, ValueNotifier<AppLifecycleState>,AudioController>(
          //   lazy: false,
          //   create: (context) => AudioController()..initialize(),
          //   update: (context, settings, lifecycleNotifier, audio) {
          //     if (audio == null) throw ArgumentError.notNull();
          //     // audio.attachSettings(settings);
          //     audio.attachLifecycleNotifier(lifecycleNotifier);
          //     return audio;
          //   },
          //   dispose: (context, audio) => audio.dispose(),
          // ),
        ],
                 
        child: const MaterialApp(
          title: "Cryptext",
          debugShowCheckedModeBanner: false,
          home: AuthScreen(),
          // home: StreamBuilder(
          //   stream: authService.authStateChanges(), 
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return Center(child: CircularProgressIndicator(),);
          //     } else if (snapshot.connectionState == ConnectionState.active) {
          //       final user = snapshot.data;
          //       /// unauthenticated => redirect to login page
          //       if (user == null) {
          //         return const LoginScreen();
          //       }
          //       /// authenticated => redirect to home page
          //       else {
          //         return const HomeScreen();
          //       }
          //     } else {
          //       return Scaffold(body: Center(child: Text("an error occured"),));
          //     }
          //   }
          // ),
        ),
      ),
    );
  }
}
