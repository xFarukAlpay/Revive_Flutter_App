import 'package:flutter/material.dart';
import 'presentation/ilan_ver/ilan_ver_screen.dart';

class list {
  static void onTapList(BuildContext context) { // Statik metod
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.centerLeft,
          child: Material(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Menü Başlığı
                    DrawerHeader(
                      decoration: BoxDecoration(color: Colors.blue),
                      child: Center(
                        child: Text(
                          "Menü",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                    ),
                    // Menü Öğeleri
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text("Anasayfa"),
                      onTap: () => Navigator.pop(context),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text("Profil"),
                      onTap: () => Navigator.pop(context),
                    ),
                    ListTile(
                      leading: Icon(Icons.list),
                      title: Text("İlanlar"),
                      onTap: () => Navigator.pop(context),
                    ),
                    ListTile(
                      leading: Icon(Icons.add_circle),
                      title: Text("İlan Ver"),
                      onTap: () {
                        Navigator.pop(context); // Menü kapansın
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => IlanVerScreen(), // Yönlendirilen sayfa
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.favorite),
                      title: Text("Favorilerim"),
                      onTap: () => Navigator.pop(context),
                    ),
                    ListTile(
                      leading: Icon(Icons.notifications),
                      title: Text("Bildirimler"),
                      onTap: () => Navigator.pop(context),
                    ),
                    ListTile(
                      leading: Icon(Icons.message),
                      title: Text("Mesajlar"),
                      onTap: () => Navigator.pop(context),
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text("Ayarlar"),
                      onTap: () => Navigator.pop(context),
                    ),
                    ListTile(
                      leading: Icon(Icons.help),
                      title: Text("Yardım ve Destek"),
                      onTap: () => Navigator.pop(context),
                    ),
                    ListTile(
                      leading: Icon(Icons.logout),
                      title: Text("Çıkış Yap"),
                      onTap: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}