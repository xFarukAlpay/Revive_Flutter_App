import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Bloc yapısı kullanımı için gerekli.
import 'package:smooth_page_indicator/smooth_page_indicator.dart'; // Sayfa göstergesi için kullanılıyor.
import '../../core/app_export.dart'; // Proje içi genel dosya ve sabitleri içerir.
import '../../widgets/app_bar/appbar_subtitle.dart'; // Özel AppBar alt başlık widget'ı.
import '../../widgets/app_bar/appbar_title_image.dart'; // Özel AppBar başlık görseli widget'ı.
import '../../widgets/app_bar/custom_app_bar.dart'; // Özelleştirilmiş AppBar widget'ı.
import '../../widgets/custom_elevated_button.dart'; // Özelleştirilmiş yükseltilmiş buton.
import '../../widgets/custom_outlined_button.dart'; // Özelleştirilmiş çerçeveli buton.
import 'bloc/giri_ekran_bloc.dart'; // Giriş ekranı için kullanılan Bloc sınıfı.
import 'models/giri_ekran_model.dart'; // Giriş ekranı model sınıfı.

class GiriEkranScreen extends StatelessWidget {
  const GiriEkranScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<GiriEkranBloc>(
      create: (context) =>
      GiriEkranBloc(GiriEkranState(giriEkranModelObj: GiriEkranModel()))
        ..add(GiriEkranInitialEvent()),
      child: const GiriEkranScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GiriEkranBloc, GiriEkranState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Container(
              height: 882.h,
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  _buildMainContent(context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMainContent(BuildContext context) {
    final PageController _pageController = PageController(); // PageView kontrolcüsü

    return Container(
      height: 882.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _buildTruckSection(context),
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(top: 250.h),
            // 100px aşağı kaydırmak için margin ekledik
            padding: EdgeInsets.symmetric(
              horizontal: 50.h,
              vertical: 120.h,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  ImageConstant.imgGroup59,
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 32.h),
                Container(
                  child: Text(
                      "msg_ayd_nlojis_ile_daha".tr,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.titleLargeKalamBlack90001
                          .copyWith(
                        fontWeight: FontWeight.bold,
                      )
                  ),
                ),
                SizedBox(height: 2.h),
                Expanded(
                  child: Container(
                    // 100px aşağı kaydırmak için margin ekledik
                    child: PageView(
                      controller: _pageController,
                      children: [
                        Text(
                          "msg_her_zaman_g_venlidir".tr,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.titleLargeKarmaBlack90001,
                        ),
                        Text(
                          "msg_her_zaman_g_venlidir_2".tr,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.titleLargeKarmaBlack90001,
                        ),
                        Text(
                          "msg_her_zaman_g_venlidir_3".tr,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.titleLargeKarmaBlack90001,
                        ),
                        Text(
                          "msg_her_zaman_g_venlidir_4".tr,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.titleLargeKarmaBlack90001,
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 24.h),
                SizedBox(
                  height: 10.h,
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 4,
                    effect: ScrollingDotsEffect(
                      spacing: 11,
                      activeDotColor: appTheme.yellow800,
                      dotColor: appTheme.black90001.withOpacity(0.32),
                      dotHeight: 10.h,
                      dotWidth: 8.h,
                    ),
                  ),
                ),
                SizedBox(height: 42.h),
                CustomOutlinedButton(
                  text: "lbl_google".tr,
                  margin: EdgeInsets.only(
                    left: 10.h,
                    right: 6.h,
                  ),
                  leftIcon: Container(
                    margin: EdgeInsets.only(right: 4.h),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgContrast,
                      height: 12.h,
                      width: 12.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                CustomElevatedButton(
                  onPressed: () {
                    context.read<GiriEkranBloc>().add(GiriEkranLoginButtonPressed());
                  },
                  text: "lbl_giri_yap".tr,
                  margin: EdgeInsets.only(
                    left: 10.h,
                    right: 6.h,
                  ),
                ),
                SizedBox(height: 14.h),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "lbl_hesab_n_yok_mu".tr,
                        style: CustomTextStyles.bodyMediumBlack90001,
                      ),
                      TextSpan(text: " "),
                      TextSpan(
                        text: "lbl_kay_t".tr,
                        style: CustomTextStyles.bodyMediumPrimaryContainer,
    recognizer: TapGestureRecognizer()..onTap = () {
      // Tıklama olayını burada tanımlayın
      context.read<GiriEkranBloc>().add(GiriEkranSignupButtonPressed());

    },

    ),
                      TextSpan(text: " "),
                      TextSpan(
                        text: "lbl_ol".tr,
                        style: CustomTextStyles.bodyMediumBlack90001,
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
    );
  }

  Widget _buildTruckSection(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 396.h,
        // Ekranın yüksekliğine göre ayarlandığı için bu değer dinamik hale getirilebilir
        width: double.maxFinite,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgTruckWithWhit,
              height: (396.h * SizeUtils.height / FIGMA_DESIGN_HEIGHT),
              // Ekran yüksekliğine göre oranlanmış yükseklik
              width: (double.maxFinite * SizeUtils.width /
                  FIGMA_DESIGN_WIDTH), // Ekran genişliğine göre oranlanmış genişlik
            ),
            // Eğer başka içerikler eklemek istiyorsanız, buraya ekleyebilirsiniz.
          ],
        ),
      ),
    );
  }
}
