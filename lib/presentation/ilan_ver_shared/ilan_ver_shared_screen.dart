import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import 'package:tirloj/presentation/ilan_ver_picture/ilan_ver_picture_screen.dart';

class IlanVerSharedScreen extends StatelessWidget {
  const IlanVerSharedScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return IlanVerSharedScreen();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: IlanVerSharedBody(),
      ),
    );
  }
}

class IlanVerSharedBody extends StatefulWidget {
  @override
  _IlanVerSharedBodyState createState() => _IlanVerSharedBodyState();
}

class _IlanVerSharedBodyState extends State<IlanVerSharedBody> {
  final String defaultFiyat = "500 TL";
  final String defaultDurum = "İkinci El";
  final String defaultSure = "30 Gün";
  final String defaultKonum = "İstanbul, Kadıköy";
  final String defaultBaslik = "Satılık Laptop";
  final String defaultAciklama = "Çok az kullanılmış, garantisi devam eden laptop.";
  final String defaultIletisim = "Telefon: 555 555 5555";

  int currentTabIndex = 0;
  int currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 300.0,
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    currentImageIndex = index;
                  });
                },
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Image.network(
                    'https://via.placeholder.com/300',
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            Positioned(
              left: 16.0,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () {
                  setState(() {
                    currentImageIndex = (currentImageIndex - 1) % 5;
                  });
                },
              ),
            ),
            Positioned(
              right: 16.0,
              child: IconButton(
                icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
                onPressed: () {
                  setState(() {
                    currentImageIndex = (currentImageIndex + 1) % 5;
                  });
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 8.0),
        Text(
          defaultBaslik,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16.0),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildTabButton("İlan Bilgileri", 0),
              _buildTabButton("İlan Detayları", 1),
              _buildTabButton("İletişim ve Konum", 2),
            ],
          ),
        ),
        SizedBox(height: 16.0),
        Expanded(
          child: IndexedStack(
            index: currentTabIndex,
            children: [
              _buildIlanBilgileriTab(),
              _buildIlanDetaylariTab(),
              _buildIletisimVeKonumTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTabButton(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentTabIndex = index;
        });
      },
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: currentTabIndex == index ? Colors.blue : Colors.grey,
            ),
          ),
          if (currentTabIndex == index)
            Container(
              margin: EdgeInsets.only(top: 4.0),
              height: 2.0,
              width: 50.0,
              color: Colors.blue,
            ),
        ],
      ),
    );
  }

  Widget _buildIlanBilgileriTab() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailRow("Fiyat", defaultFiyat, Icons.money),
          Divider(thickness: 1, color: Colors.grey),
          _buildDetailRow("Durum", defaultDurum, Icons.new_releases),
          Divider(thickness: 1, color: Colors.grey),
          _buildDetailRow("Süre", defaultSure, Icons.access_time),
          Divider(thickness: 1, color: Colors.grey),
          _buildDetailRow("Konum", defaultKonum, Icons.location_on),
        ],
      ),
    );
  }

  Widget _buildIlanDetaylariTab() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        defaultAciklama,
        style: TextStyle(fontSize: 18.0, color: Colors.black),
      ),
    );
  }

  Widget _buildIletisimVeKonumTab() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.phone, color: Colors.blue),
              SizedBox(width: 8.0),
              Text(
                defaultIletisim,
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            children: [
              Icon(Icons.location_on, color: Colors.blue),
              SizedBox(width: 8.0),
              Text(
                "Konum: ",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Text(
                  defaultKonum,
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String title, String content, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.blue),
              SizedBox(width: 8.0),
              Text(
                title,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Text(
            content,
            style: TextStyle(fontSize: 16.0, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
