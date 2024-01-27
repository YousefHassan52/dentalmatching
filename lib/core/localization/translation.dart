import 'package:get/get.dart';

class MyTranslation implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "1": "عربي",
          "First Title": "هدفنا",
          "Second Title": "كيف",
          "third Title": "ما نريد",
          "Fourth Title": "تجنب الاستغلال",
        },
        "en": {
          "1": "English",
          "First Title": "Our Goal",
          "Second Title": "How",
          "third Title": "Our Aim",
          "Fourth Title": "Avoid Exploitation",
        },
      };
}
// هدفنا