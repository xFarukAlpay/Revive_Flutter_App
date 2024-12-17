// Bu dosya, 'AppNavigationBloc' dosyasının bir parçası olup, uygulama navigasyonu için kullanılan olayları (events) tanımlar.
// Her bir olay, 'AppNavigationBloc' içinde tetiklenerek uygulamanın durumunu günceller.

part of 'app_navigation_bloc.dart';

// Tüm navigasyon olaylarının temel sınıfı.
// 'Equatable' sınıfından türetilmiştir, böylece olaylar kolayca karşılaştırılabilir.
class AppNavigationEvent extends Equatable {
  // 'props' metodu, olay sınıfının karşılaştırılması için gereken alanları içerir.
  // Şu an olaylar herhangi bir veri içermediği için boş bir liste döner.
  @override
  List<Object?> get props => [];
}

// Uygulama başlangıç olayı. Bu olay, uygulamanın başlatıldığını belirtir ve gerekli başlangıç işlemlerini tetikler.
class AppNavigationInitialEvent extends AppNavigationEvent {
  // Başlangıç olayı da herhangi bir veri içermediği için boş bir liste döner.
  @override
  List<Object?> get props => [];
}

// Bu yapı, 'AppNavigationBloc' sınıfında farklı olayların dinlenip yönetilmesini sağlar.
// Şu an sadece başlangıç olayı olan 'AppNavigationInitialEvent' tanımlanmıştır.
// İleride farklı olaylar eklenerek navigasyon mantığı genişletilebilir.
