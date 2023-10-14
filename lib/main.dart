import 'package:add_to_cart/Home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/Cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) {

      // bt return => class 
      return Cart();
    },
   child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
    );
    
  }
}
