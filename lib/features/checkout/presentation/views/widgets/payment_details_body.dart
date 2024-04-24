// // ignore_for_file: avoid_unnecessary_containers

// import 'package:flutter/material.dart';
// import 'package:payment_app/core/widgets/custom_buttton.dart';
// import 'package:payment_app/features/checkout/presentation/views/thank_you_view.dart';

// import '../../../../../core/widgets/payment_method_list_view.dart';
// import 'custom_credit_card.dart';

// class PaymentDetailsBody extends StatefulWidget {
//   const PaymentDetailsBody({super.key});

//   @override
//   State<PaymentDetailsBody> createState() => _PaymentDetailsBodyState();
// }

// class _PaymentDetailsBodyState extends State<PaymentDetailsBody> {
//   @override
//   GlobalKey<FormState> formKey = GlobalKey();
//   AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       slivers: [
//         const SliverToBoxAdapter(child: PaymentMethodListView()),
//         SliverToBoxAdapter(
//             child: CustomCreditCard(
//           autovalidateMode: autovalidateMode,
//           formKey: formKey,
//         )),
//         SliverFillRemaining(
//           hasScrollBody: false,
//           child: Align(
//             alignment: Alignment.bottomCenter,
//             child: Padding(
//               padding: const EdgeInsets.only(bottom: 12, right: 12, left: 12),
//               child: CustomButton(
//                 text: "payment",
//                 onTap: () {
//                   if (formKey.currentState!.validate()) {
//                     formKey.currentState!.save();
//                   } else {
//                     autovalidateMode = AutovalidateMode.always;
//                     setState(() {});
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => const ThankYouView()));
//                   }
//                 },
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
