// ignore_for_file: prefer_const_constructors

import 'package:admin/provider/app_provider.dart';
import 'package:admin/screens/home_page.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

// import 'package:flutter_stripe/flutter_stripe.dart';

// import 'package:home/constants/theme.dart';

// import 'package:admin/provider/app_provider.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

// ...
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    // return changeNotfierProvider( create :(context)=> AppProvider(), child Material )
    return ChangeNotifierProvider<AppProvider>(
      create: (context) => AppProvider()
      ..getUserListFun()
      ..getCategoriesListFun(),
      child: MaterialApp(
        title: 'Admin Panel',
        // debugShowCheckedModeBanner: false,
        home:HomePage (),
      
      ),
    );
  }
}

