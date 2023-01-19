import 'package:deally/models/categorie_by_dii.dart';
import 'package:deally/utils/requette-by-dii.dart';

class CategorieServices {
  Future<List<CategorieShopList>> getCategorie() async {
    return await getResponse(url: "/categories/parentByContry?contry=GN")
        .then((value) => CategorieShopList.fromCategorie(data: value['data']));
  }

  Future<List<CategorieShopList>> getCategorieSon(String id) async {
    return await getResponse(url: "/categories/son?category=$id")
        .then((value) => CategorieShopList.fromCategorie(data: value['data']));
  }

  Future<List<CategorieShopList>> getCategorieSonInitial() async {
    return await getResponse(url: "/categories/sonByContry?contry=GN")
        .then((value) => CategorieShopList.fromCategorie(data: value['data']));
  }
}
