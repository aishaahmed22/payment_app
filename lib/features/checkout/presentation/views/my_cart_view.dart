import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/styles.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/my_cart_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Cart",
          style: Styles.style25,
        ),
        centerTitle: true,
      ),
      body: const MyCartViewBody(),
    );
  }
}
