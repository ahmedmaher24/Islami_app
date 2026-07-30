# 🕌 Islami App | تطبيق إسلامي

تطبيق إسلامي متكامل مبني باستخدام **Flutter** يوفر تجربة مستخدم مميزة وعصرية لقراءة القرآن الكريم، الاستماع للأحاديث النبوية، والتسبيح.

---

## 📱 شاشات التطبيق (App Gallery)

### 🔹 رحلة البداية (Onboarding & Identity)
تتميز شاشات الترحيب بتصميم هادئ يمهد المستخدم لتجربة إيمانية مميزة.

| شاشة البداية | اختيار اللغة | التعريف بالتطبيق |
|:---:|:---:|:---:|
| <img src="./image/image1.png" width="250"> | <img src="./image/image2.png" width="250"> | <img src="./image/image7.png" width="250"> |

### 🔹 المميزات الأساسية (Core Features)
يوفر التطبيق واجهات سهلة وبسيطة للوصول للقرآن الكريم والأحاديث.

| القرآن الكريم | الأحاديث النبوية | السبحة الإلكترونية |
|:---:|:---:|:---:|
| <img src="./image/image3.png" width="250"> | <img src="./image/image4.png" width="250"> | <img src="./image/image5.png" width="250"> |

### 🔹 الإضافات (Extras)
متابعة إذاعات القرآن الكريم وتنبيهات الأذان.

| راديو القرآن | تفاصيل السور |
|:---:|:---:|
| <img src="./image/image6.png" width="250"> | <img src="./image/image3.png" width="250"> |

---

## ✨ المميزات التقنية (Technical Features)

*   **📖 Reading Experience:** عرض السور والآيات بتنسيق مريح للعين مع دعم الخطوط العثمانية.
*   **📜 Hadith Carousel:** استعراض الأحاديث النبوية باستخدام `CarouselSlider` التفاعلي.
*   **📿 Digital Tasbeeh:** عداد تسبيح ذكي يحفظ عدد التسبيحات.
*   **📻 Live Radio:** بث مباشر لإذاعات القرآن الكريم باستخدام تقنيات الـ Streaming.
*   **📱 Responsive UI:** واجهات متوافقة مع جميع أحجام الشاشات بفضل مكتبة `Sizer`.

---

## 🛠️ التقنيات (Tech Stack)

| التقنية | الوظيفة |
| :--- | :--- |
| **Flutter/Dart** | الإطار البرمجي الأساسي |
| **Provider** | إدارة الحالة (State Management) |
| **Shared Prefs** | الحفظ المحلي للبيانات واللغة |
| **Http** | جلب بيانات الراديو من الـ API |
| **Google Fonts** | الخطوط العربية الاحترافية (Tajawal/Amiri) |

---

## 🚀 كيفية التشغيل (Setup)

```bash
# Clone the repository
git clone https://github.com/your-username/islamic.git

# Install dependencies
flutter pub get

# Run the app
flutter run
```

---

> **Note:** المجلد `image` مخصص للعرض فقط في GitHub ولن يتم تضمينه في ملف الـ APK النهائي لتقليل الحجم.
