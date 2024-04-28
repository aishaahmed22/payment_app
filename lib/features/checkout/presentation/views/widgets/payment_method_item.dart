import 'package:flutter/material.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem(
      {super.key, required this.isActive, required this.image});
  final bool isActive;
  final String image;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 60,
      width: 100,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1.5,
                color: isActive ? const Color(0xff34A853) : Colors.grey,
              ),
              borderRadius: BorderRadius.circular(15)),
          shadows: [
            BoxShadow(
                color: isActive ? const Color(0xff34A853) : Colors.grey,
                blurRadius: 4,
                offset: const Offset(0, 0),
                spreadRadius: 0)
          ]),
      child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Image.asset(
            image,
            height: 40,
            fit: BoxFit.scaleDown,
          )
          // SvgPicture.asset(
          //   image,
          //   height: 24,
          //   fit: BoxFit.scaleDown,
          // ),
          ),
    );
  }
}
