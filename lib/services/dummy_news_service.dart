

import 'package:news_app/models/news_item.dart';

class DummyNewsService {
  static final List<NewsItem> _news = [
    const NewsItem(
      title: "مباراة القرن تنتهي بفوز تاريخي",
      description:
      "المنتخب المصري يهزم البرازيل 3-2 في نهائي كأس العالم بعد مباراة مثيرة استمرت 120 دقيقة وانتهت بركلات الترجيح...",
      imagePath: "assets/images/sports.avif",
    ),
    const NewsItem(
      title: "اكتشاف علمي يغير فهمنا للكون",
      description:
      "علماء الفلك يكتشفون كوكبًا جديدًا يشبه الأرض في منطقة صالحة للحياة، مما يفتح آفاقًا جديدة للبحث عن حياة خارجية...",
      imagePath: "assets/images/science.avif",
    ),
    const NewsItem(
      title: "ارتفاع قياسي في أسعار الذهب",
      description:
      "سعر أونصة الذهب يتجاوز 2400 دولار لأول مرة في التاريخ بسبب التوترات الجيوسياسية والتضخم العالمي...",
      imagePath: "assets/images/business.avif",
    ),
    const NewsItem(
      title: "إطلاق هاتف ذكي بكاميرا 200 ميجابكسل",
      description:
      "شركة تقنية كبرى تكشف عن هاتفها الجديد بكاميرا ثورية ومعالج فائق السرعة وشاشة بمعدل تحديث 144 هرتز...",
      imagePath: "assets/images/technology.jpeg",
    ),
  ];

  static List<NewsItem> getNews() => _news;
}