import 'package:flutter/material.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/thank_you_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const ThankYouBody(),
    );
  }
}
