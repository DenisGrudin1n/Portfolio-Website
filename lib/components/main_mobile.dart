import 'package:flutter/material.dart';
import 'package:portfolioapp/constants/constants.dart';

class MainMobile extends StatelessWidget {
  final VoidCallback? onContactButtonTap;

  const MainMobile({super.key, required this.onContactButtonTap});

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
              "assets/avatars/me.png",
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
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: yellowSecondary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Download CV",
                        style: TextStyle(
                          color: yellowSecondary,
                          fontWeight: boldFontWeight,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Icon(
                        Icons.file_download_outlined,
                        color: yellowSecondary,
                        size: 28,
                      ),
                    ],
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
                  onPressed: onContactButtonTap,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Get in touch",
                        style: TextStyle(
                          color: kLight,
                          fontWeight: boldFontWeight,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Icon(
                        Icons.chat_outlined,
                        color: kLight,
                        size: 25,
                      ),
                    ],
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
