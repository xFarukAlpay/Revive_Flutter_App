part of 'giri_ekran_bloc.dart'; // Bu dosyanın 'giri_ekran_bloc.dart' dosyasının bir parçası olduğunu belirtir.

// Giriş ekranının durumu için bir sınıf.
class GiriEkranState extends Equatable {
  GiriEkranState({this.giriEkranModelObj});
  // Giriş ekranıyla ilgili durumu temsil eden model objesi.

  GiriEkranModel? giriEkranModelObj; // Ekran durumu için model objesi.

  @override
  List<Object?> get props => [giriEkranModelObj];
  // Bu 'props', Equatable sınıfı tarafından kullanılarak, iki durumun karşılaştırılmasını sağlar.

  // Durumun yeni bir kopyasını oluşturmak için kullanılan metod.
  GiriEkranState copyWith({GiriEkranModel? giriEkranModelObj}) {
    return GiriEkranState(
      giriEkranModelObj: giriEkranModelObj ?? this.giriEkranModelObj,
      // Eğer yeni bir model objesi verilmemişse, var olan model objesini kullanır.
    );
  }
}
