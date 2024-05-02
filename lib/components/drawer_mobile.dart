import 'package:flutter/material.dart';
import 'package:portfolioapp/constants/constants.dart';

class DrawerMobile extends StatelessWidget {
  const DrawerMobile({super.key});

  @override
  Widget build(BuildContext context) {
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
              leading: Icon(
                navIcons[i],
                color: kLight,
              ),
              title: Text(navTitles[i]),
              onTap: () {},
            ),
        ],
      ),
    );
  }
}
