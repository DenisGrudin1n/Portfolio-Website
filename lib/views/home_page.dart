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
  final mainDesktopKey = GlobalKey();
  final mainMobileKey = GlobalKey();

  void scrollToSection(int navIndex) {
    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
  }

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
        body: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverAppBar(
              pinned: true,
              leading: SizedBox.shrink(), // Приховує іконку трьох рисочок
              actions: [
                SizedBox.shrink()
              ], // Забезпечує порожній простір замість іконки
              flexibleSpace: constraints.maxWidth >= kMinDesktopWidth
                  ? HeaderDesktop(
                      onNavMenuTap: (int navIndex) {
                        scrollToSection(navIndex);
                      },
                    )
                  : HeaderMobile(
                      onLogoTap: () {},
                      onMenuTap: () {
                        scaffoldKey.currentState?.openEndDrawer();
                      },
                    ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(
                  key: constraints.maxWidth >= kMinDesktopWidth
                      ? mainDesktopKey
                      : mainMobileKey,
                ),
                if (constraints.maxWidth >= kMinDesktopWidth)
                  MainDesktop(key: mainDesktopKey)
                else
                  MainMobile(key: mainMobileKey),
                if (constraints.maxWidth >= kMinAboutWidth)
                  AboutDesktop()
                else
                  AboutMobile(),
                SkillsSection(
                  key: navbarKeys[2],
                ),
                ProjectsSection(
                  key: navbarKeys[3],
                ),
                ContactsSection(
                  key: navbarKeys[4],
                ),
                const FooterSection(),
              ]),
            ),
          ],
        ),
      );
    });
  }
}
