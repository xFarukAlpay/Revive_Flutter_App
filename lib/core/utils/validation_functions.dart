// Bu fonksiyon, bir e-posta adresinin geçerli olup olmadığını kontrol etmek için kullanılır.
// `isRequired` parametresi ile girdi zorunlu olup olmadığı belirlenir.
// Eğer girdi zorunlu değilse ve boş veya null ise geçerli kabul edilir.
// Aksi takdirde e-posta formatına uygun olup olmadığı kontrol edilir.

bool isValidEmail(String? inputString, {bool isRequired = false}) {
  // Girdi geçerlilik durumu başlangıçta yanlış olarak kabul ediliyor.
  bool isInputStringValid = false;

  // Eğer `isRequired` false ise ve inputString boş veya null ise geçerli kabul edilir.
  if (!isRequired && (inputString == null || inputString.isEmpty)) {
    isInputStringValid = true;
  }

  // inputString null değilse ve boş değilse e-posta formatını kontrol eder.
  if (inputString != null && inputString.isNotEmpty) {
    // E-posta formatı için desen (pattern) tanımı.
    const pattern = r'^(?!\.)(""([^""\r\\]|\\[""\r\\])*""|'
        r'([-a-zA-Z0-9!#\$%&\\*\+/=\?\^_`{\|}~]+(\.[-a-zA-Z0-9!#\$%&\\*\+/=\?\^_`{\|}~]+)*)|""[^""\r\\]*"")'
        r'@([a-zA-Z0-9]([-a-zA-Z0-9]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9]([-a-zA-Z0-9]*[a-zA-Z0-9])?$';

    final regExp = RegExp(pattern);

    // inputString'in belirtilen desenle eşleşip eşleşmediğini kontrol eder.
    isInputStringValid = regExp.hasMatch(inputString);
  }

  // Sonuç olarak inputString'in geçerli olup olmadığını döndürür.
  return isInputStringValid;
}

// Yukarıdaki fonksiyon, e-posta adreslerinin doğru formatta olup olmadığını kontrol eder.
// Zorunlu olmayan girdilerde null veya boş değerler geçerli kabul edilir.
// Eğer girdi zorunlu ise e-posta formatı düzenli ifade (regex) ile doğrulanır.
