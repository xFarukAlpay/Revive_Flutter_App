// Bu dosya, 'AppNavigationBloc' dosyasının bir parçası olup, uygulamanın durumunu (state) tanımlar.
// 'AppNavigationState' sınıfı, navigasyonla ilgili durumu yönetir ve güncellemeleri sağlar.

part of 'app_navigation_bloc.dart';

// Tüm navigasyon durumlarının temel sınıfı.
// 'Equatable' sınıfından türetilmiştir, böylece durumlar kolayca karşılaştırılabilir.
class AppNavigationState extends Equatable {
  // Durumun başlangıç verilerini alır. 'appNavigationModelObj' parametresi isteğe bağlıdır.
  AppNavigationState({this.appNavigationModelObj}); // {} yerine () düzeltildi

  // Navigasyonla ilgili model objesi.
  AppNavigationModel? appNavigationModelObj;

  // Eşitlik karşılaştırmalarında kullanılan alanları belirler. Şu an sadece 'appNavigationModelObj' kontrol ediliyor.
  @override
  List<Object?> get props => [appNavigationModelObj]; // Fazladan ) kaldırıldı

  // Mevcut durumun bir kopyasını oluşturan fonksiyon.
  // Eğer yeni bir model objesi verilmezse, eski model objesi kullanılır.
  AppNavigationState copyWith({AppNavigationModel? appNavigationModelObj}) { // copyWidth yerine copyWith
    return AppNavigationState(
      appNavigationModelObj: appNavigationModelObj ?? this.appNavigationModelObj,
    );
  }
}

// Bu yapı, navigasyon durumunu yönetmek için kullanılır.
// 'copyWith' metodu, mevcut durumu bozmadan sadece bazı alanları değiştirmek için kullanılır.
// Bu, BLoC yapısında bir olay tetiklendiğinde durumu güncellemek için yaygın bir yöntemdir.
