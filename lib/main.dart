import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping__app/providers/ProductProviders.dart';
import 'package:shopping__app/providers/cart_provider/cart_provider.dart';
import 'package:shopping__app/providers/orders_provider/orders.dart';
import 'package:shopping__app/screens/cart_screen.dart';
import 'package:shopping__app/screens/order_screen.dart';
import 'package:shopping__app/screens/productDetailsScreen.dart';
import 'package:shopping__app/screens/profile.dart';
import 'package:shopping__app/screens/search_screen.dart';
import 'package:shopping__app/screens/shopping_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => Products()),
        ChangeNotifierProvider(create: (BuildContext context) => Cart()),
        ChangeNotifierProvider(create: (BuildContext context) => Orders()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorSchemeSeed: Colors.pinkAccent),
        title: 'Flutter Demo',
        home: const MyHomePage(),
        routes: {
          ProductDetailsScreen.id: (c) => const ProductDetailsScreen(),
          Shopping_screen.id: (c) => const Shopping_screen(data: ''),
          CartScreen.id: (c) => const CartScreen(),
          OrdersScreen.id: (c) => const OrdersScreen(),
          SearchScreen.id: (c) => const SearchScreen(),
          ProfileScreen.id: (c) => const ProfileScreen(),
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Shopping_screen(data: 'data');
  }
}
