class UserModel {
  String typeOfCompany;
  String nameofIDCard;
  String numberfIDCard;
  String maritalStatut;
  String nameShop;
  String city;
  bool hasAcceptedNewsletter;
  String cacName;
  String cacNumber;
  String role;
  String sexe;
  String description;
  String profile;
  String firstName;
  String lastName;
  String contry;
  List? address;
  List? products;
  List? orders;
  List? transactions;
  String solde;
  String cacAddress;
  String bvn;
  List? callFund;
  String date;
  String phone;
  String id;
  String avatar;

  UserModel(
      {required this.typeOfCompany,
      required this.nameofIDCard,
      required this.numberfIDCard,
      required this.maritalStatut,
      required this.nameShop,
      required this.city,
      required this.hasAcceptedNewsletter,
      required this.cacName,
      required this.cacNumber,
      required this.role,
      required this.sexe,
      required this.description,
      required this.profile,
      required this.firstName,
      required this.lastName,
      required this.contry,
      required this.address,
      required this.products,
      required this.orders,
      required this.transactions,
      required this.solde,
      required this.cacAddress,
      required this.bvn,
      required this.callFund,
      required this.date,
      required this.phone,
      required this.avatar,
      required this.id});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        typeOfCompany: json['TypeOfCompany'],
        nameofIDCard: json['NameofIDCard'],
        numberfIDCard: json['NumberfIDCard'],
        maritalStatut: json['MaritalStatut'],
        nameShop: json['nameShop'],
        city: json['city'],
        hasAcceptedNewsletter: json['hasAcceptedNewsletter'],
        cacName: json['cacName'],
        cacNumber: json['cacNumber'],
        role: json['role'],
        sexe: json['sexe'],
        description: json['description'],
        profile: json['profile'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        contry: json['contry'],
        avatar: json['avatar'],
        address: [],
        products: [],
        orders: [],
        transactions: [],
        solde: json['solde'],
        cacAddress: json['cacAddress'],
        bvn: json['bvn'],
        callFund: [],
        date: json['date'],
        phone: json['phone'],
        id: json['id']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['TypeOfCompany'] = typeOfCompany;
    data['NameofIDCard'] = nameofIDCard;
    data['NumberfIDCard'] = numberfIDCard;
    data['MaritalStatut'] = maritalStatut;
    data['nameShop'] = nameShop;
    data['city'] = city;
    data['hasAcceptedNewsletter'] = hasAcceptedNewsletter;
    data['cacName'] = cacName;
    data['cacNumber'] = cacNumber;
    data['role'] = role;
    data['sexe'] = sexe;
    data['description'] = description;
    data['profile'] = profile;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['contry'] = contry;
    data['avatar'] = avatar;
    data['date'] = date;
    data['phone'] = phone;
    data['id'] = id;
    return data;
  }
}
