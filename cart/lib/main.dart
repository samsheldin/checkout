import 'package:cart/bloc/bloc.dart';
import 'package:cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'bloc/cart_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<CartBloc>(create: (context) => CartBloc()..add(FetchCart())),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:CartScreen(),
    );
  }
}


