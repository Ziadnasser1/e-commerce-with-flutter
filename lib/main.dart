// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import '../api/firestore_data.dart';
import '../api/firebase_storage.dart';

import './screens/product_overview_screen.dart';
import './screens/splash_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/product_catg_list_screen.dart';
import './screens/cart_screen.dart';

import '../models/cart.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => FillFireStore(),
        ),
        ChangeNotifierProvider(
          create: (context) => Storage(),
        ),
      ],
      child: MaterialApp(
        title: 'E-Commerce',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(color: Colors.black),
          primaryColor: Colors.red.shade800,
          hintColor: Colors.white70,
          canvasColor: Colors.white,
        ),
        home: SplashedScreen(),
        routes: {
          ProductOverviewScreen.routeName: (context) => ProductOverviewScreen(),
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          ProductCatgScreen.routeName: (context) => ProductCatgScreen(),
          CartScreen.routeName: (context) => CartScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
