import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wakuteka/presentation/providers/side_menu_provider.dart';

import '../../../configs/config.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 268.w,
      height: double.maxFinite,
      color: const Color(0xFF17203A),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Consumer<SideMenuProvider>(
                builder: (context, side, _) => IconButton(
                  highlightColor: const Color(0xFF6792FF),
                  onPressed: () {
                    side.changeIsOpened(false);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
            _infoCard(),
            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: const Divider(color: Colors.white24, height: 1),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.w, top: 32.h, bottom: 16.h),
              child: Text("BROWSE",
                  style:
                      ThemeConfig.body1Medium.copyWith(color: Colors.white70)),
            ),
            _sideMenuTitle(),
          ],
        ),
      ),
    );
  }

  ListTile _infoCard() {
    return ListTile(
      leading: Container(
        width: 55.h,
        height: 55.h,
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: NetworkImage(
                  "https://i1.wp.com/www.slntechnologies.com/wp-content/uploads/2017/08/ef3-placeholder-image.jpg?ssl=1",
                ),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(100),
            color: Colors.white24),
      ),
      title: Text(
        "Rizco Renova",
        style: ThemeConfig.body2Medium.copyWith(color: Colors.white),
      ),
      subtitle: Text(
        "rizcorenova31@gmail.com",
        style: ThemeConfig.body2Medium.copyWith(color: Colors.white),
      ),
    );
  }

  Consumer _sideMenuTitle() {
    return Consumer<SideMenuProvider>(
      builder: (context, sidemenu, _) => Column(
        children: List.generate(
          sidemenu.sideMenu.length,
          (index) {
            final data = sidemenu.sideMenu[index];
            return Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      sidemenu.changeCurrentInde(index);
                    },
                    child: Stack(
                      children: [
                        AnimatedOpacity(
                          opacity: sidemenu.currentIndex == index ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 450),
                          child: Container(
                            height: 60.h,
                            width: sidemenu.currentIndex == index ? 268.w : 0,
                            color: const Color(0xFF6792FF),
                          ),
                        ),
                        Ink(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          height: 60.h,
                          width: 268.w,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Row(
                            children: [
                              Icon(data['icon'], color: Colors.white),
                              SizedBox(width: 32.w),
                              Text(data["title"],
                                  style: ThemeConfig.body2Medium
                                      .copyWith(color: Colors.white))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
