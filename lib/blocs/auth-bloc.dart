import 'package:deally/models/auth-model.dart';
import 'package:deally/services/auth-services.dart';
import 'package:flutter/material.dart';

class UserBlock with ChangeNotifier {
  AuthModel? user;

  bool isInvalidIdentifiant = false;

  String codeSMS = "";

  String? stringConexion = "";

  String? role;

  String? phone;

  String? contry = "guinee";

  String? password;

  String? confirmPassword;

  String? firstName;

  String? lastName;

  String? sexe;

  int pageRegister = 0;

  bool? telUse;

  bool isLoding = false;

  bool? isCheckCondition;

  bool? isCheckInformations;

  AuthService authService = AuthService();

  UserBlock() {
    telUse = false;
    isCheckCondition = false;
    isCheckInformations = false;
    role = "";
    phone = "";
    password = "";
    sexe = "homme";
    stringConexion = "";
    confirmPassword = "";
    firstName = "";
    lastName = "";
    contry = "guinee";
    user = AuthModel(
      id: "",
      token: "",
      phone: "",
      role: "",
      sexe: "",
      firstName: "",
      lastName: "",
      contry: "",
    );
  }

  setSexe(String value) {
    sexe = value;
    notifyListeners();
  }

  setPassword(String value) {
    password = value;
    notifyListeners();
  }

  setTelUse() {
    telUse = true;
    notifyListeners();
  }

  setIsLoadingTrue() {
    isLoding = true;
    notifyListeners();
  }

  setIsLoadingFalse() {
    isLoding = false;
    notifyListeners();
  }

  setIsCheckCondition() {
    isCheckCondition = !isCheckCondition!;
    notifyListeners();
  }

  setIsCheckInformations() {
    isCheckInformations = !isCheckInformations!;
    notifyListeners();
  }

  setConfirmPassword(String value) {
    confirmPassword = value;
    notifyListeners();
  }

  setFirtsName(String value) {
    firstName = value;
    notifyListeners();
  }

  setLastName(String value) {
    lastName = value;
    notifyListeners();
  }

  setRole(String roles) {
    role = roles;
    notifyListeners();
  }

  setPhone(String phones) {
    phone = phones;
    notifyListeners();
  }

  setContry(String contrys) {
    contry = contrys;
    notifyListeners();
  }

  incrementPageRegister() {
    pageRegister = pageRegister + 1;
    notifyListeners();
  }

  decrementPageRegister() {
    pageRegister = pageRegister - 1;
    notifyListeners();
  }

  setCodeSms(String v) {
    codeSMS = v;
    notifyListeners();
  }

  setIsInvalidIdentifiantFalse() {
    isInvalidIdentifiant = true;
    notifyListeners();
  }

  conexion() async {
    stringConexion = await authService.auth(phone!, password!);
    if (stringConexion == null) {
      isInvalidIdentifiant = true;
    }
    notifyListeners();
  }

  addUser() async {
    AuthModel userModel = AuthModel(
      phone: phone!,
      role: role!,
      sexe: sexe!,
      firstName: firstName!,
      lastName: lastName!,
      contry: contry!,
      password: password!,
      id: '',
      token: '',
    );
    stringConexion = await authService.add(userModel);
    notifyListeners();
  }

  getCodeUser() async {
    codeSMS = await authService.getCode(phone!);
    notifyListeners();
  }

  verifCode() async {
    codeSMS = await authService.veirfCode(codeSMS);
    notifyListeners();
  }
}
