import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../configs/config.dart';
import '../../presentation.dart';

class EntryPoint extends StatelessWidget {
  const EntryPoint({super.key});

  static String routeName = "/entrypoint";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: const Color(0xFF17203A),
      body: Consumer<SideMenuProvider>(
        builder: (context, side, _) => Stack(
          children: [
            AnimatedPositioned(
                duration: kDefaultDuration,
                curve: Curves.fastOutSlowIn,
                width: 268.w,
                left: side.isOpened ? 0 : -268.w,
                child: const SideMenu()),
            Transform.translate(
              offset: Offset(side.isOpened ? 268.w : 0, 0),
              child: Transform.scale(
                scale: side.isOpened ? 0.85 : 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Consumer<VisibilityProvider>(
                    builder: (context, visibility, _) => GestureDetector(
                      onTap: () {
                        side.changeIsOpened(false);
                        visibility.isVisible = false;
                      },
                      child: Consumer<BotNavBarProvider>(
                          builder: (context, navbar, _) =>
                              navbar.currentIndex == 0
                                  ? const HomePage()
                                  : navbar.currentIndex == 1
                                      ? const TransactionPage()
                                      : const ProfilePage()),
                    ),
                  ),
                ),
              ),
            ),
            Consumer<VisibilityProvider>(
              builder: (context, visibility, _) => AnimatedOpacity(
                duration: kDefaultDuration,
                opacity: visibility.isVisible ? 1.0 : 0.0,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Align(
                    alignment: const Alignment(0.0, 1.0),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: Container(
                        height: 75.h,
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: ThemeConfig.kPrimaryColor.withOpacity(0.8)),
                        child: Consumer<BotNavBarProvider>(
                          builder: (context, navbar, _) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: List.generate(
                              navbar.menuNavbar.length,
                              (index) {
                                final data = navbar.menuNavbar[index];
                                return GestureDetector(
                                  onTap: () {
                                    navbar.changeIndex(index);
                                  },
                                  child: _customNavbarItem(
                                      title: data['title'],
                                      icon: data['icon'],
                                      index: index),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Consumer _customNavbarItem(
      {required String title, required IconData icon, required int index}) {
    return Consumer<BotNavBarProvider>(
      builder: (context, navbar, _) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,
              color: navbar.currentIndex == index
                  ? Colors.white
                  : Colors.white.withOpacity(0.5)),
          Text(
            title,
            style: ThemeConfig.caption.copyWith(
                color: navbar.currentIndex == index
                    ? Colors.white
                    : Colors.white.withOpacity(0.5)),
          ),
        ],
      ),
    );
  }
}
