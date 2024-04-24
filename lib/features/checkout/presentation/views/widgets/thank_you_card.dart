import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/total_price.dart';

import '../../../../../core/utils/styles.dart';
import 'info_item_card.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
          color: const Color(0xffD9D9D9),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.only(top: 50 + 8, left: 16, right: 16),
        child: Column(
          children: [
            const Text(
              "Thank you!",
              style: Styles.style24,
            ),
            const Text(
              'Your transaction was successful',
              style: Styles.style18,
            ),
            const SizedBox(
              height: 22,
            ),
            const InfoItemCard(
              title: "Date",
              value: "01/24/2023",
            ),
            const SizedBox(
              height: 18,
            ),
            const InfoItemCard(
              title: "Time",
              value: "10:15 AM",
            ),
            const SizedBox(
              height: 18,
            ),
            const InfoItemCard(
              title: "To",
              value: "Sam Louis",
            ),
            const Divider(
              thickness: 2,
              indent: 16,
              endIndent: 16,
              height: 40,
            ),
            TotalPrice(title: "Total", value: r"$50.97"),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
              width: 305,
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              child: Row(
                children: [
                  SvgPicture.asset("assets/logo.svg"),
                  const SizedBox(
                    width: 23,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Credit Card",
                        style: Styles.style18,
                      ),
                      Text(
                        "Mastercard **78 ",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  FontAwesomeIcons.barcode,
                  size: 64,
                ),
                Container(
                  width: 113,
                  height: 53,
                  alignment: Alignment.center,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.50, color: Color(0xff34A853)),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                  child: Text(
                    "PAID",
                    style:
                        Styles.style24.copyWith(color: const Color(0xff34A853)),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
            SizedBox(
              height:
                  (((MediaQuery.sizeOf(context).height * .2) + 20) / 2) - 29,
            )
          ],
        ),
      ),
    );
  }
}
