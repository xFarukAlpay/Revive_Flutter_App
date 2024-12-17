// Bu sınıf, uygulamada hata ve log yönetimini sağlayan basit bir logger yapısıdır.
// Log seviyesine göre hata veya bilgi mesajlarını konsola yazdırır.

class Logger {
  // Varsayılan log modu debug olarak ayarlanır. Bu, geliştirme aşamasında detaylı loglama yapmayı sağlar.
  static LogMode _logMode = LogMode.debug;

  // Logger'ı belirli bir modda (debug veya live) başlatır.
  static void init(LogMode mode) {
    Logger._logMode = mode; // Log modunu ayarlamak için kullanılır.
  }

  // Loglama işlemini gerçekleştiren fonksiyon.
  // Loglanacak veri ve isteğe bağlı olarak yığın izi (stackTrace) alır.
  static void log(dynamic data, {StackTrace? stackTrace}) {
    if (_logMode == LogMode.debug) {
      // Sadece debug modundayken loglama yapılır. Veriler ve yığın izi konsola yazdırılır.
      print("Error: $data$stackTrace");
    }
  }
}

// Log modlarını tanımlayan enum.
// Debug modu, geliştirme sırasında logların detaylı bir şekilde gösterilmesini sağlar.
// Live modu, üretim aşamasında logların daha az detaylı olmasını sağlayabilir.
enum LogMode { debug, live }
