import 'package:get/get.dart';

class MyTranslation implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "1": "عربي",
          "First Title": "العنوان الاول",
          "Second Title": "العنوان الثاني",
          "third Title": "العنوان الثالث",
          "Fourth Title": "العنوان الرابع",
        },
        "en": {
          "1": "english",
          "First Title": "First Title",
          "Second Title": "Second Title",
          "third Title": "third Title",
          "Fourth Title": "Fourth Title",
        },
      };
}
