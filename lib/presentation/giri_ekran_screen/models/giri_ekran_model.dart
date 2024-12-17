import 'package:equatable/equatable.dart'; // Equatable paketi, nesnelerin karşılaştırılabilmesini sağlar.

// Giriş ekranı ile ilgili verileri tutan model sınıfı.
class GiriEkranModel extends Equatable {
  GiriEkranModel();

  // Giriş ekranı modelinin kopyasını oluşturan metod.
  GiriEkranModel copyWith() {
    // Bu metod, mevcut modelin kopyasını döndürür. Şu anda yeni özellikler eklenmediği için birebir aynı kopyayı döndürüyor.
    return GiriEkranModel();
  }

  @override
  List<Object?> get props => [];
// Equatable sınıfı üzerinden, iki model nesnesinin karşılaştırılmasını sağlar. Şu anda karşılaştırılacak bir özellik olmadığından boş bir liste döndürüyor.
}
