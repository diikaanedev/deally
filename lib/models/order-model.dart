class OrderModel {
  final String id;
  final String statusShop;
  final String statusClient;
  final String reference;
  final String product;
  final int quantite;
  final String priceTotal;
  final String client;
  final String shop;
  final String livraison;
  final String order;
  final String date;
  final String typePaiment;

  const OrderModel({
    required this.id,
    required this.statusShop,
    required this.statusClient,
    required this.reference,
    required this.product,
    required this.quantite,
    required this.priceTotal,
    required this.client,
    required this.shop,
    required this.livraison,
    required this.order,
    required this.date,
    required this.typePaiment,
  });

  static List<OrderModel> fromJson({required List data}) {
    List<OrderModel> liste = [];

    for (var item in data) {
      liste.add(OrderModel(
          id: item['_id'],
          reference: item['reference'],
          statusShop: item['statusShop'],
          statusClient: item['statusClient'],
          date: item['date'],
          product: item['product'],
          quantite: item['quantite'],
          priceTotal: item['priceTotal'],
          typePaiment: item['typePaiment'],
          client: item["client"],
          shop: item["shop"],
          livraison: item["livraison"],
          order: item["order"]));
    }

    return liste;
  }
}
