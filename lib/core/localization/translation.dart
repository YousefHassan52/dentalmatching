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
          '- English': "- الانجليزية",
          '- Arabic': "- العربية",
          "PayPal": "PayPal",
          "PayMob": "PayMob",
          "Cancel": "إلغاء",
          "Delete Account": "حذف الحساب",
          "Edit Profile Info": "تعديل البيانات ",
          'Edit Profile        ': "تعديل البيانات     ",
          'Pay': "الدفع",
          'Log out': "الخروج",
          'Case': "حالة",
          "Update": 'تحديث',
          "Are you sure you want to delete your Acoount?":"هل انت متأكد انك تريد حذف حسابك؟",
          'Alert':'انتبه',

          //MyCases
          'Recently Added Cases': "الحالات المضافة مؤخرًا",
          //AddCase
          'Describe what you feel': "صف ما تشعر به",
          'Chronic Diseases': 'الأمراض المزمنة',
          'Add a Clear Pictures of your Mouth': "أضف صورًا واضحة لفمك",
          'Upload Pictures': 'تحميل الصور',
          'Add X-Ray': 'أضف اشعة',
          'Add Prescription': "إضافة روشتة",
          'Do you know your case ?': 'هل تعرف حالتك ؟',
          'Submit': 'اضافة',
          ' (Optional)': ' (اختياري)',
          'Type here...': 'أكتب هنا...',
          '*': '*',
          'select at least 2 pictures': "اختر صورتين على الأقل",
          'Heart Disease': 'مرض القلب',
          'Diabetes': 'السكر',
          'Blood Pressure': 'ضغط الدم',
          'Cardiovascular': 'القلب والأوعية الدموية',
          'Cancer': 'السرطان',
          'None': 'لا شيء',
          'Gumboil': 'تقرح اللثة',
          'Gingivitis': 'التهاب اللثة',
          'Edentulous': 'فاقد الأسنان',
          'Displaced tooth': 'تحرك السن',
          'Dental abscess': 'خراج الأسنان',
          'Orthodontics': 'تقويم الأسنان',
          'Caries': 'تسوس الأسنان',
          'Endodontics': 'علاج الجذور',
          'Prosthodontic': 'علاج الأسنان الاصطناعية',
          'Implantology': 'زراعة الأسنان',
          'Dental Cases': "حالات الأسنان",
          'Known': 'اعلم',
          'Unknown': 'لا اعلم',
          "Success ":"نجحت",
          "Your Case Posted Successfully":"تم اضفة الحالة بنجاح",
          "Your description must be more than 20 letters":"يجب أن يكون الوصف الخاص بك أكثر من 20 حرفًا",
          'Please select at least one item in the checklist.':"الرجاء تحديد عنصر واحد على الأقل في القائمة .",
          'Please select your case.':"الرجاء تحديد حالتك.",
          'Maximum Number of X_ray Images is 2':"الحد الأقصى لعدد صور الأشعة هو 2",
          'Maximum Number of Prescription Images is 2':"الحد الأقصى لعدد صور الروشتة هو 2",
          'Please select more than 2 images for your mouth.':"يرجى اختيار أكثر من صورتين لفمك.",

          //whole case
          'Case Detailes        ': "تفاصيل الحالة     ",
          "Edit": 'تعديل',
          "Delete": 'حذف',
          'Pictures of your Mouth': 'صور لفمك',
          'X-Ray Images': 'صور الأشعة',
          'Prescription Images': 'صور الروشتة',

          //Assigned Case Patient
          'Dr.':"د.",
          'Location :':"المكان :",
          'Phone Number :':'رقم الهاتف :',

          //EditPatient
          'Edit Case        ':"تعديل الحالة     ",


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
          "PayMob": "PayMob",
          "Delete": "Delete",
          "Cancel": "Cancel",
          "Delete Account": "Delete Account",
          "Edit Profile Info": "Edit Profile Info",
          '- English': '- English',
          '- Arabic': "- Arabic",
          'Alert':'Alert',
          "Are you sure you want to delete your Acoount?":"Are you sure you want to delete your Acoount?",
         
          //All Cases
          'Recently Added Cases': 'Recently Added Cases',
          //Add Case
          "Your description must be more than 20 letters":"Your description must be more than 20 letters",
          "Your Case Posted Successfully":"Your Case Posted Successfully",
          "Success ":"Success ",
          'Maximum Number of Prescription Images is 2':'Maximum Number of Prescription Images is 2',
          'Maximum Number of X_ray Images is 2':'Maximum Number of X_ray Images is 2',
          'Please select more than 2 images for your mouth.':'Please select more than 2 images for your mouth.',
          'Please select your case.':'Please select your case.',
          'Describe what you feel': 'Describe what you feel',
          'Chronic Diseases': 'Chronic Diseases',
          'Add a Clear Pictures of your Mouth':
              'Add a Clear Pictures of your Mouth',
          'Upload Pictures': 'Upload Pictures',
          'Add X-Ray': 'Add X-Ray',
          'Add Prescription': 'Add Prescription',
          'Do you know your case ?': 'Do you know your case ?',
          'Submit': 'Submit',
          ' (Optional)': ' (Optional)',
          '*': '*',
          'select at least 2 pictures': 'select at least 2 pictures',
          'Heart Disease': 'Heart Disease',
          'Diabetes': 'Diabetes',
          'Blood Pressure': 'Blood Pressure',
          'Cardiovascular': 'Cardiovascular',
          'Cancer': 'Cancer',
          'None': 'None',
          'Gumboil': 'Gumboil',
          'Gingivitis': 'Gingivitis',
          'Edentulous': 'Edentulous',
          'Displaced tooth': 'Displaced tooth',
          'Dental abscess': 'Dental abscess',
          'Orthodontics': 'Orthodontics',
          'Caries': 'Caries',
          'Endodontics': 'Endodontics',
          'Prosthodontic': 'Prosthodontic',
          'Implantology': 'Implantology',
          'Dental Cases': 'Dental Cases',
          'Known': 'Known',
          'Unknown': 'Unknown',
          "Update": "Update",

          'Please select at least one item in the checklist.':'Please select at least one item in the checklist.',

          //whole Case
          "Edit": "Edit",
          'Case Detailes        ': 'Case Detailes        ',
          'Pictures of your Mouth': 'Pictures of your Mouth',
          'X-Ray Images': 'X-Ray Images',
          'Prescription Images': 'Prescription Images',

          //Assigned Case Patient
          'Dr.': 'Dr.',
          'Location :':'Location :',

          //edit case patient
          'Edit Case        ':'Edit Case        ',
        },
      };
}
// هدفنا