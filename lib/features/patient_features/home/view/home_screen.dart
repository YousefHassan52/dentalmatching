import 'package:dentalmatching/features/patient_features/AddCase/Views/AddCase.dart';
import 'package:dentalmatching/features/patient_features/View_Cases/View/HasCases.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/profile_patient_screen.dart';
import 'package:flutter/material.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';

class HomePatientScreen extends StatefulWidget {
  const HomePatientScreen({Key? key}) : super(key: key);

  @override
  State<HomePatientScreen> createState() => _HomePatientScreenState();
}

class _HomePatientScreenState extends State<HomePatientScreen> {
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
              child: const Icon(
                Icons.post_add_rounded,
                size: 50,
                color: Colors.white,
              )),
          Transform.scale(
              scale: 0.6,
              child: const Icon(
                Icons.article_rounded,
                size: 50,
                color: Colors.white,
              )),
          Transform.scale(
              scale: 0.6,
              child: const Icon(
                Icons.person_2_outlined,
                size: 50,
                color: Colors.white,
              )),
        ],
        inactiveIcons: const [
          Text(
            "Add Case",
            style: TextStyle(color: Colors.white),
          ),
          Text("My Cases", style: TextStyle(color: Colors.white)),
          Text("Profile", style: TextStyle(color: Colors.white)),
        ],
        color: Colors.white,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.8, 1),
          colors: <Color>[
            Color(0xFF67A4D3),
            Color(0xFF4464A0),
            Color(0xFF193F8A),
          ], // Gradient from https://learnui.design/tools/gradient-generator.html
          tileMode: TileMode.mirror,
        ),
        height: 60,
        circleWidth: 50,
        activeIndex: tabIndex,
        onTap: (index) {
          // Update the tab index
          tabIndex = index;
          // Navigate to the tapped page
          pageController.animateToPage(tabIndex,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut);
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
        physics: NeverScrollableScrollPhysics(), // Disable swipe gesture
        children: const [AddCaseScreen(), HasCases(), SettingsPatientScreen()],
      ),
    );
  }
}
