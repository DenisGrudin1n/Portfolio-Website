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
        runSpacing: 10,
        alignment: WrapAlignment.spaceEvenly,
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.text,
            child: Text(
              "Copyright © 2024. All rights are reserved",
              style: TextStyle(
                fontWeight: mediumFontWeight,
                fontSize: 18,
                color: kLightSecondary,
              ),
            ),
          ),
          SizedBox(
            width: 325,
          ),
          MouseRegion(
            cursor: SystemMouseCursors.text,
            child: Text(
              "Developed by Denis Grudinin",
              style: TextStyle(
                fontWeight: mediumFontWeight,
                fontSize: 18,
                color: kLightSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
