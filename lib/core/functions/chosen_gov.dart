String chosenGov(String value) {
  switch (value) {
    case "الإسكندرية":
      return "Alexandria";
    case "أسوان":
      return "Aswan";
    case "أسيوط":
      return "Asyut";
    case "البحيرة":
      return "Beheira";
    case "بني سويف":
      return "Beni Suef";
    case "القاهرة":
      return "Cairo";
    case "الدقهلية":
      return "Dakahlia";
    case "دمياط":
      return "Damietta";
    case "الفيوم":
      return "Faiyum";
    case "الغربية":
      return "Gharbia";
    case "الجيزة":
      return "Giza";
    case "الإسماعيلية":
      return "Ismailia";
    case "كفر الشيخ":
      return "Kafr El Sheikh";
    case "الأقصر":
      return "Luxor";
    case "مطروح":
      return "Matrouh";
    case "المنيا":
      return "Minya";
    case "المنوفية":
      return "Monufia";
    case "الوادي الجديد":
      return "New Valley";
    case "شمال سيناء":
      return "North Sinai";
    case "بورسعيد":
      return "Port Said";
    case "القليوبية":
      return "Qalyubia";
    case "قنا":
      return "Qena";
    case "البحر الأحمر":
      return "Red Sea";
    case "الشرقية":
      return "Sharqia";
    case "سوهاج":
      return "Sohag";
    case "جنوب سيناء":
      return "South Sinai";
    case "السويس":
      return "Suez";
    default:
      return "Unknown"; // Or handle this case differently based on your needs
  }
}
