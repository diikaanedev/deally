import 'dart:typed_data';

import 'package:deally/models/categorie_by_dii.dart';
import 'package:deally/models/pack-discounts-model.dart';
import 'package:deally/models/produit_by_dii.dart';
import 'package:deally/services/categories-service.dart';
import 'package:deally/services/product-services.dart';
import 'package:deally/utils/upload-file.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

class ProduitsBloc extends ChangeNotifier {
  CategorieServices categorieServices = CategorieServices();

  ProductService productService = ProductService();

  List<ProduitModel> listeProduct = [];

  ProduitModel? productAdd;

  int step = 0;

  ScrollController controllerCategorieSon = ScrollController();
  ScrollController controllerProducts = ScrollController();

  CategorieShopList? selectedCategorie;
  CategorieShopList? selectedCategorieSon;

  setSelectedCategorieSon(CategorieShopList s) {
    selectedCategorieSon = s;
    notifyListeners();
  }

  bool selectCatagorieError = false;

  List<CategorieShopList> listeCategories = [];

  List<CategorieShopList> listeCategoriesSon = [];
  List<CategorieShopList> listeCategoriesSonInnitial = [];
  CategorieShopList categorieInit =
      CategorieShopList(url: "", nom: "", nomFrench: "", id: "");

  bool selectedAdresseError = false;

  TextEditingController quantiteMin1 = TextEditingController();

  bool quantiteMin1Error = false;

  TextEditingController quantiteMax1 = TextEditingController();

  bool quantiteMax1Error = false;

  TextEditingController price1 = TextEditingController();

  bool price1Error = false;

  TextEditingController quantiteMin2 = TextEditingController();

  bool quantiteMin2Error = false;

  TextEditingController quantiteMax2 = TextEditingController();

  bool quantiteMax2Error = false;

  TextEditingController price2 = TextEditingController();

  bool price2Error = false;

  TextEditingController quantiteMin3 = TextEditingController();

  bool quantiteMin3Error = false;

  TextEditingController quantiteMax3 = TextEditingController();

  bool quantiteMax3Error = false;

  TextEditingController price3 = TextEditingController();

  bool price3Error = false;

  TextEditingController nom = TextEditingController();

  bool nomError = false;

  TextEditingController marque = TextEditingController();

  bool marqueError = false;

  TextEditingController description = TextEditingController();

  bool descriptionError = false;

  TextEditingController storage = TextEditingController();

  bool storageError = false;

  TextEditingController stock = TextEditingController();

  bool stockError = false;

  TextEditingController conservation = TextEditingController();

  List<PackDiscountsModel> packDiscount = [];

  bool isActif = true;

  int valid = 0;

  TextEditingController quantityPerItem = TextEditingController();

  DropDownValueModel volumeUnity =
      const DropDownValueModel(name: 'ml', value: "ml");

  List<dynamic> tabImg1 = [null, null];
  List<dynamic> tabImg2 = [null, null];
  List<dynamic> tabImg3 = [null, null];

  Uint8List? uploadedImage1;
  Uint8List? uploadedImage2;
  Uint8List? uploadedImage3;

  String? imageID1;
  String? imageID2;
  String? imageID3;

  bool tofError = false;

  int source = 1;

  ProduitsBloc() {
    getCategorieSonInitial();
    getProduitFournisseur();
    getCategories();
    controllerCategorieSon.addListener(() {
      if (controllerCategorieSon.position.pixels <= 0) {
        getCategorieSonInitial();
      }
    });
    controllerProducts.addListener(() {
      if (controllerProducts.position.pixels <= 0) {
        getProduitFournisseur();
      }
    });
  }

  setCategorieInit(CategorieShopList s) {
    categorieInit = s;
    notifyListeners();
  }

  getProduitFournisseur() async {
    listeProduct = await productService.listProducts();
    notifyListeners();
  }

  getImageProduit1() async {
    tabImg1 = await getImage(source);
    notifyListeners();
  }

  getImageProduit2() async {
    tabImg2 = await getImage(source);
    notifyListeners();
  }

  getImageProduit3() async {
    tabImg3 = await getImage(source);
    notifyListeners();
  }

  setSourceCam(int value) {
    source = value;
    notifyListeners();
  }

  setStep(int value) {
    step = value;
    notifyListeners();
  }

  getCategories() async {
    listeCategories = await categorieServices.getCategorie();
    notifyListeners();
  }

  getCategorieSonInitial() async {
    listeCategoriesSonInnitial =
        await categorieServices.getCategorieSonInitial();
    notifyListeners();
  }

