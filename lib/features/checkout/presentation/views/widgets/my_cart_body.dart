import 'package:flutter/material.dart';
import 'package:payment_app/core/widgets/custom_buttton.dart';
import 'package:payment_app/core/widgets/payment_method_list_view.dart';

import 'cart_info_item.dart';
import 'total_price.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Expanded(child: Image.asset("assets/shopping.png")),
          OrderInfoItem(
            title: "Order Subtotal",
            value: r"42.97$",
          ),
          const SizedBox(
            height: 3,
          ),
          OrderInfoItem(
            title: "Discount ",
            value: r"0$",
          ),
          const SizedBox(
            height: 3,
          ),
          OrderInfoItem(
            title: "Shipping",
            value: r"8$",
          ),
          const Divider(
            thickness: 2,
            height: 34,
            color: Color(0xffC7C7C7),
          ),
          TotalPrice(
            title: "total",
            value: r"50.97$",
          ),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
            text: "Complete Payment",
            onTap: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //       builder: (context) => const PaymentDetailsView()),
              // );
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const PaymentButtomSheet();
                  });
            },
          ),
          const SizedBox(
            height: 12,
          )
        ],
      ),
    );
  }
}

class PaymentButtomSheet extends StatelessWidget {
  const PaymentButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const PaymentMethodListView(),
          const SizedBox(
            height: 16,
          ),
          CustomButton(text: "continue"),
        ],
      ),
    );
  }
}
