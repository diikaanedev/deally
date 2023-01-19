import 'package:deally/models/produit_by_dii.dart';
import 'package:deally/utils/requette-by-dii.dart';

class ProductService {
  Future<ProduitModel> addProducts(Map<String, dynamic> json) async {
    return await postResponse(url: '/products', body: json)
        .then((value) => ProduitModel.fromObject(value['body']['data']));
  }

  Future<List<ProduitModel>> listProducts() async {
    return await getResponse(url: '/products/shop').then((value) {
      print(value['data'][0]);
      return ProduitModel.fromJson(data: value['data']);
    });
  }
}
