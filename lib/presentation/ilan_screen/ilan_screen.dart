import 'package:flutter/material.dart';
import 'package:tirloj/presentation/ilan_ver/ilan_ver_screen.dart';
import '../../core/app_export.dart';
import '../../main.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_search_view.dart';
import 'bloc/ilan_bloc.dart';
import 'models/filtertags_item_model.dart';
import 'models/ilan_model.dart';
import 'models/listings_item_model.dart';
import 'widgets/filtertags_item_widget.dart';
import 'widgets/listings_item_widget.dart';
import 'package:tirloj/list.dart';

class IlanScreen extends StatelessWidget {
  IlanScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<IlanBloc>(
      create: (context) =>
      IlanBloc(IlanState(ilanModelObj: IlanModel()))
        ..add(IlanInitialEvent()),
      child: IlanScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            color: theme.colorScheme.onErrorContainer,
            border: Border.all(
              color: appTheme.black90001,
              width: 1.h,
            ),
            image: DecorationImage(
              image: AssetImage(ImageConstant.imgSignupEkran),
              fit: BoxFit.fill,
            ),
          ),
          child: Container(
            margin: EdgeInsets.only(top: 48.h),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.h),
                  child: BlocSelector<IlanBloc,
                      IlanState,
                      TextEditingController?>(
                    selector: (state) => state.searchController,
                    builder: (context, searchController) {
                      return CustomSearchView(
                        controller: searchController,
                        hintText: "lbl_t_m_lanlar".tr,
                        contentPadding: EdgeInsets.fromLTRB(34.h, 12.h, 16.h, 12
                            .h),
                        borderDecoration: SearchViewStyleHelper
                            .fillOnErrorContainer,
                        fillColor: theme.colorScheme.onErrorContainer,
                      );
                    },
                  ),
                ),
                SizedBox(height: 14.h),
                _buildFilterTags(context),
                SizedBox(height: 28.h),
                _buildListings(context),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
          width: double.maxFinite,
          child: _buildBottomNavigation(context),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 40.h,
      leading: AppbarLeadImage(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(left: 16.h),
        onTap: () {
          onTapArrowleftone(context);
        },
      ),
      title: Padding(
        padding: EdgeInsets.only(left: 8.h),
        child: Row(
          children: [
            Container(
              height: 30.h,
              width: 31.h,
              margin: EdgeInsets.only(top: 1.h),
              child: Stack(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgList,
                    height: 24.h,
                    width: 24.h,
                    margin: EdgeInsets.only(top: 6.h, right: 7.h),
                    onTap: () {
                      list.onTapList(context); // Statik metod çağrılıyor
                    },
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 13.h, bottom: 18.h),
                      padding: EdgeInsets.symmetric(horizontal: 6.h),
                      decoration: BoxDecoration(
                        color: appTheme.red700,
                        borderRadius: BorderRadius.circular(6.h),
                      ),
                      child: Text(
                        "lbl_5".tr,
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.bodySmallOnErrorContainer,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AppbarTitle(
              text: "lbl_lanlar".tr,
              margin: EdgeInsets.only(left: 105.h, bottom: 5.h),
            ),
          ],
        ),
      ),
      actions: [
        AppbarTrailingImage(imagePath: ImageConstant.imgTime),
        AppbarTrailingImage(
          imagePath: ImageConstant.imgShare,
          margin: EdgeInsets.only(left: 8.h, right: 15.h),
        ),
      ],
      styleType: Style.bgFill,
    );
  }

  Widget _buildFilterTags(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 10.h, right: 10.h),
      child: BlocSelector<IlanBloc, IlanState, IlanModel?>(
        selector: (state) => state.ilanModelObj,
        builder: (context, ilanModelObj) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List<Widget>.generate(
              ilanModelObj?.filtertagsItemList.length ?? 0,
                  (index) {
                if (index >= 4) return Container();

                FiltertagsItemModel model = ilanModelObj
                    ?.filtertagsItemList[index] ?? FiltertagsItemModel();
                if (index == 0) {
                  model = model.copyWith(tagFour: "Filtrele");
                } else if (index == 1) {
                  model = model.copyWith(tagFour: "Sıralama Ölçütü");
                } else if (index == 2) {
                  model = model.copyWith(tagFour: "Görünüm");
                } else if (index == 3) {
                  model = model.copyWith(tagFour: "Bildirim Oluştur");
                }

                return Expanded(
                  child: FiltertagsItemWidget(
                    model,
                    onSelectedChipView: (value) {
                      if (index == 0) {
                        _showFilterPopup(context); // Filtrele popup açılır
                      }
                      context.read<IlanBloc>().add(UpdateChipViewEvent(
                          index: index, isSelected: value));
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _showFilterPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 850.h, // Popup boyutu
          padding: EdgeInsets.all(26.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.h)),
          ),
          child: SingleChildScrollView( // Scroll eklemek için
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionHeader(context, "Taşıma Türü"),
                _buildFilterOption(
                    context, ["Açık Kasa", "Kapalı Kasa", "Soğutuculu Kasa"]),
                Divider(thickness: 1, color: Colors.grey[300]), // Çizgi eklendi

                _buildSectionHeader(context, "Yük Türü"),
                _buildFilterOption(context, ["Gıda", "Mobilya", "Elektronik"]),
                Divider(thickness: 1, color: Colors.grey[300]),

                _buildSectionHeader(context, "Yük Durumu"),
                _buildFilterOption(context, ["Paketli", "Paletli", "Dökme"]),
                Divider(thickness: 1, color: Colors.grey[300]),

                _buildSectionHeader(context, "Güzergah - Başlangıç"),
                _buildCitySelector(context, "Güzergah - Başlangıç"),
                Divider(thickness: 1, color: Colors.grey[300]),

                _buildSectionHeader(context, "Güzergah - Bitiş"),
                _buildCitySelector(context, "Güzergah - Bitiş"),
                Divider(thickness: 1, color: Colors.grey[300]),

                _buildSectionHeader(context, "Yük Ağırlığı"),
                _buildSliderOption(context, 0, 10000),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18.h,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }


  Widget _buildFilterOption(BuildContext context, List<String> options) {
    return Wrap(
      spacing: 8.h, // Elemanlar arasındaki yatay boşluk
      runSpacing: 8.h, // Satırlar arasındaki dikey boşluk
      children: options.map((option) {
        return TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.h),
            backgroundColor: Colors.grey[200],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.h)),
          ),
          onPressed: () {},
          child: Text(
              option, style: TextStyle(fontSize: 16.h, color: Colors.black)),
        );
      }).toList(),
    );
  }


  Widget _buildCitySelector(BuildContext context, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: title,
          contentPadding: EdgeInsets.symmetric(
              horizontal: 16.h, vertical: 12.h),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.h)),
        ),
        items: _getCityList().map((city) =>
            DropdownMenuItem(value: city, child: Text(city))).toList(),
        onChanged: (value) {},
      ),
    );
  }

  List<String> _getCityList() {
    return [
      "Adana",
      "Adıyaman",
      "Afyonkarahisar",
      "Ağrı",
      "Aksaray",
      "Amasya",
      "Ankara",
      "Antalya",
      "Ardahan",
      "Artvin",
      "Aydın",
      "Balıkesir",
      "Bartın",
      "Batman",
      "Bayburt",
      "Bilecik",
      "Bingöl",
      "Bitlis",
      "Bolu",
      "Burdur",
      "Bursa",
      "Çanakkale",
      "Çankırı",
      "Çorum",
      "Denizli",
      "Diyarbakır",
      "Düzce",
      "Edirne",
      "Elazığ",
      "Erzincan",
      "Erzurum",
      "Eskişehir",
      "Gaziantep",
      "Giresun",
      "Gümüşhane",
      "Hakkari",
      "Hatay",
      "Iğdır",
      "Isparta",
      "İstanbul",
      "İzmir",
      "Kahramanmaraş",
      "Karabük",
      "Karaman",
      "Kars",
      "Kastamonu",
      "Kayseri",
      "Kırıkkale",
      "Kırklareli",
      "Kırşehir",
      "Kilis",
      "Kocaeli",
      "Konya",
      "Kütahya",
      "Malatya",
      "Manisa",
      "Mardin",
      "Mersin",
      "Muğla",
      "Muş",
      "Nevşehir",
      "Niğde",
      "Ordu",
      "Osmaniye",
      "Rize",
      "Sakarya",
      "Samsun",
      "Siirt",
      "Sinop",
      "Sivas",
      "Şanlıurfa",
      "Şırnak",
      "Tekirdağ",
      "Tokat",
      "Trabzon",
      "Tunceli",
      "Uşak",
      "Van",
      "Yalova",
      "Yozgat",
      "Zonguldak"
    ];
  }

  Widget _buildSliderOption(BuildContext context, double min, double max) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Yük Ağırlığı (kg)",
            style: TextStyle(fontSize: 16.h),
          ),
          Slider(
            value: 5000,
            min: min,
            max: max,
            divisions: 20,
            label: "5000 kg",
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }

  Widget _buildListings(BuildContext context) {
    return Expanded(
      child: BlocSelector<IlanBloc, IlanState, IlanModel?>(
        selector: (state) => state.ilanModelObj,
        builder: (context, ilanModelObj) {
          return ListView.separated(
            padding: EdgeInsets.zero,
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) => SizedBox(height: 6.h),
            itemCount: ilanModelObj?.listingsItemList.length ?? 0,
            itemBuilder: (context, index) {
              ListingsItemModel model = ilanModelObj?.listingsItemList[index] ??
                  ListingsItemModel();
              return ListingsItemWidget(model);
            },
          );
        },
      ),
    );
  }

  Widget _buildBottomNavigation(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: CustomBottomBar(
        onChanged: (BottomBarEnum type) {
          Navigator.pushNamed(
            navigatorKey.currentContext!,
            getCurrentRoute(type),
          );
        },
      ),
    );
  }

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Anasayfa:
        return AppRoutes.ProfilInitialPage;
      case BottomBarEnum.Lanlar:
        return "/";
      case BottomBarEnum.Profile:
        return "/";
      case BottomBarEnum.Sohbetler:
        return "/";
      default:
        return "/";
    }
  }

  void onTapArrowleftone(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => IlanVerScreen()),
    );
  }

}