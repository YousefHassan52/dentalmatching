import 'package:dentalmatching/features/patient_features/AddCase/Views/AddCase.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/home_patient_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';

class HomePatientScreen extends StatefulWidget {
  const HomePatientScreen({Key? key}) : super(key: key);

  @override
  State<HomePatientScreen> createState() => _HomePatientScreenState();
}

class _HomePatientScreenState extends State<HomePatientScreen>
    with SingleTickerProviderStateMixin {
  int _tabIndex = 0;
  int get tabIndex => _tabIndex;
  set tabIndex(int v) {
    _tabIndex = v;
    setState(() {});
  }

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      bottomNavigationBar: CircleNavBar(
        activeIcons: [
          Transform.scale(
              scale: 0.6,
              child: SvgPicture.asset("assets/svg/gender.svg",
                  color: Colors.white)),
          Transform.scale(
              scale: 0.6,
              child: SvgPicture.asset(
                "assets/svg/check_email.svg",
                color: Colors.white,
              )),
          Transform.scale(
              scale: 0.6,
              child: SvgPicture.asset(
                "assets/svg/add.svg",
                color: Colors.white,
              )),
        ],
        inactiveIcons: const [
          Text(
            "My Cases",
            style: TextStyle(color: Colors.white),
          ),
          Text("Add Case", style: TextStyle(color: Colors.white)),
          Text("Profile", style: TextStyle(color: Colors.white)),
        ],
        color: Colors.white,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.8, 1),
          colors: <Color>[
            Color(0xFF193F8A),
            Color(0xFF67A4D3),
            Color(0xFF4464A0),
          ], // Gradient from https://learnui.design/tools/gradient-generator.html
          tileMode: TileMode.mirror,
        ),
        height: 60,
        circleWidth: 50,
        activeIndex: tabIndex,
        onTap: (index) {
          tabIndex = index;
          pageController.jumpToPage(tabIndex);
        },
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        elevation: 10,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (v) {
          tabIndex = v;
        },
        children: [
          const AddCaseScreen(),
          Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
              child: const Center(child: Text("My sds"))),
          const SettingsPatientScreen()
        ],
      ),
    );
  }
}
