import 'package:flutter/material.dart';
import '../core/app_export.dart';

enum BottomBarEnum { Anasayfa, Lanlar, Profile, Sohbetler }

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({this.onChanged});
  Function(BottomBarEnum)? onChanged;


  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgNavAnaSayfa,
      activeIcon: ImageConstant.imgNavAnaSayfa,
      title: "lbl_ana_sayfa".tr,
      type: BottomBarEnum.Anasayfa,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavLanlar,
      activeIcon: ImageConstant.imgNavLanlar,
      title: "lbl_lanlar".tr,
      type: BottomBarEnum.Lanlar,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavProfile,
      activeIcon: ImageConstant.imgNavProfile,
      title: "lbl_profile".tr,
      type: BottomBarEnum.Profile,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavSohbetler,
      activeIcon: ImageConstant.imgNavSohbetler,
      title: "lbl_sohbetler".tr,
      type: BottomBarEnum.Sohbetler,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92.h,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        boxShadow: [
          BoxShadow(
            color: const Color(0x33BFBFBF),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
                0,
                -7,
            ),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 32.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: bottomMenuList[index].icon,
                    height: 34.h,
                    width: double.maxFinite,
                    color: Color(0xFF0F0F0F),
                  ),
                  Text(
                    bottomMenuList[index].title ?? "",
                    style: CustomTextStyles.bodySmallBlack90001.copyWith(
                      color: const Color(0xFF000000),
                    ),
                  ),
                ],
              ),
            ),
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: bottomMenuList[index].activeIcon,
                  height: 34.h,
                  width: 34.h,
                  color: const Color(0xFF000000),
                ),
                Text(
                  bottomMenuList[index].title ?? "",
                  style: CustomTextStyles.bodySmallBlack90001.copyWith(
                    color: const Color(0xFF000000),
                  ),
                ),
              ],
            ),
            label: "",
          );
        }),
        onTap: (index) {
          setState(() {
            selectedIndex = index;
            widget.onChanged?.call(bottomMenuList[index].type);
            setState(() {});
          });
        },
      ),
    );
  }
}

class BottomMenuModel {
  BottomMenuModel(
  {required this.icon,
  required this.activeIcon,
  this.title,
  required this.type});

   String icon;
   String activeIcon;
   String? title;
   BottomBarEnum type;

}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFFFFF),
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
