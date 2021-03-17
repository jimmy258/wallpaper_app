import 'package:wallpaper_app/model/categories_model.dart';

List<CategoriesModel> getCategories() {
  List<CategoriesModel> categories = new List();
  CategoriesModel categorieModel = new CategoriesModel();

  //
  categorieModel.imgUrl =
  "https://w.wallhaven.cc/full/xl/wallhaven-xllyq3.jpg";
  categorieModel.categoriesName = "Street Art";
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();

  //
  categorieModel.imgUrl =
  "https://w.wallhaven.cc/full/73/wallhaven-73e8gv.jpg";
  categorieModel.categoriesName = "Wild Life";
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();

  //
  categorieModel.imgUrl =
  "https://w.wallhaven.cc/full/zx/wallhaven-zxqkdy.jpg";
  categorieModel.categoriesName = "Nature";
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();

  //
  categorieModel.imgUrl =
  "https://w.wallhaven.cc/full/nm/wallhaven-nm6yqy.jpg";
  categorieModel.categoriesName = "City";
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();

  //
  categorieModel.imgUrl =
  "https://w.wallhaven.cc/full/47/wallhaven-47jve3.jpg";
  categorieModel.categoriesName = "Motivation";

  categories.add(categorieModel);
  categorieModel = new CategoriesModel();

  //
  categorieModel.imgUrl =
  "https://w.wallhaven.cc/full/8x/wallhaven-8xj571.jpg";
  categorieModel.categoriesName = "Bikes";
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();

  //
  categorieModel.imgUrl =
  "https://w.wallhaven.cc/full/4y/wallhaven-4y63jx.jpg";
  categorieModel.categoriesName = "Cars";
  categories.add(categorieModel);
  categorieModel = new CategoriesModel();

  return categories;
}