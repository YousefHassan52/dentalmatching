import 'package:get/get.dart';

class MyTranslation implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          //forget pass
          "Password Reseted Successfully": "تم إعادة تعيين كلمة المرور بنجاح",
          "Wrong Verification Code": "رمز التحقق خاطئ",
          "Email Not Found": "البريد الإلكتروني غير موجود",
          "Try Again": 'قم بإعادة المحاولة',
          "Verification Code is Expired": "رمز التحقق منتهي الصلاحية",
          "Please Enter Your New Password": "الرجاء إدخال كلمة المرور الجديدة",
          "Verify Your Email": "تأكيد بريدك الألكتروني",
          "Please enter the code sent to ":
              "الرجاء إدخال رمز التاكيد المرسل الي",
          "Forget Password": "نسيت كلمة المرور",
          "Please Enter Your Email Address To Receive a Verification Code ":
              "الرجاء إدخال عنوان بريدك الإلكتروني لتلقي رمز التحقق",
          "Send": 'إرسال',
          "Reset Password": "إعادة تعيين كلمة المرور",
          "Password": "كلمة المرور",
          "Confirm": "تأكيد",
          "Confirm Password": "تأكيد كلمة المرور",
          //search
          "Write a Keyword to Search": "اكتب كلمة رئيسية للبحث عنها",
          //login
          "Invalid Phone Number": "رقم الهاتف غير صالح",
          "Invalid Password": "كلمة السر غير صالحة",
          "Please Wait for Identity Verification":
              "الرجاء انتظار التحقق من الهوية",
          "Incorrect Phone Number or Password":
              " رقم الهاتف أو كلمة المرور غير صحيحة",
          // signup
          "Identity Verification In Progress": "جاري التحقق من الهوية",
          "Password Doesn't Match ": "كلمة المرور غير متطابقة",
          "Invalid Username": "اسم المستخدم غير صالح",
          "Invalid Email Address": "عنوان البريد الإلكتروني غير صالح",
          "Personal Info": "بياناتك",
          "Signup": "انشاء حساب",
          "Email Address": "بريد الكتروني",
          "University": "الجامعة",
          "Age": "السن",
          "Full Name": "الاسم",
          "Governorate": "المحافظة",
          "Gender": "النوع",
          "Address": "العنوان",

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
          "Are you sure you want to delete your Acoount?":
              "هل انت متأكد انك تريد حذف حسابك؟",
          'Alert': 'انتبه',

          //MyCases
          'Recently Added Cases': "الحالات المضافة مؤخرًا",
          //AddCase
          "Your description must be more than 20 letters":
              "يجب أن يكون الوصف الخاص بك أكثر من 20 حرفًا",
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
          "Success ": "نجحت",
          "Your Case Posted Successfully": "تم اضافة الحالة بنجاح",
          'Please select at least one item in the checklist.':
              "الرجاء تحديد عنصر واحد على الأقل في قائمة الأمراض المزمنة .",
          'Please select your case.': "الرجاء تحديد حالتك.",
          'Maximum Number of X_ray Images is 2':
              "الحد الأقصى لعدد صور الأشعة هو 2",
          'Maximum Number of Prescription Images is 2':
              "الحد الأقصى لعدد صور الروشتة هو 2",
          'Please select more than 2 images for your mouth.':
              "يرجى اختيار أكثر من صورتين لفمك.",

          //whole case
          'Case Detailes        ': "تفاصيل الحالة     ",
          "Edit": 'تعديل',
          "Delete": 'حذف',
          'Pictures of your Mouth': 'صور لفمك',
          'X-Ray Images': 'صور الأشعة',
          'Prescription Images': 'صور الروشتة',

          //Assigned Case Patient

          'Dr.': "د.",
          'Location :': "المكان :",
          'Phone Number :': 'رقم الهاتف :',
          "You Must Paste a Valid Google Map Link of Hospital":
              "يجب عليك لصق رابط لخريطة جوجل للمستشفى",

          //EditPatient
          'Edit Case        ': "تعديل الحالة     ",
          // delete case
          "Your case has been deleted Successfully": "تم حذف حالتك بنجاح",
          "Deleted Successfully": "تم الحذف",
          //login
          'Welcome Back': "مرحبًا بعودتك",
          "Phone": "رقم الهاتف",
          'Forget Password?': "هل نسيت كلمة المرور؟",
          "Login": 'الدخول',
          "Don't have an account?": "ليس لديك حساب؟",
          "Sign up": 'اشتراك',

          //presignup
          "D O C T O R  ": " دكتور",
          "P A T I E N T": 'مريض',

          //Home
          "Search": 'بحث',

          //search
          'Search Screen     ': "ابحث     ",

          //requested cases
          'Requested Cases': "  حالاتك  ",
          //all cases
          'All Cases       ': 'جميع الحالات     ',
          'General Cases': 'حالات العامة',
          'Categories': 'فئات',
          'See All': 'المزيد',
          'Description': 'وصف االحالة',
          'Pictures Of Mouth': 'صور الفم',
          'X-Ray': 'الاشعة',
          'Prescription': 'الروشتة',
          'Dental Diseases': 'الحالة االطبي',
          "Patient Details       ": 'تفاصيل الحالة       ',
          'Request': 'طلب',
          'Appointments        ': 'مواعيد        ',

          //deelet account
          "Your Account has been Deleted Successfully": "تم حذف حسابك بنجاح",
          //connection
          "Internet Connection Error Refresh Data":
              "خطأ في اتصال الإنترنت أثناء تحديث البيانات",

          //Assigned Dr Case
          'Date : ': 'التاريخ : ',
          'Time : ': 'الوقت : ',
          'Case Status': 'وضع حالة ',
          'Phone Number': 'رقم الهاتف',
          "After Request": 'بعد طلب الحالة',

          //Appointment Screen
          "Success": 'نجحت',
          "Case is Already Requested by Another Doctor":
              "الحالة مُطلَبة بالفعل من طبيب آخر",
          "You are not Responsible for This Case":
              "أنت لست مسؤولاً عن هذه الحالة",
          "Case Cancelled": "تم إلغاء الحالة",
          "Case is Already NOT Assigned to you":
              "الحالة غير مُخصَّصة لك بالفعل",
          "Cancel Case": "إلغاء الحالة",
          "Are you Sure you Want to Cancel this Request?":
              "هل أنت متأكد أنك تريد إلغاء هذا الطلب؟",
          "Warning": "تحذير",
          "Now you are Responsible with This Case":
              "الآن أنت مسؤول عن هذه الحالة",
          'Selected Date: ': " التاريخ المحدد : ",
          'Selected Time: ': " الوقت المحدد : ",
          'Select Time': 'حدد الوقت',
          'Select Date': 'حدد التاريخ',
          'Appointment': 'تحديد الموعد',
          "Google Maps": 'خريطة جوجل',
          'Book Appointment': ' حجز الموعد',
          "Paste your hospital link into Google Map":
              "الصق رابط المستشفى من خريطة جوجل",
        },
        "en": {
          //coonection
          "Internet Connection Error Refresh Data":
              "Internet Connection Error Refresh Data",
          //deelet account
          "Your Account has been Deleted Successfully":
              "Your Account has been Deleted Successfully",
          //forge pass
          "Password Reseted Successfully": "Password Reseted Successfully",
          "Wrong Verification Code": "Wrong Verification Code",
          "Try Again": "Try Again",
          "Email Not Found": "Email Not Found",
          "Verification Code is Expired": "Verification Code is Expired",
          "Confirm Password": "Confirm Password",
          "Confirm": "Confirm",
          "Password": "Password",
          "Please Enter Your New Password": "Please Enter Your New Password",
          "Please enter the code sent to ": "Please enter the code sent to ",
          "Verify Your Email": "Verify Your Email",
          "Reset Password": "Reset Password",
          "Send": "Send",
          "Forget Password": "Forget Password",
          "Please Enter Your Email Address To Receive a Verification Code ":
              "Please Enter Your Email Address To Receive a Verification Code ",
          // signup
          "Identity Verification In Progress":
              "Identity Verification In Progress",
          "Password Doesn't Match ": "Password Doesn't Match ",
          "Invalid Username": "Invalid Username",
          "Invalid Email Address": "Invalid Email Address",
          "Signup": "Signup",
          "Email Address": "Email Address",
          "University": "University",
          "Age": "Age",
          "Full Name": "Full Name",
          "Governorate": "Governorate",
          "Gender": "Gender",
          "Address": "Address",

          "Personal Info": "Personal Info",

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
          'Alert': 'Alert',
          "Are you sure you want to delete your Acoount?":
              "Are you sure you want to delete your Acoount?",

          //All Cases
          'Recently Added Cases': 'Recently Added Cases',
          //Add Case
          "Your description must be more than 20 letters":
              "Your description must be more than 20 letters",
          "Your Case Posted Successfully": "Your Case Posted Successfully",
          "Success ": "Success ",
          'Maximum Number of Prescription Images is 2':
              'Maximum Number of Prescription Images is 2',
          'Maximum Number of X_ray Images is 2':
              'Maximum Number of X_ray Images is 2',
          'Please select more than 2 images for your mouth.':
              'Please select more than 2 images for your mouth.',
          'Please select your case.': 'Please select your case.',
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

          'Please select at least one item in the checklist.':
              'Please select at least one item in the checklist.',

          //whole Case
          "Edit": "Edit",
          'Case Detailes        ': 'Case Detailes        ',
          'Pictures of your Mouth': 'Pictures of your Mouth',
          'X-Ray Images': 'X-Ray Images',
          'Prescription Images': 'Prescription Images',

          //Assigned Case Patient
          'Dr.': 'Dr.',
          'Location :': 'Location :',
          "You Must Paste a Valid Google Map Link of Hospital":
              "You Must Paste a Valid Google Map Link of Hospital",

          //edit case patient
          'Edit Case        ': 'Edit Case        ',
// delete case
          "Your case has been deleted Successfully":
              "Your case has been deleted Successfully",
          "Deleted Successfully": "Deleted Successfully",
          //login
          "Incorrect Phone Number or Password":
              "Incorrect Phone Number or Password",
          "Please Wait for Identity Verification":
              "Please Wait for Identity Verification",
          "Invalid Password": "Invalid Password",
          'Welcome Back': 'Welcome Back',
          'Forget Password?': 'Forget Password?',
          "Phone": "Phone",
          "Login": "Login",
          "Don't have an account?": "Don't have an account?",
          "Sign up": "Sign up",

          //presignup
          "D O C T O R  ": "D O C T O R  ",
          "P A T I E N T": "P A T I E N T",

          //home
          "Search": "Search",

          //search
          'Search Screen     ': 'Search Screen     ',

          //requested cases dr
          'Requested Cases': 'Requested Cases',
          //all cases
          'All Cases       ': 'All Cases       ',
          'General Cases': 'General Cases',
          'Categories': 'Categories',
          'See All': 'See All',
          'Description': 'Description',
          'Pictures Of Mouth': 'Pictures Of Mouth',
          'Prescription': 'Prescription',
          'X-Ray': 'X-Ray',
          'Dental Diseases': 'Dental Diseases',

          //Assigned Dr Case
          'Date : ': 'Date: ',
          'Time : ': 'Time: ',
          'Case Status': 'Case Status',
          'Phone Number': 'Phone Number',
          "After Request": "After Request",

          //Appontment Screen
          'Now you are Responsible with This Case':
              "Now you are Responsible with This Case",
          "Case is Already Requested by Another Doctor":
              "Case is Already Requested by Another Doctor",
          "You are not Responsible for This Case":
              "You are not Responsible for This Case",
          "Case Cancelled": "Case Cancelled",
          "Case is Already NOT Assigned to you":
              "Case is Already NOT Assigned to you",
          "Cancel Case": "Cancel Case",
          "Are you Sure you Want to Cancel this Request?":
              "Are you Sure you Want to Cancel this Request?",
          "Warning": "Warning",

          'Select Time': 'Select Time',
          'Select Date': 'Select Date',
          'Appointment': 'Appointment',
          "Google Maps": "Google Maps",
          'Book': 'Book',
          "Paste your hospital link into Google Map":
              "Paste your hospital link into Google Map",
          "Success": "Success",
        },
      };
}
// هدفنا
