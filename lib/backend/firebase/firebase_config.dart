import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyANsy2zY4ZM0VCY0WQcku1MIfsGuRsGZTM",
            authDomain: "hackathon-t47a8o.firebaseapp.com",
            projectId: "hackathon-t47a8o",
            storageBucket: "hackathon-t47a8o.appspot.com",
            messagingSenderId: "99995167364",
            appId: "1:99995167364:web:fe0848d851280d9f92f0d1"));
  } else {
    await Firebase.initializeApp();
  }
}
