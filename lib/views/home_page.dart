import 'package:flutter/material.dart';
import 'package:portfolioapp/components/drawer_mobile.dart';
import 'package:portfolioapp/components/header_mobile.dart';
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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: bgDark1,
      endDrawer: const DrawerMobile(),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          // Main Section
          //const HeaderDesktop(),
          HeaderMobile(
            onLogoTap: () {},
            onMenuTap: () {
              scaffoldKey.currentState?.openEndDrawer();
            },
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
