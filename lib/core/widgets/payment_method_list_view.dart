// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../features/checkout/presentation/views/widgets/payment_method_item.dart';

class PaymentMethodListView extends StatefulWidget {
  const PaymentMethodListView({super.key});

  @override
  State<PaymentMethodListView> createState() => _PaymentMethodListViewState();
}

class _PaymentMethodListViewState extends State<PaymentMethodListView> {
  List<String> paymentMethodList = [
    "assets/cart1.svg",
    "assets/pay_pal.svg",
    "assets/apple_pay.svg"
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 10,
          );
        },
        itemCount: paymentMethodList.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              activeIndex = index;
              setState(() {});
            },
            child: PaymentMethodItem(
              isActive: activeIndex == index,
              image: paymentMethodList[index],
            ),
          );
        },
      ),
    );
  }
}
