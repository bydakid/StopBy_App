import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBNnxfCY_OMn6ijQosPCPJbx99lpPoZIDM",
            authDomain: "lungti-food-waste.firebaseapp.com",
            projectId: "lungti-food-waste",
            storageBucket: "lungti-food-waste.appspot.com",
            messagingSenderId: "81533999075",
            appId: "1:81533999075:web:cda5bf5f16b08e4b08f2d6",
            measurementId: "G-DWLDXXVD57"));
  } else {
    await Firebase.initializeApp();
  }
}
