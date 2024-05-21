import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: bgDark1,
        endDrawer: constraints.maxWidth >= kMinDesktopWidth
            ? null
            : DrawerMobile(
                onNavItemTap: (int navIndex) {
                  scaffoldKey.currentState?.closeEndDrawer();
                  scrollToSection(navIndex);
                },
              ),
        body: SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                key: navbarKeys.first,
              ),
              // Header
              if (constraints.maxWidth >= kMinDesktopWidth)
                HeaderDesktop(
                  onNavMenuTap: (int navIndex) {
                    scrollToSection(navIndex);
                  },
                )
              else
                HeaderMobile(
                  onLogoTap: () {},
                  onMenuTap: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                ),

              // Main Section
              if (constraints.maxWidth >= kMinDesktopWidth)
                const MainDesktop()
              else
                const MainMobile(),

              // Skills Section
              SkillsSection(
                key: navbarKeys[2],
              ),

              // Projects Section
              ProjectsSection(
                key: navbarKeys[3],
              ),

              // Contacts Section
              ContactsSection(
                key: navbarKeys[4],
              ),

              // Footer Section
              const FooterSection(),
            ],
          ),
        ),
      );
    });
  }

  void scrollToSection(int navIndex) {
    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
  }
}
