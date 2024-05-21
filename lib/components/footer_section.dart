import 'package:flutter/material.dart';
import 'package:portfolioapp/constants/constants.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      width: double.maxFinite,
      alignment: Alignment.center,
      child: const Wrap(
        alignment: WrapAlignment.spaceEvenly,
        children: [
          Text(
            "Copyright © 2023. All rights are reserved",
            style: TextStyle(
              fontWeight: mediumFontWeight,
              fontSize: 18,
              color: kLightSecondary,
            ),
          ),
          SizedBox(
            width: 325,
          ),
          Text(
            "Developed by Denis Grudinin",
            style: TextStyle(
              fontWeight: mediumFontWeight,
              fontSize: 18,
              color: kLightSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
