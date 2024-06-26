import 'package:flutter/material.dart';

class ThankYouCheck extends StatelessWidget {
  const ThankYouCheck({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      right: 0,
      left: 0,
      top: -40,
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Color(0xffD9D9D9),
        child: CircleAvatar(
          radius: 40,
          backgroundColor: Color(0xff34A853),
          child: Icon(
            Icons.check,
            size: 50,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
