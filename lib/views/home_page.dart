import 'package:flutter/material.dart';
import 'package:portfolioapp/constants/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgDark1,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          // Main Section
          Container(
            height: 60,
            width: double.maxFinite,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.transparent, bgLight1],
              ),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Row(
              children: [
                const Text(
                  "Portfolio",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: boldFontWeight,
                    color: yellowSecondary,
                  ),
                ),
                const Spacer(),
                for (int i = 0; i < navTitles.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: TextButton(
                      onPressed: () {},
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
          ),
          // Skills Section
          Container(
            height: 350,
            width: double.maxFinite,
            color: Colors.blueGrey,
          ),
          // Projects Section
          const SizedBox(
            height: 350,
            width: double.maxFinite,
          ),
          // Contacts Section
          Container(
            height: 350,
            width: double.maxFinite,
            color: Colors.blueGrey,
          ),
          // Footer Section
          const SizedBox(
            height: 350,
            width: double.maxFinite,
          ),
        ],
      ),
    );
  }
}
