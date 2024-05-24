import 'package:flutter/material.dart';
import 'package:portfolioapp/constants/constants.dart';
import 'package:portfolioapp/services/download_service.dart';

class MainMobile extends StatelessWidget {
  final VoidCallback? onContactButtonTap;

  const MainMobile({super.key, required this.onContactButtonTap});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    double minConstraintHeight(double screenWidth) {
      if (screenWidth < 500) {
        return 780;
      } else if (screenWidth < kMinDesktopWidth) {
        return 700;
      }
      return 670;
    }

    return Container(
      height: screenHeight,
      constraints: BoxConstraints(
        minHeight: minConstraintHeight(screenWidth),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: kMinDesktopWidth / 7,
            backgroundImage: AssetImage(
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
          if (screenWidth < 500)
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                textAlign: TextAlign.center,
                "Hi, I`m Denis.\nA passionate mobile developer\nfrom Uzhhgorod, Ukraine.",
                style: TextStyle(
                  color: kLight,
                  fontWeight: mediumFontWeight,
                  fontSize: 20,
                  height: 1.7,
                ),
              ),
            )
          else
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                textAlign: TextAlign.center,
                "Hi, I`m Denis. A passionate mobile developer\nfrom Uzhhgorod, Ukraine.",
                style: TextStyle(
                  color: kLight,
                  fontWeight: mediumFontWeight,
                  fontSize: 20,
                  height: 1.7,
                ),
              ),
            ),
          const SizedBox(
            height: 25,
          ),
          LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth < 500) {
              // For narrow screens, stack buttons vertically
              return Column(
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
                      onPressed: () {
                        launchUrl(
                            "https://drive.google.com/file/d/1DTmKNntFXnCUQAYA9xH-DDg1hSnStldv/view?usp=sharing");
                      },
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
                    height: 20,
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
              );
            } else {
              return Row(
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
                      onPressed: () {
                        launchUrl(
                            "https://drive.google.com/file/d/1DTmKNntFXnCUQAYA9xH-DDg1hSnStldv/view?usp=sharing");
                      },
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
              );
            }
          }),
        ],
      ),
    );
  }
}
