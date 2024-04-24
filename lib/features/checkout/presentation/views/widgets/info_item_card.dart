import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class InfoItemCard extends StatelessWidget {
  const InfoItemCard({
    required this.title,
    required this.value,
    super.key,
  });
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Styles.style18,
        ),
        Text(
          value,
          style: Styles.style1Bold8,
        )
      ],
    );
  }
}
