import 'package:wallpaper_hub/model/categories_model.dart';

String apiKey = "563492ad6f91700001000001649b9a4bd10d4f4089a47725ad0e5dd4";

List<CategoriesModel> getCategories(){
List<CategoriesModel> categories = [];
CategoriesModel categorieModel = new CategoriesModel();


categorieModel.imgUrl = "https://images.pexels.com/photos/959314/pexels-photo-959314.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
categorieModel.categorieName = "Street Art";
categories.add(categorieModel);
categorieModel = new CategoriesModel();

categorieModel.imgUrl = "https://images.pexels.com/photos/4562477/pexels-photo-4562477.png?auto=compress&cs=tinysrgb&dpr=1&w=500";
categorieModel.categorieName = "Wild Life";
categories.add(categorieModel);
categorieModel = new CategoriesModel();

categorieModel.imgUrl = "https://images.pexels.com/photos/4215113/pexels-photo-4215113.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
categorieModel.categorieName = "Nature";
categories.add(categorieModel);
categorieModel = new CategoriesModel();

categorieModel.imgUrl = "https://images.pexels.com/photos/681335/pexels-photo-681335.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
categorieModel.categorieName = "City";
categories.add(categorieModel);
categorieModel = new CategoriesModel();

categorieModel.imgUrl = "https://images.pexels.com/photos/2045600/pexels-photo-2045600.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
categorieModel.categorieName = "Motivation";
categories.add(categorieModel);
categorieModel = new CategoriesModel();

categorieModel.imgUrl = "https://images.pexels.com/photos/2607554/pexels-photo-2607554.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
categorieModel.categorieName = "Bikes";
categories.add(categorieModel);
categorieModel = new CategoriesModel();

categorieModel.imgUrl = "https://images.pexels.com/photos/337909/pexels-photo-337909.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
categorieModel.categorieName = "Cars";
categories.add(categorieModel);
categorieModel = new CategoriesModel();

categorieModel.imgUrl = "https://images.pexels.com/photos/4215113/pexels-photo-4215113.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
categorieModel.categorieName = "Nature";
categories.add(categorieModel);
categorieModel = new CategoriesModel();

return categories;

}