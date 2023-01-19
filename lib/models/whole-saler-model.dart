class WholeSaler {
  String nameShop;
  List matricule;
  String firstName;
  String lastName;
  String contry;
  String phone;
  String id;
  bool active;

  WholeSaler(
      {required this.nameShop,
      required this.firstName,
      required this.active,
      required this.lastName,
      required this.matricule,
      required this.contry,
      required this.phone,
      required this.id});

  factory WholeSaler.fromJson(Map<String, dynamic> json) {
    return WholeSaler(
        nameShop: json['nameShop'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        contry: json['contry'],
        matricule: json['matricule'],
        active: json['active'] == "active",
        phone: json['phone'],
        id: json['id']);
  }

  static List<WholeSaler> fromList(List json) {
    List<WholeSaler> liste = [];
    for (var element in json) {
      liste.add(WholeSaler(
          nameShop: element['nameShop'],
          firstName: element['firstName'],
          lastName: element['lastName'],
          contry: element['contry'],
          matricule: element['matricule'],
          active: element['active'] == "active",
          phone: element['phone'],
          id: element['id']));
    }

    return liste;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['nameShop'] = nameShop;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['matricule'] = matricule;
    data['active'] = active ? "active" : "inactive";
    data['phone'] = phone;
    data['contry'] = contry;
    data['id'] = id;
    return data;
  }
}
