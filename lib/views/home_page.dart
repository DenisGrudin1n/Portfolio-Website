import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolioapp/components/drawer_mobile.dart';
import 'package:portfolioapp/components/header_desktop.dart';
import 'package:portfolioapp/components/header_mobile.dart';
import 'package:portfolioapp/components/main_desktop.dart';
import 'package:portfolioapp/components/main_mobile.dart';
import 'package:portfolioapp/components/skills_desktop.dart';
import 'package:portfolioapp/constants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: bgDark1,
        endDrawer: constraints.maxWidth >= kMinDesktopWidth
            ? null
            : const DrawerMobile(),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            // Header
            if (constraints.maxWidth >= kMinDesktopWidth)
              const HeaderDesktop()
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
            const SkillsDesktop(),
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
    });
  }
}
