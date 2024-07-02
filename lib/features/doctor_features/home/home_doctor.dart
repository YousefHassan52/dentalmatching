import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/doctor_features/home_screen_dr/View/home_screen_dr.dart';
import 'package:dentalmatching/features/doctor_features/get_doctor_cases/view/get_doctor_cases_screen.dart';
import 'package:dentalmatching/features/doctor_features/settings_doctor/view/profile_doctor_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeDoctorScreen extends StatefulWidget {
  const HomeDoctorScreen({Key? key}) : super(key: key);

  @override
  State<HomeDoctorScreen> createState() => _HomeDoctorScreenState();
}

class _HomeDoctorScreenState extends State<HomeDoctorScreen> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 1);

  /// Controller to handle bottom nav bar and also handles initial page
  final _controller = NotchBottomBarController(index: 1);

  int maxCount = 3;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// widget list
  final List<Widget> bottomBarPages = const [
    GetDoctorCasesScreen(),
    HomePageDr(),
    SettingsDoctorScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: AnimatedNotchBottomBar(
        /// Provide NotchBottomBarController
        notchBottomBarController: _controller,
        color: AppColors.mainColor,
        showLabel: false,
        shadowElevation: 5,
        kBottomRadius: 10.0,
        notchColor: AppColors.mainColor,
        itemLabelStyle: TextStyle(
            overflow: TextOverflow.fade,
            color: Colors.white,
            fontSize: MediaQuery.sizeOf(context).width *
                0.020), // Set fixed font size
        removeMargins: false,
        bottomBarWidth: MediaQuery.sizeOf(context).width,
        showShadow: false,
        durationInMilliSeconds: 300,
        elevation: 1,
        bottomBarItems: [
          BottomBarItem(
            inActiveItem: FittedBox(
                fit: BoxFit.fitHeight,
                child: Text(
                  'My Cases'.tr,
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                )),
            activeItem: const Icon(
              Icons.check_circle,
              color: Colors.white,
            ),
          ),
          BottomBarItem(
            inActiveItem: FittedBox(
                fit: BoxFit.fitHeight,
                child: Text(
                  "Home".tr,
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                )),
            activeItem: const Icon(
              Icons.list,
              color: Colors.white,
            ),
          ),
          BottomBarItem(
            inActiveItem: FittedBox(
                fit: BoxFit.fitHeight,
                child: Text(
                  'Settings'.tr,
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                )),
            activeItem: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
        ],
        onTap: (index) {
          /// perform action on tab change and to update pages you can update pages without pages
          print('current selected index $index');
          _pageController.jumpToPage(index);
        },
        kIconSize: 24.0,
      ),
    );
  }
}
