import 'package:flutter/material.dart';
import 'package:portfolioapp/components/about_desktop.dart';
import 'package:portfolioapp/components/about_mobile.dart';
import 'package:portfolioapp/components/contacts_section.dart';
import 'package:portfolioapp/components/drawer_mobile.dart';
import 'package:portfolioapp/components/footer_section.dart';
import 'package:portfolioapp/components/header_desktop.dart';
import 'package:portfolioapp/components/header_mobile.dart';
import 'package:portfolioapp/components/main_desktop.dart';
import 'package:portfolioapp/components/main_mobile.dart';
import 'package:portfolioapp/components/projects_section.dart';
import 'package:portfolioapp/components/skills_section.dart';
import 'package:portfolioapp/constants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(5, (index) => GlobalKey());
  final List<GlobalKey> navbarMobileKeys =
      List.generate(2, (index) => GlobalKey());

  void scrollToSection(int navIndex) {
    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  void scrollToMobileSection(int navMobileIndex) {
    final key = navbarMobileKeys[navMobileIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: bgDark1,
          endDrawer: constraints.maxWidth >= kMinDesktopWidth
              ? null
              : DrawerMobile(
                  onNavItemTap: (int navIndex) {
                    scaffoldKey.currentState?.closeEndDrawer();
                    if (navIndex < 2) {
                      scrollToMobileSection(navIndex);
                    } else {
                      scrollToSection(navIndex);
                    }
                  },
                ),
          body: Column(
            children: [
              SizedBox(
                child: constraints.maxWidth >= kMinDesktopWidth
                    ? HeaderDesktop(
                        onLogoTap: () {
                          scrollToSection(0);
                        },
                        onNavMenuTap: (int navIndex) {
                          scrollToSection(navIndex);
                        },
                      )
                    : HeaderMobile(
                        onLogoTap: () {
                          scrollToMobileSection(0);
                        },
                        onMenuTap: () {
                          scaffoldKey.currentState?.openEndDrawer();
                        },
                      ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SizedBox(
                          child: constraints.maxWidth >= kMinDesktopWidth
                              ? MainDesktop(
                                  key: navbarKeys[0],
                                  onContactButtonTap: () {
                                    scrollToSection(4);
                                  },
                                )
                              : MainMobile(
                                  key: navbarMobileKeys[0],
                                  onContactButtonTap: () {
                                    scrollToSection(4);
                                  },
                                )),
                      SizedBox(
                          width: double.maxFinite,
                          child: constraints.maxWidth >= kMinDesktopWidth
                              ? AboutDesktop(
                                  key: navbarKeys[1],
                                )
                              : AboutMobile(
                                  key: navbarMobileKeys[1],
                                )),
                      SizedBox(
                          key: navbarKeys[2], child: const SkillsSection()),
                      SizedBox(
                          key: navbarKeys[3], child: const ProjectsSection()),
                      SizedBox(
                          key: navbarKeys[4], child: const ContactsSection()),
                      const FooterSection(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
