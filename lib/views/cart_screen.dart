import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static const String routeName='/cart_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart Item'),),
    );
  }
}


