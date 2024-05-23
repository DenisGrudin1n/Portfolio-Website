import 'package:flutter/material.dart';
import 'package:portfolioapp/components/site_logo.dart';
import 'package:portfolioapp/constants/constants.dart';

class HeaderDesktop extends StatelessWidget {
  final Function(int) onNavMenuTap;
  final VoidCallback? onLogoTap;

  const HeaderDesktop({
    super.key,
    required this.onNavMenuTap,
    required this.onLogoTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.maxFinite,
      padding: const EdgeInsets.only(left: 20, right: 20),
      decoration: kHeaderDecoration,
      child: Row(
        children: [
          SiteLogo(
            onTap: onLogoTap,
          ),
          const Spacer(),
          for (int i = 0; i < navTitles.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: TextButton(
                onPressed: () {
                  onNavMenuTap(i);
                },
                child: Text(
                  navTitles[i],
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: mediumFontWeight,
                      color: kLight),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
