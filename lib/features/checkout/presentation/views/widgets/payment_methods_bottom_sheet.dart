import 'package:flutter/material.dart';
import 'package:payment_app/core/widgets/payment_method_list_view.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/custom_botton_bloc_consumer.dart';

class PaymentButtomSheet extends StatelessWidget {
  const PaymentButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PaymentMethodListView(),
          SizedBox(
            height: 16,
          ),
          CustomBottonBlocConsumer(),
        ],
      ),
    );
  }
}
