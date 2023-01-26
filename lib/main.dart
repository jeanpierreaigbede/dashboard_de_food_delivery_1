
import 'package:dashboard/screens/restaurants/register.dart';
import 'package:flutter/foundation.dart'show kIsWeb;
import 'dart:io' show Platform;

import 'package:dashboard/screens/homepage.dart';
import 'package:dashboard/utils/responsive_Layout.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'package:dashboard/screens/responsive/desktop_scaffold.dart';
import 'package:dashboard/screens/responsive/mobile_scafffold.dart';
import 'package:dashboard/screens/responsive/tablette_scaffold.dart';


Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
      options: kIsWeb || Platform.isAndroid ? const FirebaseOptions(
          apiKey: "AIzaSyDmUgAite3gO4skFk7okfNU_fP_qPD-iYw",
          appId: "1:181260822832:web:7ad6db8f54c9147d6780f5",
          messagingSenderId: "181260822832",
          projectId: "food-delivery-brigth",
          storageBucket: "food-delivery-brigth.appspot.com"
      ):null
  ).then((value) {
    print("done");
  }).catchError((onError){print(onError.toString());});
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
