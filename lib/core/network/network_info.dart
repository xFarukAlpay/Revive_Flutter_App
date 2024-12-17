// Bu kod, internet bağlantısını kontrol etmek, bağlantı türlerini yönetmek ve olası hataları ele almak için yazılmıştır.
// Connectivity Plus paketini kullanarak bağlantı durumunu yönetir, farklı hata ve istisna türlerini tanımlar ve
// bağlantı kesildiğinde bir uyarı mesajı görüntüler.

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:tirloj/main.dart'; // Bu varsayımsal bir import

// İnternet bağlantısını kontrol etmek için soyut sınıf.
// Bu sınıf, uygulamanın farklı yerlerinde internet bağlantısı kontrolü yapmak için bir arayüz sağlar.
abstract class NetworkInfoI {
  Future<bool> isConnected(); // Bağlantı olup olmadığını kontrol eder.
  Future<List<ConnectivityResult>> get connectivityResult; // Bağlantı türünü döner (Wi-Fi, mobil veri, yok vs.).
  Stream<List<ConnectivityResult>> get onConnectivityChanged; // Bağlantı değişikliklerini dinler.
}

// NetworkInfo sınıfı, ConnectivityPlus paketini kullanarak internet bağlantısını yönetir.
class NetworkInfo implements NetworkInfoI {
  Connectivity connectivity;

  // Singleton yapısını uygular. Bu sınıfın yalnızca bir örneği olmasını sağlar.
  static final NetworkInfo _networkInfo = NetworkInfo._internal(Connectivity());

  // Factory constructor, her çağrıldığında aynı örneği döner.
  factory NetworkInfo() {
    return _networkInfo;
  }

  // Internal constructor. Sadece içte kullanılır, bağlantı durumu izlemeyi başlatır.
  NetworkInfo._internal(this.connectivity) {
    connectivity = this.connectivity;
  }

  /// İnternet bağlantısını kontrol eder.
  /// Eğer bağlantı varsa [true], yoksa [false] döner.
  @override
  Future<bool> isConnected() async {
    final result = await connectivityResult; // Bağlantı durumunu alır.
    return !result.contains(ConnectivityResult.none); // Bağlantı yoksa false döner.
  }

  /// İnternet bağlantısının türünü kontrol eder.
  /// Wi-Fi, mobil veri veya bağlantı yok durumlarını döner.
  @override
  Future<List<ConnectivityResult>> get connectivityResult async {
    return connectivity.checkConnectivity(); // Anlık bağlantı türünü kontrol eder.
  }

  /// İnternet bağlantısı değişikliklerini dinler.
  /// Bağlantı durumu değiştiğinde bir akış (stream) döner.
  @override
  Stream<List<ConnectivityResult>> get onConnectivityChanged =>
      connectivity.onConnectivityChanged;
}

// Hata yönetimi için soyut bir hata sınıfı tanımlanır.
abstract class Failure {}

// Sunucu hatası sınıfı, sunucu ile ilgili sorunları tanımlar.
class ServerFailure extends Failure {}

// Cache hatası sınıfı, önbellek (cache) ile ilgili sorunları tanımlar.
class CacheFailure extends Failure {}

// Ağ hatası sınıfı, genel ağ hatalarını tanımlar.
class NetworkFailure extends Failure {}

// Sunucu ile ilgili istisnalar.
class ServerException implements Exception {}

// Önbellek ile ilgili istisnalar.
class CacheException implements Exception {}

// Ağ ile ilgili istisnalar.
class NetworkException implements Exception {}

// İnternet bağlantısı olmadığında fırlatılabilecek özel bir istisna.
// Bağlantı yoksa mesajla birlikte bir uyarı gösterir.
class NoInternetException implements Exception {
  late String _message;

  // Mesajı isteğe bağlı olarak alır ve internet bağlantısı yoksa hata mesajını gösterir.
  NoInternetException([String message = 'No Internet Connection']) {
    if (globalMessengerKey.currentState != null) {
      globalMessengerKey.currentState!.showSnackBar(
        SnackBar(content: Text(message)), // Uygulamada Snackbar ile mesaj gösterilir.
      );
    }
    this._message = message; // Mesajı ayarlar.
  }

  @override
  String toString() {
    return _message; // Mesajı döner.
  }
}
