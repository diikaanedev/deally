import 'package:deally/models/user-model.dart';
import 'package:deally/models/whole-saler-model.dart';
import 'package:deally/services/auth-services.dart';
import 'package:deally/services/fournisseur-service.dart';
import 'package:deally/utils/upload-file.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

class FournisseurBloc extends ChangeNotifier {
  UserModel? user;
  WholeSaler? wholeSaler;

  AuthService authService = AuthService();

  int diagramSelect = 1;

  List<dynamic> avatarImg = ["", null];

  List<WholeSaler> listWholeSaler = [];

  bool loading = false;

  List<DropDownValueModel> listeTypeOfCpmpany = const [
    DropDownValueModel(name: 'Ltd', value: "Ltd"),
    DropDownValueModel(name: 'Plc', value: "Plc"),
    DropDownValueModel(name: 'Gte', value: "Gte"),
    DropDownValueModel(name: 'Ultd', value: "Ultd"),
    DropDownValueModel(
        name: 'Syndics Incorporated', value: "Syndics_Incorporated"),
    DropDownValueModel(
        name: 'Partenariat limite (LP)', value: "Partenariat_limite"),
  ];

  List<DropDownValueModel> listePieceType = const [
    DropDownValueModel(name: 'National', value: "National"),
    DropDownValueModel(name: "Voter's", value: "Voter"),
    DropDownValueModel(name: 'Driver', value: "Driver"),
    DropDownValueModel(name: "Passport", value: "Passport"),
  ];

  //add wholeSealer

  String phoneWholeSaler = "";
  String contryWholeSaler = "GN";
  TextEditingController nomholeSaler = TextEditingController();
  TextEditingController prenomWholeSaler = TextEditingController();
  TextEditingController shopWholeSaler = TextEditingController();

  final FournisseurService fournisseurService = FournisseurService();

  TextEditingController telephone = TextEditingController();
  TextEditingController cac = TextEditingController();
  TextEditingController cacNumber = TextEditingController();
  TextEditingController bvn = TextEditingController();
  TextEditingController nameShop = TextEditingController();
  TextEditingController nomI = TextEditingController();
  TextEditingController prenomI = TextEditingController();
  TextEditingController numberCard = TextEditingController();

  DropDownValueModel typeOfCompagny =
      const DropDownValueModel(name: "Ltd", value: "Ltd");

  DropDownValueModel nameOfCard =
      const DropDownValueModel(name: 'National', value: "National");

  DropDownValueModel maritalStatus =
      const DropDownValueModel(name: 'Married', value: "Married");

  FournisseurBloc() {
    getListWholeSaler();
    getInfoUser();
  }

  setPhoneWholeSaler(String phone) {
    phoneWholeSaler = phone;
    notifyListeners();
  }

  setContryWholeSaler(String value) {
    contryWholeSaler = value;
    notifyListeners();
  }

  getListWholeSaler() async {
    listWholeSaler = await fournisseurService.getWholeSaler();
    notifyListeners();
  }

  setDiagramSelect(int value) {
    diagramSelect = value;
    notifyListeners();
  }

  getImageAvatar() async {
    avatarImg = await getImage(1);
    user!.avatar = avatarImg[0];
    updateUser();
    notifyListeners();
  }

  getInfoUser() async {
    user = await fournisseurService.getUser();
    telephone.value = TextEditingValue(text: user!.phone);
    cac.value = TextEditingValue(text: user!.cacName);
    cacNumber.value = TextEditingValue(text: user!.cacNumber);
    bvn.value = TextEditingValue(text: user!.bvn);
    nameShop.value = TextEditingValue(text: user!.nameShop);
    nomI.value = TextEditingValue(text: user!.lastName);
    prenomI.value = TextEditingValue(text: user!.firstName);
    numberCard.value = TextEditingValue(text: user!.numberfIDCard);
    typeOfCompagny = DropDownValueModel(
        name: user!.typeOfCompany, value: user!.typeOfCompany);
    nameOfCard =
        DropDownValueModel(name: user!.nameofIDCard, value: user!.nameofIDCard);
    maritalStatus = DropDownValueModel(
        name: user!.maritalStatut, value: user!.maritalStatut);
    avatarImg[0] = user!.avatar;

    notifyListeners();
  }

  setLoadingTrue() {
    loading = true;
    notifyListeners();
  }

  setLoadingFalse() {
    loading = false;
    notifyListeners();
  }

  addWholeSaler() async {
    setLoadingTrue();
    WholeSaler newWhole = WholeSaler(
        nameShop: shopWholeSaler.text,
        firstName: prenomWholeSaler.text,
        active: true,
        lastName: nomholeSaler.text,
        matricule: [],
        contry: contryWholeSaler,
        phone: phoneWholeSaler,
        id: "");

    wholeSaler = await fournisseurService.addWholeSaler(newWhole);
    listWholeSaler.add(newWhole);
    setLoadingFalse();
    notifyListeners();
  }

  updateUser() async {
    setLoadingTrue();
    user!.bvn = bvn.text;
    user!.cacName = cac.text;
    user!.cacNumber = cacNumber.text;
    user!.firstName = prenomI.text;
    user!.lastName = nomI.text;
    user!.maritalStatut = maritalStatus.value;
    user!.nameShop = nameShop.text;
    user!.nameofIDCard = nameOfCard.value;
    user!.numberfIDCard = numberCard.text;
    user!.typeOfCompany = typeOfCompagny.value;
    user = await fournisseurService.updateUser(user!);
    setLoadingFalse();
    notifyListeners();
  }
}
