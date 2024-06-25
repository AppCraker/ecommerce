import 'package:ecommerce/Provider/cart_provider.dart';
import 'package:ecommerce/screens/nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'Provider/favourite_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MultiProvider(
          providers: [
            // for add to cart
            ChangeNotifierProvider(create: (_)=>CartProvider()),
            // for favorite
            ChangeNotifierProvider(create: (_)=>FavoriteProvider()),
          ],
          child: MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                textTheme: GoogleFonts.mulishTextTheme(),
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const BottomNavBar()));
}
