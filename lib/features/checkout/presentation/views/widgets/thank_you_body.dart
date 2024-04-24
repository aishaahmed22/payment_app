import 'package:flutter/material.dart';

import 'dash_line.dart';
import 'thank_you_card.dart';
import 'thank_you_check.dart';

class ThankYouBody extends StatelessWidget {
  const ThankYouBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, right: 16, left: 16, bottom: 16),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const ThankYouCard(),
          const ThankYouCheck(),
          Positioned(
              bottom: MediaQuery.sizeOf(context).height * .2,
              left: -20,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              )),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * .2,
            right: -20,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            bottom: (MediaQuery.sizeOf(context).height * .2) + 20,
            right: 20 + 8,
            left: 20 + 8,
            child: const DashLine(),
          ),
        ],
      ),
    );
  }
}
