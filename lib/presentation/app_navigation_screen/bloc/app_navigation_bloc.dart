// Bu kod, Flutter uygulamasında BLoC (Business Logic Component) mimarisini kullanarak
// uygulama navigasyonunu yöneten bir sınıfı tanımlar.
// 'AppNavigationBloc' sınıfı, navigasyonla ilgili olayları dinler ve uygun durum değişikliklerini yönetir.

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/app_navigation_model.dart'; // Düzeltildi: Tek tırnak işareti kaldırıldı
part 'app_navigation_event.dart';
part 'app_navigation_state.dart';

// 'AppNavigationBloc' sınıfı, Bloc paketinden türetilmiştir ve navigasyon olaylarını ve durumlarını yönetir.
class AppNavigationBloc extends Bloc<AppNavigationEvent, AppNavigationState> { // Düzeltildi: Bloc sınıfının adı
  // Yapıcı (constructor) metodu, başlangıç durumunu alır ve üst sınıfa iletir.
  AppNavigationBloc(AppNavigationState initialState) : super(initialState) { // Düzeltildi: 'initialState' -> 'initialState'
    // 'AppNavigationInitialEvent' olayını dinler ve '_onInitialize' fonksiyonunu çağırır.
    on<AppNavigationInitialEvent>(_onInitialize); // Düzeltildi: 'Inıtal' -> 'Initial' ve '_onInitialize' -> '_onInitialize'
  }

  // '_onInitialize' fonksiyonu, başlangıç olayını ele alır ve gerekli işlemleri yapar.
  Future<void> _onInitialize(
      AppNavigationInitialEvent event,
      Emitter<AppNavigationState> emit, // Düzeltildi: 'AppNavigation State' -> 'AppNavigationState'
      ) async {
    // Buraya olayla ilgili kodlar gelecek
    // Örneğin, başlangıç durumunu emit edebilir veya gerekli verileri yükleyebilir.
  }
}

// Bu kod, uygulamanın navigasyon mantığını BLoC mimarisi ile yönetmeyi sağlar.
// Olaylar ve durumlar, ayrı dosyalarda tanımlanmıştır ('app_navigation_event.dart' ve 'app_navigation_state.dart').
// Bu yapı, kodun daha düzenli ve sürdürülebilir olmasını sağlar.
