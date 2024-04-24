import 'package:flutter/material.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/my_cart_body.dart';

import '../../../../core/widgets/cuatom_app_bar.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "My Cart"),
      body: const MyCartViewBody(),
    );
  }
}
