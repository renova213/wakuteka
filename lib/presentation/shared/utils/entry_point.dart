// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:rive/rive.dart';

// import '../../configs/config.dart';
// import '../presentation.dart';

// class EntryPointScreen extends StatefulWidget {
//   const EntryPointScreen({super.key});

//   static String routeName = "/entrypoint";

//   @override
//   State<EntryPointScreen> createState() => _EntryPointScreenState();
// }

// class _EntryPointScreenState extends State<EntryPointScreen> {
//   late SMIBool trigger;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: const HomePage(),
//       bottomNavigationBar: Container(
//         height: 50.h,
//         padding: EdgeInsets.all(12.r),
//         margin: EdgeInsets.symmetric(horizontal: 24.w),
//         decoration: BoxDecoration(
//           color: ThemeConfig.kPrimaryColor.withOpacity(0.8),
//           borderRadius: BorderRadius.all(Radius.circular(24.r)),
//         ),
//         child: Row(
//           children: [
//             GestureDetector(
//               onTap: () {
//                 trigger.change(true);
//               },
//               child: SizedBox(
//                 height: 36.h,
//                 width: 36.w,
//                 child: RiveAnimation.asset(
//                   "assets/rives/icons-set.riv",
//                   artboard: "HOME",
//                   onInit: (artboard) {
// StateMachineController controller =
//     RiveUtil.getRiveController(artboard,
//         stateMachine: "HOME_interactivity");
// trigger = controller.findSMI("active") as SMIBool;
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

import '../../../configs/config.dart';
import '../../presentation.dart';

class EntryPointScreen extends StatefulWidget {
  const EntryPointScreen({super.key});

  static String routeName = "/entrypoint";

  @override
  State<EntryPointScreen> createState() => _EntryPointScreenState();
}

class _EntryPointScreenState extends State<EntryPointScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Consumer<BotNavBarProvider>(
              builder: (context, navbar, _) => navbar.currentIndex == 0
                  ? const HomePage()
                  : navbar.currentIndex == 1
                      ? const TransactionPage()
                      : const ProfilePage()),
          Consumer<VisibilityProvider>(
            builder: (context, visibility, _) => AnimatedOpacity(
              duration: kDefaultDuration,
              opacity: visibility.isVisible ? 1.0 : 0.0,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Align(
                  alignment: const Alignment(0.0, 1.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: Container(
                      height: 75.h,
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: ThemeConfig.kPrimaryColor.withOpacity(0.8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(
                          bottomNavBar.length,
                          (index) => Consumer<BotNavBarProvider>(
                            builder: (context, navbar, _) => GestureDetector(
                                onTap: () {
                                  bottomNavBar[index].input!.change(true);
                                  navbar.changeIndex(index);
                                  Future.delayed(
                                      const Duration(milliseconds: 500), () {
                                    bottomNavBar[index].input!.change(false);
                                  });
                                },
                                child: _customNavbarItem(
                                    bottomNavBar[index], index)),
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
    );
  }

  Consumer _customNavbarItem(RiveAsset riveAsset, int index) {
    return Consumer<BotNavBarProvider>(
      builder: (context, navbar, _) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 36.w,
            height: 36.h,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                  navbar.currentIndex == index ? Colors.orange : Colors.white,
                  BlendMode.modulate),
              child: RiveAnimation.asset(
                riveAsset.src,
                artboard: riveAsset.artboard,
                onInit: (artboard) {
                  StateMachineController controller =
                      RiveUtil.getRiveController(artboard,
                          stateMachine: riveAsset.stateMachineName);
                  bottomNavBar[index].input =
                      controller.findSMI("active") as SMIBool;
                },
              ),
            ),
          ),
          Text(
            riveAsset.title,
            style: ThemeConfig.caption.copyWith(
                color: navbar.currentIndex == index
                    ? Colors.orange
                    : Colors.white),
          ),
        ],
      ),
    );
  }

  List<RiveAsset> bottomNavBar = [
    RiveAsset("assets/rives/icons-set.riv",
        artboard: "HOME",
        stateMachineName: "HOME_interactivity",
        title: "Home"),
    RiveAsset("assets/rives/icons-set.riv",
        artboard: "REFRESH/RELOAD",
        stateMachineName: "RELOAD_Interactivity",
        title: "Transaksi"),
    RiveAsset("assets/rives/icons-set.riv",
        artboard: "USER",
        stateMachineName: "USER_Interactivity",
        title: "Profil"),
  ];
}
