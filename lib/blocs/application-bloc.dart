import 'package:flutter/material.dart';

class ApplicationBloc with ChangeNotifier {
  //attribut
  int selectedIndex = 0; // menu index
  int langue = 1; // langue use 1=> 'en' 2 => 'fr'
  String appTitle = "";

  bool floatingBtnClientDriver = false;

  bool menuDriverOpen = false;

  //constructor
  ApplicationBloc() {
    setSelectedIndexFournisseur(selectedIndex);
    setSelectedIndexComercant(selectedIndex);
    setSelectedIndexWholeSaler(selectedIndex);
  }

  setSelectedIndexComercant(int value) {
    selectedIndex = value;
    if (value == 0) {
      setTitleApp(['Dashbord', 'Dashbord']);
    } else if (value == 1) {
      setTitleApp(['Order history', 'Historique des commandes']);
    } else if (value == 2) {
      setTitleApp(['Products', 'Produits']);
    } else {
      setTitleApp(['My account', 'Mon compte']);
    }
    notifyListeners();
  }

  setSelectedIndexFournisseur(int value) {
    selectedIndex = value;
    if (value == 0) {
      setTitleApp(['Dashbord', 'Dashbord']);
    } else if (value == 1) {
      setTitleApp(['Wholesaler', 'Grossiste']);
    } else if (value == 2) {
      setTitleApp(['Catalogues', 'Catalogues']);
    } else {
      setTitleApp(['My account', 'Mon compte']);
    }
    notifyListeners();
  }

  setSelectedIndexWholeSaler(int value) {
    selectedIndex = value;
    if (value == 0) {
      setTitleApp(['Dashbord', 'Dashbord']);
    } else if (value == 1) {
      setTitleApp(['Orders - Wholesaler', 'Commandes - Grossiste']);
    } else if (value == 2) {
      setTitleApp(['Products - Wholesaler', 'Produits - Grossiste']);
    } else {
      setTitleApp(['My account  - Wholesaler', 'Mon compte - Grossiste']);
    }
    notifyListeners();
  }

  setTitleApp(List v) {
    appTitle = langue == 1 ? v[0] : v[1];
    notifyListeners();
  }

  setLangue(int i) {
    langue = i;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