  getCategorieSon(CategorieShopList categorie) async {
    selectedCategorie = categorie;
    listeCategoriesSon =
        await categorieServices.getCategorieSon(selectedCategorie!.id);
    notifyListeners();
  }

  setSelectedCategorie(CategorieShopList categorie) {
    selectedCategorie = categorie;
    notifyListeners();
  }

  setValid(int value) {
    valid = value;
    notifyListeners();
  }

  addProduct() async {
    setValid(1);
    if (tabImg1 == null) {
      tofError = true;
      valid = 2;
    }

    if (int.parse(quantiteMin1.text) > 1 &&
        int.parse(quantiteMin1.text) < int.parse(quantiteMax1.text)) {
      quantiteMin1Error = false;
    } else {
      valid = 2;
      step = 1;
      quantiteMin1Error = true;
    }

    if (int.parse(quantiteMax1.text) > int.parse(quantiteMin1.text)) {
      quantiteMax1Error = false;
    } else {
      valid = 2;
      step = 1;
      quantiteMax1Error = true;
    }

    if (int.parse(quantiteMax2.text) > int.parse(quantiteMin2.text)) {
      quantiteMax2Error = false;
    } else {
      valid = 2;
      step = 1;
      quantiteMax2Error = true;
    }

    if (int.parse(quantiteMin2.text) > int.parse(quantiteMax1.text) &&
        int.parse(quantiteMin2.text) < int.parse(quantiteMax2.text)) {
      quantiteMin2Error = false;
    } else {
      valid = 2;
      step = 1;
      quantiteMin2Error = true;
    }

    if (int.parse(quantiteMax3.text) > int.parse(quantiteMin3.text)) {
      quantiteMax3Error = false;
    } else {
      valid = 2;
      step = 1;
      quantiteMax3Error = true;
    }

    if (int.parse(quantiteMin3.text) > int.parse(quantiteMax2.text) &&
        int.parse(quantiteMin3.text) < int.parse(quantiteMax3.text)) {
      quantiteMin3Error = false;
    } else {
      valid = 2;
      step = 1;
      quantiteMin3Error = true;
    }

    if (int.parse(price1.text) >= 50) {
      price1Error = false;
    } else {
      valid = 2;
      step = 1;
      price1Error = true;
    }

    if (int.parse(price2.text) <= int.parse(price1.text)) {
      price2Error = false;
    } else {
      valid = 2;
      step = 1;
      price2Error = true;
    }

    if (int.parse(price3.text) <= int.parse(price2.text)) {
      price3Error = false;
    } else {
      valid = 2;
      step = 1;
      price3Error = true;
    }

    if (nom.text.isEmpty) {
      nomError = true;
      step = 1;
      valid = 2;
    }
    if (marque.text.isEmpty) {
      marqueError = true;
      step = 1;
      valid = 2;
    }
    if (description.text.isEmpty) {
      descriptionError = true;
      step = 1;
      valid = 2;
    }
    if (stock.text.isEmpty) {
      stockError = true;
      step = 1;
      valid = 2;
    }

    if (listeCategoriesSon.contains(selectedCategorieSon)) {
      selectCatagorieError = true;
      step = 0;
      valid = 2;
    }

    packDiscount.add(PackDiscountsModel(
        id: "1",
        min: int.parse(quantiteMin1.text),
        max: int.parse(quantiteMax1.text),
        price: int.parse(price1.text)));
    packDiscount.add(PackDiscountsModel(
        id: "2",
        min: int.parse(quantiteMin2.text),
        max: int.parse(quantiteMax2.text),
        price: int.parse(price2.text)));
    packDiscount.add(PackDiscountsModel(
        id: "3",
        min: int.parse(quantiteMin3.text),
        max: int.parse(quantiteMax3.text),
        price: int.parse(price3.text)));
    print(valid);
    if (valid == 1) {
      Map<String, dynamic> body = {
        "name": nom.text,
        "description": description.text,
        "category": selectedCategorie!.id,
        "price": 0,
        "images": [tabImg1[0], tabImg2[0], tabImg3[0]]
            .where(
              (element) => element != null,
            )
            .map((e) => e.toString())
            .toList(),
        "pack_discounts": packDiscount
            .map((e) => {"min": e.min, "max": e.max, "price": e.price})
            .toList(),
        "saleEnd":
            DateTime.now().add(const Duration(days: 365)).toIso8601String(),
        "stock": stock.text,
        "deliveryDelay": "2 à 7 jours",
        "brand": marque.text,
        "storageCondition": storage.text,
      };
      print(body);

      productAdd = await productService.addProducts(body);
      listeProduct.add(productAdd!);
      valid = 0;
      notifyListeners();
    }
  }
}
