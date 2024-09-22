library e_commerce_app;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ECommerceApp extends StatefulWidget {
  const ECommerceApp({super.key});

  @override
  State<ECommerceApp> createState() => _ECommerceAppState();
}

class _ECommerceAppState extends State<ECommerceApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("E commerce app"),
      ),
    );
  }
}
