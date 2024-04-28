// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/features/checkout/presentation/cubit/paymob_cubit/paymob_cubit.dart';
import 'package:payment_app/features/checkout/presentation/cubit/stripe_cubit/stripe_cubit.dart';
import 'package:payment_app/features/data/models/payment_intent_input_model/payment_intent_input_model.dart';

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
              if (activeIndex == 0) {
                PaymentIntentInputModel paymentIntentInputModel =
                    PaymentIntentInputModel(
                        amount: '100',
                        currency: "USD",
                        customerId: "cus_PzKSUUPBfL6RTT");
                BlocProvider.of<StripePaymentCubit>(context).makePayment(
                    paymentIntentInputModel: paymentIntentInputModel);
              } else if (activeIndex == 1) {
                BlocProvider.of<PaymobPaymentCubit>(context)
                    .makePayment(amount: 10, currency: "EGP");
              }
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
