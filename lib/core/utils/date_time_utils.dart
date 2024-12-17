// Bu kod, tarih ve saatleri belirli bir formata göre biçimlendiren bir uzantıdır.
// DateTime sınıfına formatlama işlevi ekleyerek tarih ve saat değerlerini kolayca istenilen formata çevirir.
// İsteğe bağlı olarak dil ayarlarını da destekler.

import 'package:intl/date_symbol_data_local.dart'; // Yerel tarih formatlama verilerini yükler.
import 'package:intl/intl.dart'; // Tarih ve saat formatlaması için kullanılan paket.

// Tarih ve saat formatı için sabit bir desen tanımlanır.
const String dateTimeFormatPattern = 'dd/MM/yyyy'; // Gün/Ay/Yıl biçimi.

// DateTime sınıfına yeni özellikler ekleyen bir uzantı (extension).
extension DateTimeExtension on DateTime {
  // Tarih ve saati belirli bir formata ve isteğe bağlı olarak belirli bir dil ayarına göre biçimlendirir.
  String format({
    String pattern = dateTimeFormatPattern, // Varsayılan tarih formatı deseni.
    String? locale, // İsteğe bağlı dil ayarı.
  }) {
    // Eğer locale (dil ayarı) null değilse ve boş değilse, ilgili dil için tarih formatlama verilerini başlatır.
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale); // Belirtilen locale'ye göre tarih biçimlendirme verilerini başlatır.
    }

    // DateFormat sınıfını kullanarak tarih ve saati belirli bir formata göre biçimlendirir.
    return DateFormat(pattern, locale).format(this);
  }
}
