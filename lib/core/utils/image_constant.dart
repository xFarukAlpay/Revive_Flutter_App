// Bu sınıf, uygulamadaki görsellerin sabit yollarını içerir.
// Bu sayede görsellere kolayca erişim sağlanır ve görsellerin dosya yolları merkezi bir yerden yönetilir.

class ImageConstant {
  // Görsel dosyalarının bulunduğu klasör yolu.
  static String imagePath = 'assets/images';

  // Giriş ekranı görselleri
  static String imgTruckWithWhit = '$imagePath/img_truck_with_whit.png'; // Beyaz arka planlı kamyon görseli.
  static String imgGroup59 = '$imagePath/img_group_59.png'; // Grup 59'a ait bir görsel.

  // Login (Giriş) ekranı görseli
  static String imgLoginEkran = '$imagePath/img_login_ekran.png'; // Giriş ekranı için kullanılan görsel.

  // Profil ekranı görselleri
  static String imgGroup106 = '$imagePath/img_group_106.png'; // Profil ekranındaki bir grup görseli.
  static String imgPlay2 = '$imagePath/img_play2.svg'; // Oynatma (play) simgesi.
  static String imgDownload = '$imagePath/img_download.svg'; // İndir simgesi.
  static String imgChat = '$imagePath/img_chat.svg'; // Sohbet simgesi.
  static String imgPurchased = '$imagePath/img_purchased.svg'; // Satın alınanlar simgesi.
  static String imgImg20240812Wa0073 = '$imagePath/img_img_20240812_wa0073.png'; // Bir tarihli özel görsel.
  static String imgSearch = '$imagePath/img_search.png'; // Arama simgesi.
  static String imgPlay2Onerrorcontainer = '$imagePath/img_play2_onerrorcontainer.svg'; // Oynatma hatası için simge.
  static String imgFavorite = '$imagePath/img_favorite.svg'; // Favoriler simgesi.
  static String imgHeartbeat = '$imagePath/img_heartbeat.svg'; // Kalp atışı simgesi.
  static String imgNavAnaSayfa = '$imagePath/img_nav_anasayfa.svg'; // Ana sayfa simgesi.
  static String imgNavProfile = '$imagePath/img_nav_profile.svg'; // Profil simgesi.

  // İlan ekranı görselleri
  static String imgArrowLeft = '$imagePath/img_arrow_left.png'; // Sol ok simgesi.
  static String imgTime = '$imagePath/img_time.png'; // Zaman simgesi.
  static String imgShare = '$imagePath/img_share.png'; // Paylaş simgesi.
  static String imgRewind = '$imagePath/img_rewind.png'; // Geri sar simgesi.
  static String imgDownload2 = '$imagePath/img_download_2.png'; // İkinci indirme simgesi.
  static String imgDownload1 = '$imagePath/img_download_1.png'; // Birinci indirme simgesi.

  // Yurt dışı sevkiyat hazırlama görseli
  static String imgYurtdisiSevkiyatHazirlama =
      '$imagePath/img_nav_img_yurtdisi_sevkiyat_hazirlama.png'; // Yurt dışı sevkiyat hazırlama görseli.

  // Navigasyon görselleri
  static String imgNavAnaSayfaIndigo_a700 =
      '$imagePath/img_nav_ana_sayfa_indigo_a700.svg'; // Indigo renkte ana sayfa simgesi.
  static String imgNavProfileBlack900 =
      '$imagePath/img_nav_profile_black_900.svg'; // Siyah renkte profil simgesi.

  // Diğer simgeler
  static String imgContrast = '$imagePath/img_contrast.svg'; // Kontrast ayarı simgesi.
  static String imgSignupEkran = '$imagePath/img_signup_ekran.png'; // Kayıt ekranı görseli.
  static String imgList = '$imagePath/img_list.svg'; // Liste simgesi.
  static String imgNavLanlar = '$imagePath/img_nav_lanlar.svg'; // Lanlar simgesi.
  static String imgNavSohbetler = '$imagePath/img_nav_sohbetler.svg'; // Sohbetler simgesi.
  static String imgNotFound = '$imagePath/img_not_found.svg'; // Görsel bulunamadığında gösterilecek simge.
}
