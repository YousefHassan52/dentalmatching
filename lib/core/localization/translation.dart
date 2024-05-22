import 'package:get/get.dart';

class MyTranslation implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
// categories
          "All Categories": "كل الحالات",

          //forget pass
          "We Will Send You a Verification Code To Your Email Address To Reset Your Password":
              "سنرسل لك رمز التحقق إلى عنوان بريدك الإلكتروني لإعادة تعيين كلمة المرور الخاصة بك",
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
          "Invalid Password": '''
كلمة المرور الخاصة بك يجب أن تتضمن:
1.	حروف كبيرة
2.	حروف صغيرة
3.	رموز
4.	أرقام
''',
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
          "Email or Phone Already exists before":"الايميل او الرقم استخدم من قبل",
          "Email Address": "بريد الكتروني",
          "University": "الجامعة",
          "Age": "السن",
          "Full Name": "الاسم",
          "Governorate": "المحافظة",
          "Gender": "النوع",
          "Address": "العنوان",
          "Female": "انثى",
          "Male": "ذكر",
          "Your Account Has Been Created Successfully\nPlease Wait For Identity Verification":
              "تم إنشاء حسابك بنجاح\nيرجى الانتظار حتى يتم التحقق من الهوية",

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
          "delete account middle text":
              "هل انت متأكد من رغبتك في حذف حسابك\nذلك يتضمن جميع بياناتك و الحالات",
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
          'Autoimmune diseases': 'أمراض الجهاز المناعي التلقائي',
          'Diabetes': 'مرض السكر',
          'Blood Pressure': 'ضغط الدم',
          'Cardiovascular diseases': 'أمراض القلب والأوعية الدموية',
          'None': 'لا شيء',
          'Caries': 'تسوس',
          'Fixed Prosthodontics Crown and Bridge': 'تركيب كوبري ',
          'Fixed Prosthodontics Implantology': 'تركيبات لزراعة الأسنان',
          'Partial Removable Prosthodontics': 'تركيبات اسنان قابلة للإزالة',
          'Complete Removable Prosthodontics': 'تركيبات طقم كامل قابل للإزالة',
          'Orthodontics': 'تقويم الأسنان',
          'Gingivitis - periodontitis': 'امراض اللثه',
          'Endodontics': 'العصب',
          'Dental abscess': 'خراج الأسنان',
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
          "Comments": "التعليقات",
          "Add a comment...": "...اضافة تعليق",
          "Add a comment": "اضف تعليق!",
          "Report": "ابلاغ",
          "This case has been reported successfuly":
              "تم الابلاغ عن هذه الحالة بنجاح",
          "This case han been reported before":
              "تم الابلاغ عن هذه الحالة مسبقا",
          "Warning": "تحذير",
          "Write Hospital Name": "اكتب اسم المستشفى",

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
          "Choose Date and Time": "قم باختيار التاريخ والوقت",
          'Error': "خطأ",

          //changepass
          'Change Password': "تغيير كلمة المرور",
          "Current Password": "كلمة المرور الحالية",
          "New Password": "كلمة المرور الجديدة",
          "Change": "تغيير",
          "Forget old password?": "هل نسيت كلمة المرور القديمة؟",
          "Press Here": "اضغط هنا",
          "Passwords do not match": "كلمة المرور غير مطابقة",
          "Your current password is wrong": "كلمة المرور الحالية غير صحيحة",
          "Your passsword has been changed successfully":
              "تم تغيير كلمة المرور بنجاح",

          //onboarding
          "Start": "البدأ",
          "Join Us": "انضم إلينا",
          "Together,\nLet's Create Smiles That Last a Lifetime.":
              "معًا \n لنصنع ابتسامات تدوم مدى الحياة.",
          "To Our Journey": "لرحلتنا",
          "Quality Care,": "رعاية صحية",
          "Welcome to": "مرحبا بك في",
          "DentaMatch\n": "DentaMatch\n",
          "Our app saves time for both dentists and patients. Say goodbye to long waits and hello to efficient dental care.":
              "يوفر تطبيقنا الوقت لكل من أطباء الأسنان والمرضى. قل وداعًا للانتظار الطويل ومرحبًا برعاية الأسنان الفعالة.",
          " Request": "قم بإجراء طلب",
          "Patient Cases": "لحالات المرضى",
          "Grow Your Expertise with Every \nRequest to Patient Case Today!":
              "قم بتنمية خبرتك مع كل طلب مريض اليوم!",
          "Hassle-Free": "خالية من المتاعب",
          "Discover free treatment options \n affordable dental care solutions \n tailored to your needs.":
              "اكتشف خيارات العلاج المجانية \n حلول العناية بالأسنان بأسعار معقولة \n المصممة خصيصًا لتلبية احتياجاتك.",
          "We are committed to protecting your privacy and security.By using our app,\n you agree to our privacy policy and terms of service.":
              "نحن ملتزمون بحماية خصوصيتك وأمنك. باستخدام تطبيقنا،\n فإنك توافق على سياسة الخصوصية وشروط الخدمة الخاصة بنا.",
          "Your Security": "حمايتك",
          "Our Priority": "أولويتنا",
        },
        "en": {
          // categories
          "All Categories": "All Categories         ",
          //coonection
          "Internet Connection Error Refresh Data":
              "Internet Connection Error Refresh Data",
          //deelet account
          "Your Account has been Deleted Successfully":
              "Your Account has been Deleted Successfully",
          //forge pass
          "Your current password is wrong": "Your current password is wrong",
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
          "We Will Send Your a Verification Code To Your Email Address To Reset Your Password":
              "We Will Send Your a Verification Code To Your Email Address To Reset Your Password",
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
          "Female": "Female",
          "Male": "Male",
          "Email or Phone Already exists before":
              "Email or Phone Already exists before",
          "Personal Info": "Personal Info",
          "Your Account Has Been Created Successfully\nPlease Wait For Identity Verification":
              "Your Account Has Been Created Successfully\nPlease Wait For Identity Verification",

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
          "delete account middle text":
              "Are you Sure you Want to delete your account\nthis includes all your data and cases",
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
          'Autoimmune diseases': 'Autoimmune diseases',
          'Diabetes': 'Diabetes',
          'Blood Pressure': 'Blood Pressure',
          'Cardiovascular diseases': 'Cardiovascular diseases',
          'None': 'None',
          'Caries': 'Caries',
          'Fixed Prosthodontics Crown and Bridge':
              'Fixed Prosthodontics Crown and Bridge',
          'Fixed Prosthodontics Implantology':
              'Fixed Prosthodontics Implantology',
          'Partial Removable Prosthodontics':
              'Partial Removable Prosthodontics',
          'Complete Removable Prosthodontics':
              'Complete Removable Prosthodontics',
          'Orthodontics': 'Orthodontics',
          'Gingivitis - periodontitis': 'Gingivitis - periodontitis',
          'Endodontics': 'Endodontics',
          'Dental abscess': 'Dental abscess',
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
          "Comments": "Comments",
          "Add a comment...": "Add a comment...",
          "Add a comment": "Add a comment !!",
          "Report": "Report",
          "This case has been reported successfuly":
              "This case has been reported successfuly",
          "This case han been reported before":
              "This case han been reported before",
          "Warning": "Warning",
          "Write Hospital Name": "Write Hospital Name",

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
          "Invalid Password": '''
Your password must include:
1. Capital letters
2. Small letters
3. Symbols
4. Numbers
''',
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

          'Select Time': 'Select Time',
          'Select Date': 'Select Date',
          'Appointment': 'Appointment',
          "Google Maps": "Google Maps",
          'Book': 'Book',
          "Paste your hospital link into Google Map":
              "Paste your hospital link into Google Map",
          "Success": "Success",
          "Choose Date and Time": "Choose Date and Time",
          'Error': 'Error',

          //onboarding
          "Start": "Start",
          "To Our Journey": "To Our Journey",
          "Quality Care,": "Quality Care,",
          "Welcome to": "Welcome to",
          "DentaMatch\n": "DentaMatch\n",
          "Our app saves time for both dentists and patients. Say goodbye to long waits and hello to efficient dental care.":
              "Our app saves time for both dentists and patients. Say goodbye to long waits and hello to efficient dental care.",
          " Request": " Request",
          "Patient Cases": "Patient Cases",
          "Hassle-Free": "Hassle-Free",
          "Discover free treatment options \n affordable dental care solutions \n tailored to your needs.":
              "Discover free treatment options \n affordable dental care solutions \n tailored to your needs.",
          "Grow Your Expertise with Every \nRequest to Patient Case Today!":
              "Grow Your Expertise with Every \nRequest to Patient Case Today!",
          "Your Security": "Your Security",
          "We are committed to protecting your privacy and security.By using our app,\n you agree to our privacy policy and terms of service.":
              "We are committed to protecting your privacy and security.By using our app,\n you agree to our privacy policy and terms of service.",
          "Our Priority": "Our Priority",
        },
      };
}
// هدفنا
