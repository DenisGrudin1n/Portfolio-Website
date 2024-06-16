import 'package:flutter/material.dart';
import 'package:portfolioapp/constants/constants.dart';
import 'package:portfolioapp/controllers/navtitles_controller.dart';
import 'package:provider/provider.dart';

class DrawerMobile extends StatelessWidget {
  final Function(int) onNavItemTap;

  const DrawerMobile({
    super.key,
    required this.onNavItemTap,
  });

  @override
  Widget build(BuildContext context) {
    final activeIndex = context.watch<NavTitlesProvider>().activeIndex;
    return Drawer(
      backgroundColor: bgDark1,
      child: ListView(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.close,
                  color: kLight,
                ),
              ),
            ),
          ),
          for (int i = 0; i < navIcons.length; i++)
            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              titleTextStyle: const TextStyle(
                color: kLight,
                fontWeight: mediumFontWeight,
                fontSize: 16,
              ),
              leading: ShaderMask(
                shaderCallback: (bounds) {
                  return activeIndex == i
                      ? kGreenGradient.createShader(bounds)
                      : const LinearGradient(
                          colors: [kLight, kLight],
                        ).createShader(bounds);
                },
                child: Icon(
                  navIcons[i],
                  color: kLight,
                ),
              ),
              title: ShaderMask(
                shaderCallback: (bounds) {
                  return activeIndex == i
                      ? kGreenGradient.createShader(bounds)
                      : const LinearGradient(
                          colors: [kLight, kLight],
                        ).createShader(bounds);
                },
                child: Text(navTitles[i]),
              ),
              onTap: () {
                onNavItemTap(i);
              },
            ),
        ],
      ),
    );
  }
}
