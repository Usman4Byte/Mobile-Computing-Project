import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart'; // Import kIsWeb
import 'screens/sign_in_screen.dart';
import 'screens/home_screen.dart';
import 'screens/sign_up_screen.dart'; // Import the SignUpScreen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase based on the platform
  if (Firebase.apps.isEmpty) {
    if (kIsWeb) {
      await Firebase.initializeApp(
        options: FirebaseOptions(
          apiKey: "AIzaSyA3oBcSqRePSrnr954ZjJBKj3Kl3S1j5Ww",
          authDomain: "fitness-app-mobile-computing.firebaseapp.com",
          projectId: "fitness-app-mobile-computing",
          storageBucket: "fitness-app-mobile-computing.appspot.com",
          messagingSenderId: "1234567890",
          appId: "1:1234567890:web:abcdef123456",
        ),
      );
    } else {
      await Firebase.initializeApp();
    }
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness App',
      debugShowCheckedModeBanner: false, // Disable debug banner
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headlineLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.yellow),
          bodyMedium: TextStyle(fontSize: 16.0, color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.yellow,
            foregroundColor: Colors.black,
            textStyle: TextStyle(fontSize: 18.0),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      initialRoute: '/signin', // Set initial route
      routes: {
        '/signin': (context) => SignInScreen(),
        '/home': (context) => HomeScreen(),
         '/signup': (context) => SignUpScreen(), 
      },
    );
  }
}
