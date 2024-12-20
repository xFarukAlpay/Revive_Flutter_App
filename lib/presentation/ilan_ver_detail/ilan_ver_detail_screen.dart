import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'bloc/ilan_ver_detail_bloc.dart';
import 'models/ilan_ver_detail_model.dart';
import 'package:tirloj/presentation/ilan_ver_picture/ilan_ver_picture_screen.dart';

class IlanVerDetailScreen extends StatelessWidget {
  const IlanVerDetailScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<IlanVerDetailBloc>(
      create: (context) => IlanVerDetailBloc(
        IlanVerDetailState(IlanVerDetailModelObj: IlanVerDetailModel()),
      )..add(IlanverDetailInitialEvent()),
      child: IlanVerDetailScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: IlanVerDetailBody(),
      ),
    );
  }
}

class IlanVerDetailBody extends StatefulWidget {
  @override
  _IlanVerDetailBodyState createState() => _IlanVerDetailBodyState();
}

class _IlanVerDetailBodyState extends State<IlanVerDetailBody> {
  String? selectedFiyat;
  String? selectedDurum;
  String? selectedSure;
  String? selectedKonum;
  String? urunBaslik;
  String? urunAciklama;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextFormField(
            title: "Telefon Numarası",
            hintText: "Telefon giriniz",
            onChanged: (value) => urunBaslik = value,
          ),
          _buildTextFormField(
            title: "Kurumsal Mail",
            hintText: "Mail giriniz",
            onChanged: (value) => urunAciklama = value,
          ),
          _buildDropdown(
            title: "Fiyat Bilgisi",
            items: ["0-50 TL", "50-100 TL", "100-200 TL", "200 TL ve üzeri"],
            value: selectedFiyat,
            onChanged: (value) => setState(() => selectedFiyat = value),
          ),
          _buildDropdown(
            title: "Ürün Durumu",
            items: ["Yeni", "Az Kullanılmış", "Kullanılmış"],
            value: selectedDurum,
            onChanged: (value) => setState(() => selectedDurum = value),
          ),
          _buildDropdown(
            title: "İlan Süresi",
            items: ["7 Gün", "15 Gün", "30 Gün"],
            value: selectedSure,
            onChanged: (value) => setState(() => selectedSure = value),
          ),
          _buildDropdown(
            title: "Konum",
            items: ["Kampüs A", "Kampüs B", "Kampüs C", "Diğer"],
            value: selectedKonum,
            onChanged: (value) => setState(() => selectedKonum = value),
          ),
          SizedBox(height: 24.0),
          _buildSubmitButton(context),
        ],
      ),
    );
  }

  Widget _buildTextFormField({
    required String title,
    required String hintText,
    required ValueChanged<String> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          TextFormField(
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown({
    required String title,
    required List<String> items,
    String? value,
    required ValueChanged<String?> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          DropdownButtonFormField<String>(
            value: value,
            items: items
                .map((item) => DropdownMenuItem(
              value: item,
              child: Text(item),
            ))
                .toList(),
            onChanged: onChanged,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return CustomElevatedButton(
      text: "Onayla",
      buttonStyle: CustomButtonStyles.fillBlue,
      onPressed: () {
        if (urunBaslik == null || urunBaslik!.isEmpty || urunAciklama == null || urunAciklama!.isEmpty) {
          // Alanlar boşsa hata mesajı
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Lütfen tüm alanları doldurunuz ve bir resim seçiniz!",
                style: TextStyle(color: Colors.red),
              ),
            ),
          );
        } else {
          // Tüm alanlar doluysa yönlendirme
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => IlanVerPictureScreen()),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Başlık: $urunBaslik\nAçıklama: $urunAciklama",
              ),
            ),
          );
        }
      },
    );
  }}
