import 'package:flutter/material.dart';
import 'package:portfolioapp/constants/constants.dart';

class SiteLogo extends StatelessWidget {
  final VoidCallback? onTap;

  const SiteLogo({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: const GradientText(
        'DG.DEV',
        style: TextStyle(
          fontSize: 20,
          fontWeight: boldFontWeight,
          color: greenSecondary,
        ),
        gradient: kGreenGradient,
      ),
    );
  }
}
