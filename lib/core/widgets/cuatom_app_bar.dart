import 'package:flutter/material.dart';

import '../utils/styles.dart';

// ignore: non_constant_identifier_names
AppBar CustomAppBar({final String? title}) {
  return AppBar(
    leading: const Icon(Icons.arrow_back),
    centerTitle: true,
    title: Text(
      title ?? "",
      style: Styles.style25,
    ),
  );
}
