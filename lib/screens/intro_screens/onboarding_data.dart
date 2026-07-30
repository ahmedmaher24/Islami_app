class OnboardingData {
  String image;
  String titleAr;
  String titleEn;
  String subTitleAr;
  String subTitleEn;
  OnboardingData({
    required this.image,
    required this.titleAr,
    required this.titleEn,
    required this.subTitleAr,
    required this.subTitleEn,
  });
  static List<OnboardingData> dataOnboarding = [
    OnboardingData(
      image: "assets/images/intro_screen1.png",
      titleAr: "اختار اللغه",
      titleEn: "Choose Language",
      subTitleAr: " ",
      subTitleEn: " ",
    ),
    OnboardingData(
      image: "assets/images/intro_screen2.png",
      titleAr: "اهلا بيك فى اسلامى ",
      titleEn: "Wolcome To Islami",
      subTitleAr: "نحن متحمسين جدا انت تكون جزء\n من مجتمعنا",
      subTitleEn: "we Are very excited To have you in\n our Community",
    ),
    OnboardingData(
      image: "assets/images/intro_screen3_quran.png",
      titleAr: "قراءة القرآن",
      titleEn: "Reading The Quran",
      subTitleAr: "اقرأ وربك الأكرم الذي علم بالقلم",
      subTitleEn: "Read, and your Lord is the Most\n Generous",
    ),
    OnboardingData(
      image: "assets/images/intro_screen4_bearish.png",
      titleAr: "التسبيح",
      titleEn: "Tasbeeh",
      subTitleAr: "سبح اسم ربك الأعلى",
      subTitleEn: "Praise the name of your Lord,the\n Most High",
    ),
    OnboardingData(
      image: "assets/images/intro_screen5_radio.png",
      titleAr: "راديو القرآن",
      titleEn: "Holy Quran Radio",
      subTitleAr:
          "يمكنك الاستماع إلى إذاعة القرآن الكريم من خلال التطبيق بسهولة",
      subTitleEn:
          "You can listen to the Holy Quran\n Radio through the application For\n free and easily",
    ),
  ];
}
