// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class OrderInfoItem extends StatelessWidget {
  OrderInfoItem({super.key, required this.title, required this.value});
  String title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Styles.style18,
        ),
        const Spacer(),
        Text(
          value,
          style: Styles.style18,
        ),
      ],
    );
  }
}
