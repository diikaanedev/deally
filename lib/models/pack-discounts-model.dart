// ignore: file_names
class PackDiscountsModel {
  final String id;
  final int min;
  final int max;
  final int price;

  const PackDiscountsModel(
      {required this.id,
      required this.min,
      required this.max,
      required this.price});

  static PackDiscountsModel fromJson(dynamic data) {
    return PackDiscountsModel(
        id: data['id'] ?? "",
        min: data['min'],
        max: data['max'],
        price: data['price']);
  }

  static List<PackDiscountsModel> fromProducts({required List data}) {
    List<PackDiscountsModel> liste = [];
    for (var item in data) {
      liste.add(fromJson(item));
    }
    return liste;
  }
}
