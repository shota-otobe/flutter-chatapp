import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_udemy_chatapp02/firebase_options.dart';
import 'package:flutter_udemy_chatapp02/firestore/room_firestore.dart';
import 'package:flutter_udemy_chatapp02/firestore/user_firestore.dart';
import 'package:flutter_udemy_chatapp02/pages/top_page.dart';
import 'package:flutter_udemy_chatapp02/utils/shared_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedPrefs.setPrefsInstance();
  String? uid = SharedPrefs.fetchUid();
  if (uid == null) await UserFirestore.createUser;
  await RoomFirestore.fetchJoindRooms();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TopPage(),
    );
  }
}
