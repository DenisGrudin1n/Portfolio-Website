import 'package:flutter/material.dart';
import 'package:portfolioapp/constants/constants.dart';

class SiteLogo extends StatelessWidget {
  final VoidCallback? onTap;

  const SiteLogo({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: const Text(
        "Portfolio",
        style: TextStyle(
          fontSize: 22,
          fontWeight: boldFontWeight,
          color: yellowSecondary,
        ),
      ),
    );
  }
}
