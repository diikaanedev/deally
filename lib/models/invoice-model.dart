// ignore: file_names

class InvoiceModel {
  final int id;
  final int order;
  final int file;

  const InvoiceModel({
    required this.id,
    required this.order,
    required this.file,
  });

  static List<InvoiceModel> fromList({required List data}) {
    List<InvoiceModel> liste = [];
    for (var item in data) {
      liste.add(InvoiceModel(
        id: item['id'],
        order: item['attributes']['quantity'],
        file: item['attributes']['product']['data']['id'],
      ));
    }
    return liste;
  }
}
