import 'dart:ui';

class Category{
  String id;
  String imagePath;
  String title;
  int color;
  Category({required this.id,required this.imagePath, required this.title,
  required this.color});
  //
  static List<Category> getCategoryList(){
    return [
      Category(id: 'sports', imagePath: 'assets/images/ball.png',
          title: 'Sports', color: 0xffC91C22),
      Category(id: 'technology', imagePath: 'assets/images/science.png',
          title: 'technology', color: 0xffCF7E48),
      Category(id: 'general', imagePath: 'assets/images/Politics.png',
          title: 'General', color: 0xff003E90),
      Category(id: 'health', imagePath: 'assets/images/health.png',
          title: 'Health', color: 0xffED1E79),
      Category(id: 'business', imagePath: 'assets/images/bussines.png',
          title: 'Business', color: 0xffCF7E48),
      Category(id: 'entertainment', imagePath: 'assets/images/environment.png',
          title: 'Entertainment', color: 0xff4882CF),
      Category(id: 'science', imagePath: 'assets/images/science.png',
          title: 'Science', color: 0xffF2D352),


    ];
  }

}