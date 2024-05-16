import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolioapp/constants/constants.dart';

class SkillsMinMobile extends StatelessWidget {
  const SkillsMinMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    const containerWidth = 335.0;
    const containerHeight = 525.0;

    return Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 50, 25, 100),
      color: bgLight2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // title
          const Text(
            "WHAT CAN I DO",
            style: TextStyle(
              fontSize: 30,
              fontWeight: boldFontWeight,
              color: kLight,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          // Skills Container
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: containerWidth,
                height: containerHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: bgDark1,
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 35),
                      child: Text(
                        "Skills",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: boldFontWeight,
                          color: kLight,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    for (int i = 0; i < technologyItems.length; i += 2)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            if (i == technologyItems.length - 1)
                              Padding(
                                padding: const EdgeInsets.only(left: 38),
                                child: Column(
                                  children: [
                                    technologyItems[i]["img"].endsWith('.svg')
                                        ? SvgPicture.asset(
                                            technologyItems[i]["img"],
                                            height: skillsIconSize,
                                            width: skillsIconSize,
                                          )
                                        : Image.asset(
                                            technologyItems[i]["img"],
                                            height: skillsIconSize,
                                            width: skillsIconSize,
                                          ),
                                    const SizedBox(
                                      height: heightBetweenSkillIconAndTitle,
                                    ),
                                    Text(
                                      technologyItems[i]["title"],
                                      style: const TextStyle(
                                        fontSize: skillsTitleTextSize,
                                        fontWeight: lightFontWeight,
                                        color: kLight,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (i != technologyItems.length - 1)
                              Expanded(
                                child: Column(
                                  children: [
                                    technologyItems[i]["img"].endsWith('.svg')
                                        ? SvgPicture.asset(
                                            technologyItems[i]["img"],
                                            height: skillsIconSize,
                                            width: skillsIconSize,
                                          )
                                        : Image.asset(
                                            technologyItems[i]["img"],
                                            height: skillsIconSize,
                                            width: skillsIconSize,
                                          ),
                                    const SizedBox(
                                      height: heightBetweenSkillIconAndTitle,
                                    ),
                                    Text(
                                      technologyItems[i]["title"],
                                      style: const TextStyle(
                                        fontSize: skillsTitleTextSize,
                                        fontWeight: lightFontWeight,
                                        color: kLight,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (i < technologyItems.length - 1)
                              Expanded(
                                child: Column(
                                  children: [
                                    technologyItems[i + 1]["img"]
                                            .endsWith('.svg')
                                        ? SvgPicture.asset(
                                            technologyItems[i + 1]["img"],
                                            height: skillsIconSize,
                                            width: skillsIconSize,
                                          )
                                        : Image.asset(
                                            technologyItems[i + 1]["img"],
                                            height: skillsIconSize,
                                            width: skillsIconSize,
                                          ),
                                    const SizedBox(
                                      height: heightBetweenSkillIconAndTitle,
                                    ),
                                    Text(
                                      technologyItems[i + 1]["title"],
                                      style: const TextStyle(
                                        fontSize: skillsTitleTextSize,
                                        fontWeight: lightFontWeight,
                                        color: kLight,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: containerWidth,
                height: containerHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: bgDark1,
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 35),
                      child: Text(
                        "Tools",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: boldFontWeight,
                          color: kLight,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    for (int i = 0; i < toolItems.length; i += 2)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            if (i == toolItems.length - 1)
                              Padding(
                                padding: const EdgeInsets.only(left: 38),
                                child: Column(
                                  children: [
                                    toolItems[i]["img"].endsWith('.svg')
                                        ? SvgPicture.asset(
                                            toolItems[i]["img"],
                                            height: skillsIconSize,
                                            width: skillsIconSize,
                                          )
                                        : Image.asset(
                                            toolItems[i]["img"],
                                            height: skillsIconSize,
                                            width: skillsIconSize,
                                          ),
                                    const SizedBox(
                                      height: heightBetweenSkillIconAndTitle,
                                    ),
                                    Text(
                                      toolItems[i]["title"],
                                      style: const TextStyle(
                                        fontSize: skillsTitleTextSize,
                                        fontWeight: lightFontWeight,
                                        color: kLight,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (i != toolItems.length - 1)
                              Expanded(
                                child: Column(
                                  children: [
                                    toolItems[i]["img"].endsWith('.svg')
                                        ? SvgPicture.asset(
                                            toolItems[i]["img"],
                                            height: skillsIconSize,
                                            width: skillsIconSize,
                                          )
                                        : Image.asset(
                                            toolItems[i]["img"],
                                            height: skillsIconSize,
                                            width: skillsIconSize,
                                          ),
                                    const SizedBox(
                                      height: heightBetweenSkillIconAndTitle,
                                    ),
                                    Text(
                                      toolItems[i]["title"],
                                      style: const TextStyle(
                                        fontSize: skillsTitleTextSize,
                                        fontWeight: lightFontWeight,
                                        color: kLight,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (i < toolItems.length - 1)
                              Expanded(
                                child: Column(
                                  children: [
                                    toolItems[i + 1]["img"].endsWith('.svg')
                                        ? SvgPicture.asset(
                                            toolItems[i + 1]["img"],
                                            height: skillsIconSize,
                                            width: skillsIconSize,
                                          )
                                        : Image.asset(
                                            toolItems[i + 1]["img"],
                                            height: skillsIconSize,
                                            width: skillsIconSize,
                                          ),
                                    const SizedBox(
                                      height: heightBetweenSkillIconAndTitle,
                                    ),
                                    Text(
                                      toolItems[i + 1]["title"],
                                      style: const TextStyle(
                                        fontSize: skillsTitleTextSize,
                                        fontWeight: lightFontWeight,
                                        color: kLight,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: containerWidth,
                height: containerHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: bgDark1,
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 35),
                      child: Text(
                        "Platforms",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: boldFontWeight,
                          color: kLight,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    for (int i = 0; i < platformItems.length; i += 2)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            if (i == platformItems.length - 1)
                              Padding(
                                padding: const EdgeInsets.only(left: 38),
                                child: Column(
                                  children: [
                                    platformItems[i]["img"].endsWith('.svg')
                                        ? SvgPicture.asset(
                                            platformItems[i]["img"],
                                            height: skillsIconSize,
                                            width: skillsIconSize,
                                          )
                                        : Image.asset(
                                            platformItems[i]["img"],
                                            height: skillsIconSize,
                                            width: skillsIconSize,
                                          ),
                                    const SizedBox(
                                      height: heightBetweenSkillIconAndTitle,
                                    ),
                                    Text(
                                      platformItems[i]["title"],
                                      style: const TextStyle(
                                        fontSize: skillsTitleTextSize,
                                        fontWeight: lightFontWeight,
                                        color: kLight,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (i != platformItems.length - 1)
                              Expanded(
                                child: Column(
                                  children: [
                                    platformItems[i]["img"].endsWith('.svg')
                                        ? SvgPicture.asset(
                                            platformItems[i]["img"],
                                            height: skillsIconSize,
                                            width: skillsIconSize,
                                          )
                                        : Image.asset(
                                            platformItems[i]["img"],
                                            height: skillsIconSize,
                                            width: skillsIconSize,
                                          ),
                                    const SizedBox(
                                      height: heightBetweenSkillIconAndTitle,
                                    ),
                                    Text(
                                      platformItems[i]["title"],
                                      style: const TextStyle(
                                        fontSize: skillsTitleTextSize,
                                        fontWeight: lightFontWeight,
                                        color: kLight,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (i < platformItems.length - 1)
                              Expanded(
                                child: Column(
                                  children: [
                                    platformItems[i + 1]["img"].endsWith('.svg')
                                        ? SvgPicture.asset(
                                            platformItems[i + 1]["img"],
                                            height: skillsIconSize,
                                            width: skillsIconSize,
                                          )
                                        : Image.asset(
                                            platformItems[i + 1]["img"],
                                            height: skillsIconSize,
                                            width: skillsIconSize,
                                          ),
                                    const SizedBox(
                                      height: heightBetweenSkillIconAndTitle,
                                    ),
                                    Text(
                                      platformItems[i + 1]["title"],
                                      style: const TextStyle(
                                        fontSize: skillsTitleTextSize,
                                        fontWeight: lightFontWeight,
                                        color: kLight,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
