class AdresseModel {
  final String id;
  final String name;
  final String addr1;
  final String addr2;
  final String city;
  final String contry;
  final String zipcode;
  final String phoneNumber;
  final String firstName;
  final String lastName;
  final bool isDefault;
  final bool isMap;

  const AdresseModel({
    required this.id,
    required this.name,
    required this.addr1,
    required this.addr2,
    required this.city,
    required this.contry,
    required this.zipcode,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.isDefault,
    required this.isMap,
  });

  static AdresseModel fromObject(dynamic item) {
    return AdresseModel(
      id: item['_id'],
      name: item['name'],
      addr1: item['addr1'],
      addr2: item['addr2'],
      city: item['city'],
      contry: item['country'],
      zipcode: item['zipcode'],
      phoneNumber: item['phoneNumber'],
      firstName: item['firstName'],
      lastName: item['lastName'],
      isDefault: item['isDefault'],
      isMap: item['isMap'],
    );
  }

  static List<AdresseModel> fromJson({required List data}) {
    List<AdresseModel> liste = [];
    for (var item in data) {
      liste.add(AdresseModel(
        id: item['_id'],
        name: item['name'],
        addr1: item['addr1'],
        addr2: item['addr2'],
        city: item['city'],
        contry: item['country'],
        zipcode: item['zipcode'],
        phoneNumber: item['phone'],
        firstName: item['firstName'],
        lastName: item['lastName'],
        isMap: item['isMap'],
        isDefault: item['isDefault'],
      ));
    }
    return liste;
  }
}
