import 'package:get/get.dart';

class MyTranslation implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "WELCOME": "مرحبا",
          "Settings": "اعدادات",
          "Add Case": "اضف حالة",
          "My Cases": "حالاتي",
          "Home": "الرئيسية",

          "1": "عربي",
          "First Title": "هدفنا",
          "Second Title": "كيف",
          "third Title": "ما نريد",
          "Fourth Title": "تجنب الاستغلال",

          // setting screen
          "Language": "اللغة",
          "PayPal": "بايبال",
          "Paymob": "Paymob",
          "Delete": "Delete",
          "Cancel": "Cancel",
          "Delete Account": "Delete Account",
          "Edit Profile Info": "Edit Profile Info",
        },
        "en": {
          "WELCOME": "WELCOME",
          "Settings": "Setting",
          "Add Case": "Add Case",
          "My Cases": "My Cases",
          "Home": "Home",
          "1": "English",
          "First Title": "Our Goal",
          "Second Title": "How",
          "third Title": "Our Aim",
          "Fourth Title": "Avoid Exploitation",
          // setting screen patient
          "Language": "Language",
          "PayPal": "PayPal",
          "Paymob": "Paymob",
          "Delete": "Delete",
          "Cancel": "Cancel",
          "Delete Account": "Delete Account",
          "Edit Profile Info": "Edit Profile Info",
        },
      };
}
// هدفنا