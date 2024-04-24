import 'package:flutter/material.dart';
import 'package:payment_app/core/widgets/cuatom_app_bar.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Payment Details"),
      body: const Scaffold(),
    );
  }
}
