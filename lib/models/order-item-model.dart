// ignore: file_names

class OrderItemModel {
  final String id;
  final int quantity;
  final String produitModel;
  final String ref;
  final int price;
  final String date;
  final String status;

  const OrderItemModel(
      {required this.id,
      required this.quantity,
      required this.produitModel,
      required this.date,
      required this.status,
      required this.ref,
      required this.price});

  static List<OrderItemModel> fromList({required List data}) {
    List<OrderItemModel> liste = [];
    for (var item in data) {
      liste.add(OrderItemModel(
          id: item['_id'],
          quantity: item['quantite'],
          produitModel: item['product'] ?? "",
          date: item['date'] ?? "",
          status: item['statusShop'] ?? "",
          ref: item['reference'] ?? "",
          price: int.parse(item['priceTotal'])));
    }
    return liste;
  }

  static List<OrderItemModel> fromListOrder({required List data}) {
    List<OrderItemModel> liste = [];
    for (var item in data) {
      liste.add(OrderItemModel(
          id: item['_id'],
          quantity: item['quantite'],
          ref: item['reference'] ?? "",
          date: item['date'] ?? "",
          status: item['status'] ?? "",
          produitModel: item['product']['_id'] ?? "",
          price: int.parse(item['priceTotal'])));
    }
    return liste;
  }
}
