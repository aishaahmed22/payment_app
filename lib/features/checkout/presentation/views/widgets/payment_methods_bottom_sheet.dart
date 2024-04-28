import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/features/checkout/presentation/cubit/paymob_cubit/paymob_cubit.dart';
import 'package:payment_app/features/checkout/presentation/cubit/paymob_cubit/paymob_states.dart';
import 'package:payment_app/features/checkout/presentation/cubit/stripe_cubit/stripe_cubit.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/payment_method_item.dart';
import 'package:payment_app/features/data/models/payment_intent_input_model/payment_intent_input_model.dart';

class PaymentButtonSheet extends StatefulWidget {
  const PaymentButtonSheet({super.key});

  @override
  State<PaymentButtonSheet> createState() => _PaymentButtonSheetState();
}

class _PaymentButtonSheetState extends State<PaymentButtonSheet> {
  int indexColor = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            BlocConsumer<StripePaymentCubit, StripePaymentState>(
              listener: (context, state) {
                if (state is StripePaymentSucess) {
                  // Navigator.of(context).pushReplacement(
                  //   MaterialPageRoute(
                  //     builder: (context) => const ThankYouView(),
                  //   ),
                  // );
                }
                if (state is StripePaymentFailur) {
                  Navigator.pop(context);
                  SnackBar snackBar = SnackBar(content: Text(state.error));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
                if (state is StripePaymentLoading) {
                  const CircularProgressIndicator();
                }
              },
              builder: (state, index) => GestureDetector(
                  onTap: () {
                    indexColor = 0;

                    setState(() {});
                    PaymentIntentInputModel paymentIntentInputModel =
                        PaymentIntentInputModel(
                            amount: '100',
                            currency: "USD",
                            customerId: "cus_PzKSUUPBfL6RTT");
                    BlocProvider.of<StripePaymentCubit>(context).makePayment(
                        paymentIntentInputModel: paymentIntentInputModel);
                  },
                  child: PaymentMethodItem(
                    image:
                        "assets/png-clipart-credit-card-debit-card-mastercard-payment-card-credit-card-payment-internet.png",
                    isActive: indexColor == 0,
                  )),
            ),
            const SizedBox(
              width: 10,
            ),
            BlocConsumer<PaymobPaymentCubit, PaymobPaymentState>(
                listener: (context, state) {
              if (state is PaymobPaymentSucess) {}
              if (state is PaymobPaymentFailur) {
                Navigator.pop(context);
                SnackBar snackBar = SnackBar(content: Text(state.error));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
              if (state is PaymobPaymentLoading) {
                const CircularProgressIndicator();
              }
            }, builder: (context, state) {
              return GestureDetector(
                  onTap: () {
                    indexColor = 1;
                    setState(() {});
                    BlocProvider.of<PaymobPaymentCubit>(context)
                        .makePayment(amount: 10, currency: "EGP");
                  },
                  child: PaymentMethodItem(
                    isActive: indexColor == 1,
                    image: "assets/PayMob_Payments.png",
                  ));
            })
          ],
        ));
  }
}
