import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_title_searchview.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'bloc/profil_bloc.dart';
import 'models/function_item_model.dart';
import 'models/listplaytwo_one_item_model.dart';
import 'models/profil_initial_model.dart';
import 'widgets/function_item_widget.dart';
import 'widgets/listplaytwo_one_item_widget.dart';

class ProfilInitialPage extends StatefulWidget {
  const ProfilInitialPage({Key? key}) : super(key: key);

  @override
  ProfilInitialPageState createState() => ProfilInitialPageState();

  static Widget builder(BuildContext context) {
    return BlocProvider<ProfilBloc>(
      create: (context) => ProfilBloc(
        ProfilState(profilInitialModelObj: ProfilInitialModel()),
      )..add(ProfilInitialEvent()),
      child: ProfilInitialPage(),
    );
  }
}

class ProfilInitialPageState extends State<ProfilInitialPage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return SingleChildScrollView(
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(top: 38.h),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageConstant.imgGroup106),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            _buildStackviewone(context),
            SizedBox(height: 20.h),
            Container(
              width: double.maxFinite,
              margin: EdgeInsets.symmetric(horizontal: 46.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "lbl_son_s_r_lerim".tr,
                      style: theme.textTheme.headlineSmall,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  _buildListplaytwoone(context),
                ],
              ),
            ),
            SizedBox(height: 774.h),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildStackviewone(BuildContext context) {
    return Container(
      height: 336.h,
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 8.h, right: 2.h),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [

          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.only(left: 36.h, right: 66.h),
              child: BlocSelector<ProfilBloc, ProfilState, ProfilInitialModel?>(
                selector: (state) => state.profilInitialModelObj,
                builder: (context, profilInitialModelObj) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      direction: Axis.horizontal,
                      spacing: 38.h,
                      children: List.generate(
                        profilInitialModelObj?.functionItemList.length ?? 0,
                            (index) {
                          FunctionItemModel model =
                              profilInitialModelObj?.functionItemList[index] ??
                                  FunctionItemModel();
                          return FunctionItemWidget(model);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(bottom: 66.h),
            padding: EdgeInsets.all(42.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusStyle.roundedBorder8,
              gradient: LinearGradient(
                begin: Alignment(0, 0),
                end: Alignment(0, 1),
                colors: [
                  theme.colorScheme.onErrorContainer.withOpacity(0),
                  theme.colorScheme.onErrorContainer,
                ],
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 8.h),
                Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.only(right: 10.h),
                  padding: EdgeInsets.symmetric(horizontal: 52.h),
                  child: Column(
                    children: [
                      Text(
                        "lbl_faruk_alpay".tr,
                        style: theme.textTheme.titleLarge,
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.only(right: 4.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "lbl_54".tr,
                                    style: theme.textTheme.titleSmall,
                                  ),
                                  TextSpan(
                                    text: "lbl_ta_ma".tr,
                                    style: theme.textTheme.bodySmall,
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "lbl_24".tr,
                                    style: theme.textTheme.titleSmall,
                                  ),
                                  TextSpan(
                                    text: "lbl_yorum".tr,
                                    style: theme.textTheme.bodySmall,
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "lbl_4_5".tr,
                                    style: theme.textTheme.titleSmall,
                                  ),
                                  TextSpan(
                                    text: "lbl_puan".tr,
                                    style: theme.textTheme.bodySmall,
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 64.h,
                    width: 64.h,
                    margin: EdgeInsets.only(top: 94.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusStyle.circleBorder32,
                      border: Border.all(
                        color: appTheme.indigoA70019,
                        width: 3.h,
                        strokeAlign: BorderSide.strokeAlignOutside,
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgImg20240812Wa0073,
                          height: 64.h,
                          width: 64.h,
                          radius: BorderRadius.circular(32.h),
                          alignment: Alignment.center,
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 32.h,
                            width: double.maxFinite,
                            color: appTheme.indigoA70019,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Listview Widgets
  Widget _buildListplaytwoone(BuildContext context) {
    return BlocSelector<ProfilBloc, ProfilState, ProfilInitialModel?>(
      selector: (state) => state.profilInitialModelObj,
      builder: (context, profilInitialModelObj) {
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: profilInitialModelObj?.listplaytwoOneItemList.length ?? 0,
          itemBuilder: (context, index) {
            ListplaytwoOneItemModel model =
                profilInitialModelObj?.listplaytwoOneItemList[index] ??
                    ListplaytwoOneItemModel();
            return ListplaytwoOneItemWidget(model);
          },
        );
      },
    );
  }
}
