import 'package:flutter/material.dart';
import 'package:portfolioapp/constants/constants.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Container(
      height: screenHeight,
      constraints: const BoxConstraints(
        minHeight: 560,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: screenWidth / 6,
            backgroundImage: const AssetImage(
              "assets/me.png",
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            "Flutter Mobile",
            style: TextStyle(
              color: kLight,
              fontWeight: boldFontWeight,
              fontSize: 50,
              height: 1.1,
            ),
          ),
          const Text(
            "Developer",
            style: TextStyle(
              color: kLight,
              fontWeight: boldFontWeight,
              fontSize: 50,
              height: 1.1,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            "Hi, I`m Denis. A passionate mobile developer",
            style: TextStyle(
              color: kLight,
              fontWeight: mediumFontWeight,
              fontSize: 22,
              height: 1.7,
            ),
          ),
          const Text(
            "from Uzhhgorod, Ukraine.",
            style: TextStyle(
              color: kLight,
              fontWeight: mediumFontWeight,
              fontSize: 22,
              height: 1.7,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 220,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: yellowSecondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Download CV",
                    style: TextStyle(
                      color: kLight,
                      fontWeight: boldFontWeight,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 220,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: yellowSecondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Get in touch",
                    style: TextStyle(
                      color: kLight,
                      fontWeight: boldFontWeight,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
