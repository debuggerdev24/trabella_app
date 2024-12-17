import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  State<StatefulWidget> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  @override
  void dispose() {
    // _textController.dispose();
    super.dispose();
  }

  void goToBranch(int index) {
    widget.navigationShell.goBranch(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: widget.navigationShell,
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  Widget bottomNavigationBar() {
    return KBottomNavBar(
      onTap: (index) {
        goToBranch(index);
      },
      items: [
        KBottomNavItem(
          icon: ElasticIn(
            child: SvgPicture.asset(
              widget.navigationShell.currentIndex == 0
                  ? AppAssets.homefill
                  : AppAssets.home,
              height: 26,
            ),
          ),
          isSelected: widget.navigationShell.currentIndex == 0,
        ),
        KBottomNavItem(
          icon: ElasticIn(
            child: SvgPicture.asset(
              widget.navigationShell.currentIndex == 1
                  ? AppAssets.tripsfill
                  : AppAssets.trips,
              height: 26,
            ),
          ),
          isSelected: widget.navigationShell.currentIndex == 1,
        ),
        KBottomNavItem(
          icon: ElasticIn(
            child: SvgPicture.asset(
              widget.navigationShell.currentIndex == 2
                  ? AppAssets.walletfill
                  : AppAssets.wallet,
              height: 26,
            ),
          ),
          isSelected: widget.navigationShell.currentIndex == 2,
        ),
        KBottomNavItem(
          icon: ElasticIn(
            child: SvgPicture.asset(
              widget.navigationShell.currentIndex == 3
                  ? AppAssets.chatsfill
                  : AppAssets.chats,
              height: 26,
            ),
          ),
          isSelected: widget.navigationShell.currentIndex == 3,
        ),
        KBottomNavItem(
          icon: ElasticIn(
            child: SvgPicture.asset(
              widget.navigationShell.currentIndex == 4
                  ? AppAssets.profilefill
                  : AppAssets.profile,
              height: 26,
            ),
          ),
          isSelected: widget.navigationShell.currentIndex == 4,
        )
      ],
    );
  }
}

class KBottomNavBar extends StatefulWidget {
  const KBottomNavBar(
      {super.key, required this.items, this.onTap, this.currentIndex = 0});

  final List<KBottomNavItem> items;
  final ValueChanged<int>? onTap;
  final int currentIndex;

  @override
  State<KBottomNavBar> createState() => _KBottomNavBarState();
}

class _KBottomNavBarState extends State<KBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      color: AppColors.whiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (var (index, item) in widget.items.indexed)
            InkResponse(
              onTap: () {
                widget.onTap?.call(index);
              },
              child: item,
            )
        ],
      ),
    );
  }
}

class KBottomNavItem extends StatelessWidget {
  const KBottomNavItem({
    super.key,
    required this.icon,
    this.label,
    this.labelStyle,
    this.isSelected = false,
  });

  final Widget icon;
  final String? label;
  final TextStyle? labelStyle;
  final bool isSelected;

  KBottomNavItem copyWith(TextStyle? labelStyle) => KBottomNavItem(
        icon: icon,
        label: label,
        labelStyle: labelStyle,
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isSelected)
          ElasticIn(
            child: AnimatedPadding(
              duration: const Duration(seconds: 1),
              padding: EdgeInsets.only(bottom: 5.h),
              curve: Curves.bounceIn,
              child: Container(
                alignment: Alignment.topCenter,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.darkredcolor,
                ),
                height: 0.r,
                width: 0.r,
                // padding: EdgeInsets.only(top: 34),
              ),
            ),
          ),
        icon,
      ],
    );
  }
}
