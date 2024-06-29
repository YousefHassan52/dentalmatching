import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:dentalmatching/core/constants/colors.dart';
import 'package:dentalmatching/features/common_faetures/notifications/controller/imp_controller.dart';
import 'package:dentalmatching/features/patient_features/add_case/Views/add_case.dart';
import 'package:dentalmatching/features/patient_features/view_casess/View/has_cases.dart';
import 'package:dentalmatching/features/patient_features/settings_patient/view/profile_patient_screen.dart';
import 'package:dentalmatching/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePatientScreen extends StatefulWidget {
  const HomePatientScreen({Key? key}) : super(key: key);

  @override
  State<HomePatientScreen> createState() => _HomePatientScreenState();
}

class _HomePatientScreenState extends State<HomePatientScreen> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final _controller = NotchBottomBarController(index: 0);

  int maxCount = 3;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    NotificationControllerImpl notificationController =
        Get.put(NotificationControllerImpl());
    notificationController.initializeFirebaseAndToken();
  }

  /// widget list
  final List<Widget> bottomBarPages = [
    const AddCaseScreen(),
    const HasCases(),
    const SettingsPatientScreen(),
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
                  'Add Case'.tr,
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                )),
            activeItem: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          BottomBarItem(
            inActiveItem: FittedBox(
                fit: BoxFit.fitHeight,
                child: Text(
                  "My Cases".tr,
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
