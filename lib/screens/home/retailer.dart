// ignore_for_file: sort_child_properties_last

import 'package:deally/models/adress-model.dart';
import 'package:deally/models/categorie_by_dii.dart';
import 'package:deally/models/order-item-model.dart';
import 'package:deally/models/produit_by_dii.dart';
import 'package:deally/utils/close-app.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:deally/utils/price-format.dart';
import 'package:deally/utils/requette-by-dii.dart';
import 'package:deally/widgets/adresse/retailer/adresse-retailer.dart';
import 'package:deally/widgets/adresse/retailer/adresse-screen-retailer.dart';
import 'package:deally/widgets/btn/btn-broder-round.dart';
import 'package:deally/widgets/btn/btn-compte.dart';
import 'package:deally/widgets/caterogries/retailer/categorie-categorie-retailer.dart';
import 'package:deally/widgets/caterogries/retailer/categorie-home-retailer.dart';
import 'package:deally/widgets/company/retailer/company-screen-retailer.dart';
import 'package:deally/widgets/filters-retailer-brand/retailer/filter-retailer.dart';
import 'package:deally/widgets/general-term-use/retailer/general-term-use-screen-retailer.dart';
import 'package:deally/widgets/menu/bottom-navigation.dart';
import 'package:deally/widgets/orders/retailer/product-item-retailer.dart';
import 'package:deally/widgets/orders/retailer/suivi-cmd-retailer.dart';
import 'package:deally/widgets/paiement/retailer/mean-of-paiement-screen-retailer.dart';
import 'package:deally/widgets/paiement/retailer/paiement-retailer.dart';
import 'package:deally/widgets/products/retailer/home-retailer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

// ignore: library_private_types_in_public_api
late _HomeRetailerState homeRetailerState;

class HomeRetailer extends StatefulWidget {
  const HomeRetailer({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<HomeRetailer> createState() {
    homeRetailerState = _HomeRetailerState();
    return homeRetailerState;
  }
}

class _HomeRetailerState extends State<HomeRetailer> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  late Size size;
  int selectedIndex = 0;
  List<Container> listeWidget = [];
  List<ProduitModel> listeProduct = [];
  String nameShop = "";
  List<CategorieShopList> listeCategories = [];
  List<CategorieShopList> listeCategoriesParents = [];
  String url = "";
  List<OrderItemModel> listeOrder = [];
  int selectProductDel = 0;

  String contry = "";

  var publicKey = 'pk_test_6104b6fa33e41815c32981583ef6ad2c6f5b7dc4';
  // final plugin = PaystackPlugin();
  String assetUlr = "assets/images/banktrfrr.png";
  int choixPaiement = 0;
  String title = "Pay with bank transfer at delivery";
  String subTitle = "UBA (Deally) : 2174858061";
  int priceTotalPannier = 0;
  // late WebViewXController controller;
  int langue = 1;

  List<AdresseModel> address = [];

  List<OrderItemModel> listeOrderItems = [];

  bool noCat = true;

  String appTitle = "";

  @override
  void initState() {
    super.initState();

    getInfo();
    // getCategorie();
    // getCategorieParent();
    getCommande();
    // plugin.initialize(publicKey: publicKey);
    getAssetUrlPaiement();
    getListOrderItem();
    getAddressDefault();
  }

  getAssetUrlPaiement() async {
    await SharedPreferences.getInstance().then((prefs) {
      print(prefs.getInt("paiement_method"));
      if (prefs.containsKey("paiement_method")) {
        if (prefs.getInt("paiement_method") == 0) {
          setState(() {
            assetUlr = "assets/images/banktrfrr.png";
            choixPaiement = 0;
            title = "Pay with bank transfer at delivery";
            subTitle = "UBA (Deally) : 2174858061";
          });
        }
        if (prefs.getInt("paiement_method") == 1) {
          setState(() {
            assetUlr = "assets/images/pos-removebg-preview.png";
            title = "Pay with POS at delivery";
            choixPaiement = 1;
            subTitle = "";
          });
        }
        if (prefs.getInt("paiement_method") == 2) {
          setState(() {
            assetUlr = "assets/images/cash-removebg-preview.png";
            choixPaiement = 2;
            title = "Cash Payment at Delivery";
            subTitle = "";
          });
        }
        if (prefs.getInt("paiement_method") == 3) {
          setState(() {
            assetUlr = "assets/images/advans_logo.png";
            choixPaiement = 3;
            title = "Pay by microfinancing";
            subTitle = "To be validate within 3 days by our partner";
          });
        }
      } else {
        setState(() {
          assetUlr = "assets/images/advans_logo.png";
          title = "Pay by microfinancing";
          subTitle = "To be validate within 3 days by our partner";
        });
      }
    });
  }

  getListOrderItem() async {
    await getResponse(url: "/order-items").then((value) {
      print(value);
      setState(() {
        listeOrderItems = [];
        listeOrderItems = OrderItemModel.fromList(data: value['data']);
      });
    });
    for (var item in listeOrderItems) {
      setState(() {
        priceTotalPannier += item.price;
      });
    }
  }

  getAddressDefault() async {
    await getResponse(url: '/address/meDefault').then((value) => setState(() {
          address = AdresseModel.fromJson(data: value['data']);
        }));
  }

  getInfo() async {
    await getResponse(url: "/users").then((value) => setState(() {
          contry = value['data']['user']['contry'];
          langue = value['data']['user']['contry'] == 'Nigeria' ? 1 : 2;
          appTitle =
              langue == 1 ? "Choose category" : "Choisissez la catégorie";
          nameShop = value['data']['user']['firstName'];
        }));
    getCategorie();
    getProduct();
    getCategorieParent();
  }

  getCategorie() async {
    await getResponse(
            url:
                "/categories/sonByContry?contry=${contry == 'Nigeria' ? 'NG' : contry == 'Guinee' ? 'GN' : contry == 'Senegal' ? 'SN' : 'CI'}")
        .then((value) => setState(() {
              listeCategories =
                  CategorieShopList.fromCategorie(data: value['data']);
            }));
  }

  getCategorieParent() async {
    await getResponse(
            url:
                "/categories/parentByContry?contry=${contry == 'Nigeria' ? 'NG' : contry == 'Guinee' ? 'GN' : contry == 'Senegal' ? 'SN' : 'CI'}")
        .then((value) => setState((() {
              listeCategoriesParents =
                  CategorieShopList.fromCategorie(data: value['data']);
            })));
  }

  getProduct() async {
    await getResponse(
            url:
                '/products/contry?contry=${contry == 'Nigeria' ? 'NG' : contry == 'Guinee' ? 'GN' : contry == 'Senegal' ? 'SN' : 'CI'}')
        .then((value) {
      setState(() {
        listeProduct = [];
      });
      setState(() {
        listeProduct = ProduitModel.fromJson(data: value['data']);
        if (listeProduct.length == 0) {
          setState(() {
            noCat = false;
          });
        }
        listeWidget = listeProduct
            .map(
              (e) => Container(
                width: size.width * .45,
                child: Center(
                    child: HomeRetailerProduct(
                  produitModel: e,
                )),
              ),
            )
            .toList();

        listeWidget.add(Container(
          width: size.width * .45,
        ));
        listeWidget.add(Container(
          width: size.width * .45,
        ));
      });
    });
  }

  getProductByCategorie(String url) async {
    print('getProductByCategorie');
    await getResponse(
            url:
                '/products/categorie?contry=${contry == 'Nigeria' ? 'NG' : contry == 'Guinee' ? 'GN' : contry == 'Senegal' ? 'SN' : 'CI'}&cat=' +
                    url)
        .then((value) {
      print(value['data']);
      setState(() {
        listeProduct = ProduitModel.fromJson(data: value['data']);
        listeWidget = listeProduct
            .map(
              (e) => Container(
                width: size.width * .45,
                child: Center(
                    child: HomeRetailerProduct(
                  produitModel: e,
                )),
              ),
            )
            .toList();

        listeWidget.add(Container(
          width: size.width * .45,
        ));
        listeWidget.add(Container(
          width: size.width * .45,
        ));
      });
    });
  }

  getProductFamilly({required String url}) async {
    await getResponse(url: '/products/$url').then((value) {
      print(value['data']);
      setState(() {
        listeProduct = [];
        noCat = true;
      });
      setState(() {
        listeProduct = ProduitModel.fromJson(data: value['data']);
        if (listeProduct.length == 0) {
          setState(() {
            noCat = false;
          });
        }
        listeWidget = listeProduct
            .map(
              (e) => Container(
                width: size.width * .45,
                child: Center(
                    child: HomeRetailerProduct(
                  produitModel: e,
                )),
              ),
            )
            .toList();

        listeWidget.add(Container(
          width: size.width * .45,
        ));
        listeWidget.add(Container(
          width: size.width * .45,
        ));
      });
    });
  }

  getCategoriesFamilly({required String url}) async {
    await getResponse(url: "/categories/son?category=$url")
        .then((value) => setState(() {
              listeCategories =
                  CategorieShopList.fromCategorie(data: value['data']);
            }));
  }

  getCommande() async {
    await getResponse(url: '/order-items/orderClient').then((value) {
      print(value['data']);
      setState(() {
        listeOrder = [];
        listeOrder = OrderItemModel.fromList(data: value['data']);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () => onpressKit(context),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: blanc,
        appBar: AppBar(
          backgroundColor: meuveFonce,
          elevation: .0,
          centerTitle: true,
          title: Text(
            appTitle,
            style: TextStyle(
                fontSize: size.width * .05,
                color: blanc,
                fontWeight: FontWeight.w400),
          ),
        ),
        bottomNavigationBar: MenuButton(
            selectIndex: selectedIndex,
            ontap: (value) {
              if (value == 0) {
                setState(() {
                  appTitle = langue == 1
                      ? "Choose category"
                      : "Choisissez la catégorie";
                });
              } else if (value == 1) {
                setState(() {
                  appTitle = langue == 1 ? "My order" : "Ma commande";
                });
              } else if (value == 2) {
                setState(() {
                  appTitle = langue == 1
                      ? "Order history"
                      : "Historique des commandes";
                });
              } else {
                setState(() {
                  appTitle = langue == 1 ? "My account" : "Mon compte";
                });
              }
              setState(() {
                selectedIndex = value;
              });
              print(value);
            }),
        body: selectedIndex == 0
            ? ListView(children: [
                Container(
                  height: size.height * .2,
                  width: size.width,
                  // color: rouge.withOpacity(.2),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: listeCategories
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              // color: rouge,
                              width: size.width * .3,
                              child: CategorieHomeRetailerWidget(
                                categorieShopList: e,
                                isActif: false,
                                ontap: () async {
                                  var d = url.split('|');

                                  if (d.contains(e.id)) {
                                    print("here we are ");
                                    setState(() {
                                      d.removeWhere(
                                          (element) => element == e.id);

                                      url = d.join('|');
                                    });
                                  } else {
                                    print("here we are  not ere");
                                    setState(() {
                                      url += e.id + '|';
                                    });
                                  }

                                  print(d);
                                  print(url);
                                  if (url.length > 0) {
                                    await getProductByCategorie(url);
                                    if (listeProduct.length == 0) {
                                      setState(() {
                                        noCat = false;
                                      });
                                    } else {
                                      setState(() {
                                        noCat = true;
                                      });
                                    }
                                  } else {
                                    setState(() {
                                      noCat = true;
                                    });
                                    getProduct();
                                    getCategorie();
                                  }
                                },
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: size.width * .02,
                    ),
                    SizedBox(
                      width: size.width * .8,
                      child: Text(
                        noCat
                            ? langue == 1
                                ? 'Best offer on this category'
                                : "Meilleure offre sur cette catégorie"
                            : langue == 1
                                ? 'No product is available now'
                                : "Aucun produit n'est disponible  pour le moment",
                        style: TextStyle(
                            fontSize: size.width * .04,
                            color: meuveFonce,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      // ignore: sort_child_properties_last
                      icon: Icon(CupertinoIcons.line_horizontal_3_decrease),
                      // ignore: avoid_returning_null_for_void
                      onPressed: () => showCupertinoModalBottomSheet(
                        context: context,
                        builder: (context) => SizedBox(
                            // width: size.width * .03,s
                            height: size.height * .6,
                            child: FilterRetailerWidget(
                              categoriesParents: listeCategoriesParents,
                            )),
                      ),
                    ),
                    SizedBox(
                      width: size.width * .02,
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                Container(
                  height: size.height * .565,
                  width: size.width * .95,
                  // color: rouge,
                  child: RefreshIndicator(
                    onRefresh: () async {
                      return getProduct();
                    },
                    child: GridView.count(
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: .7,
                      physics: const BouncingScrollPhysics(),
                      crossAxisCount: 2,
                      children: listeWidget,
                    ),
                  ),
                ),
              ])
            : selectedIndex == 1
                ? ListView(
                    children: [
                      SizedBox(
                        height: size.height * .83,
                        // color: rouge,
                        child: LayoutBuilder(
                          builder: (context, constraints) => Stack(
                            children: [
                              Positioned(
                                top: 0,
                                child: SizedBox(
                                  // color: rouge,
                                  height: constraints.maxHeight,
                                  width: constraints.maxWidth,
                                  child: ListView(
                                    physics: const BouncingScrollPhysics(),
                                    children: [
                                      SizedBox(
                                        height: constraints.maxHeight * .02,
                                      ),
                                      Center(
                                        child: GestureDetector(
                                          onTap: () => showCupertinoModalBottomSheet(
                                              context: context,
                                              builder: (context) => SizedBox(
                                                  height: size.height * .7,
                                                  child:
                                                      const AdresseScreenRetailerWidget())),
                                          child: Container(
                                            height: constraints.maxHeight * .12,
                                            width: constraints.maxWidth * .9,
                                            decoration: BoxDecoration(
                                                color: gris,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        constraints.maxWidth *
                                                            .05)),
                                            child: AdresseRetailerWidget(
                                              ontap: () => null,
                                              adresse: address.isNotEmpty
                                                  ? address.first
                                                  : const AdresseModel(
                                                      id: "",
                                                      name: "",
                                                      addr1: "",
                                                      addr2: "",
                                                      city: "",
                                                      contry: "",
                                                      zipcode: "",
                                                      phoneNumber: "",
                                                      firstName: "",
                                                      lastName: "",
                                                      isDefault: false,
                                                      isMap: false),
                                              haveAddress: address.isNotEmpty,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: constraints.maxHeight * .02,
                                      ),
                                      Center(
                                        child: GestureDetector(
                                          onTap: () => showCupertinoModalBottomSheet(
                                              context: context,
                                              builder: (context) => SizedBox(
                                                  height: size.height * .7,
                                                  child:
                                                      const MeanOfPaiementScreenRetailer())),
                                          child: Container(
                                            height: constraints.maxHeight * .15,
                                            width: constraints.maxWidth * .9,
                                            child: MoyenPayementRetailerWidget(
                                              asseturl: assetUlr,
                                              subTitle: subTitle,
                                              title: title,
                                            ),
                                            decoration: BoxDecoration(
                                                color: gris,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        constraints.maxWidth *
                                                            .05)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: constraints.maxHeight * .02,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: constraints.maxWidth * .07,
                                          ),
                                          Text(
                                            langue == 1
                                                ? "Products"
                                                : "Produits",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize:
                                                    constraints.maxWidth * .04),
                                          ),
                                          const Spacer(),
                                          GestureDetector(
                                            onTap: () {
                                              if (selectProductDel == 1) {
                                                setState(() {
                                                  selectProductDel = 0;
                                                });
                                              } else {
                                                setState(() {
                                                  selectProductDel = 1;
                                                });
                                              }
                                            },
                                            child: Text(
                                              selectProductDel == 1
                                                  ? langue == 1
                                                      ? "Cancel"
                                                      : "Annuler"
                                                  : langue == 1
                                                      ? " Delete "
                                                      : "Effacer",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  color: selectProductDel == 1
                                                      ? meuveFonce
                                                      : rouge,
                                                  fontSize:
                                                      constraints.maxWidth *
                                                          .04),
                                            ),
                                          ),
                                          SizedBox(
                                            width: constraints.maxWidth * .07,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: constraints.maxHeight * .02,
                                      ),
                                      if (listeOrderItems.isEmpty)
                                        Column(
                                          children: [
                                            SizedBox(
                                              height:
                                                  constraints.maxHeight * .1,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(langue == 1
                                                  ? 'No items selected'
                                                  : "Aucun élément sélectionné"),
                                            ),
                                          ],
                                        ),
                                      if (listeOrderItems.isNotEmpty)
                                        Column(
                                          children: listeOrderItems
                                              .map(
                                                (e) => Column(
                                                  children: [
                                                    Center(
                                                      child: Container(
                                                        height: constraints
                                                                .maxHeight *
                                                            .15,
                                                        width: constraints
                                                            .maxWidth,
                                                        child:
                                                            ProduitItemWidgetOrderRetailer(
                                                          orderItemModel: e,
                                                          isSelectable:
                                                              selectProductDel,
                                                        ),
                                                        decoration: BoxDecoration(
                                                            color: blanc,
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    constraints
                                                                            .maxWidth *
                                                                        .05)),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: size.height * .02,
                                                    )
                                                  ],
                                                ),
                                              )
                                              .toList(),
                                        ),
                                      SizedBox(
                                        height: size.height * .07,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                  bottom: constraints.maxHeight * .0,
                                  left: constraints.maxWidth * .05,
                                  right: constraints.maxWidth * .05,
                                  child: Container(
                                    height: constraints.maxHeight * .25,
                                    width: constraints.maxWidth,
                                    color: gris.withOpacity(.1),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: constraints.maxHeight * .01,
                                        ),
                                        Expanded(
                                            child: Container(
                                          // ignore: sort_child_properties_last
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width:
                                                    constraints.maxWidth * .05,
                                              ),
                                              Text(
                                                'Service Fee',
                                                style: TextStyle(
                                                    fontSize:
                                                        constraints.maxWidth *
                                                            .027,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                              Spacer(),
                                              SizedBox(
                                                width:
                                                    constraints.maxWidth * .05,
                                              ),
                                              Text(
                                                '${(priceTotalPannier * .22).round()} ${priceDevice(contry)}',
                                                style: TextStyle(
                                                    fontSize:
                                                        constraints.maxWidth *
                                                            .030,
                                                    fontWeight: FontWeight.w300,
                                                    color: noir),
                                              ),
                                              SizedBox(
                                                width:
                                                    constraints.maxWidth * .05,
                                              )
                                            ],
                                          ),
                                          decoration: BoxDecoration(
                                              color: gris,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                        )),
                                        SizedBox(
                                          height: size.height * .01,
                                        ),
                                        Expanded(
                                            child: Container(
                                          // ignore: sort_child_properties_last
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width:
                                                    constraints.maxWidth * .05,
                                              ),
                                              Text(
                                                'Total',
                                                style: TextStyle(
                                                    fontSize:
                                                        constraints.maxWidth *
                                                            .03,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                              Spacer(),
                                              SizedBox(
                                                width:
                                                    constraints.maxWidth * .05,
                                              ),
                                              Text(
                                                '${priceTotalPannier + (priceTotalPannier * .22).round()} ${priceDevice(contry)}',
                                                style: TextStyle(
                                                    fontSize:
                                                        constraints.maxWidth *
                                                            .030,
                                                    fontWeight: FontWeight.w300,
                                                    color: meuveFonce),
                                              ),
                                              SizedBox(
                                                width:
                                                    constraints.maxWidth * .05,
                                              )
                                            ],
                                          ),
                                          decoration: BoxDecoration(
                                              color: gris,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                        )),
                                        SizedBox(
                                          height: constraints.maxHeight * .01,
                                        ),
                                        Expanded(
                                            child: BtnBorderRound(
                                          haveBg: true,
                                          bgActif: true,
                                          titre: langue == 1
                                              ? "Pay now "
                                              : "Payez maintenant",
                                          onTap: () async {
                                            if (listeOrderItems.isEmpty) {
                                              setState(() {
                                                selectedIndex = 0;
                                              });
                                            } else {
                                              const uuid = Uuid();
                                              if (address.isNotEmpty) {
                                                if (choixPaiement == 0) {
                                                  // Charge charge = Charge()
                                                  //   ..amount =
                                                  //       (priceTotalPannier +
                                                  //           (priceTotalPannier *
                                                  //                   .22)
                                                  //               .round())
                                                  //   ..reference = uuid.v4()
                                                  //   ..email =
                                                  //       'diikaanedev@gmail.com';
                                                  // CheckoutResponse response =
                                                  //     await plugin.checkout(
                                                  //   context,
                                                  //   method: CheckoutMethod
                                                  //       .card, // Defaults to CheckoutMethod.selectable
                                                  //   charge: charge,
                                                  // );

                                                  // print(response.message);
                                                  // print(response.status);
                                                  // print(response.reference);
                                                  // await postResponse(
                                                  //     url: '/orders',
                                                  //     body: {
                                                  //       "livraison":
                                                  //           address.first.id,
                                                  //       "typePaiment":
                                                  //           choixPaiement,
                                                  //       "refPaid":
                                                  //           response.reference,
                                                  //       "paiStatus": response
                                                  //           .status
                                                  //           .toString(),
                                                  //       "items": listeOrderItems
                                                  //           .map((e) => e.id)
                                                  //           .toList(),
                                                  //       "amount":
                                                  //           (priceTotalPannier +
                                                  //                   (priceTotalPannier *
                                                  //                           .22)
                                                  //                       .round())
                                                  //               .toString(),
                                                  //     }).then((value) async {
                                                  //   homeRetailerState
                                                  //       .getCommande();
                                                  //   setState(() {
                                                  //     selectedIndex = 0;
                                                  //   });
                                                  // });
                                                } else {
                                                  await postResponse(
                                                      url: '/orders',
                                                      body: {
                                                        "livraison":
                                                            address.first.id,
                                                        "typePaiment":
                                                            choixPaiement,
                                                        "items": listeOrderItems
                                                            .map((e) => e.id)
                                                            .toList(),
                                                        "amount":
                                                            (priceTotalPannier +
                                                                    (priceTotalPannier *
                                                                            .22)
                                                                        .round())
                                                                .toString(),
                                                      }).then((value) async {
                                                    print(value['body']);
                                                    homeRetailerState
                                                        .getCommande();
                                                    setState(() {
                                                      selectedIndex = 0;
                                                    });
                                                  });
                                                }
                                              } else {
                                                showCupertinoModalBottomSheet(
                                                    context: context,
                                                    builder: (context) => SizedBox(
                                                        height:
                                                            size.height * .7,
                                                        child:
                                                            const AdresseScreenRetailerWidget()));
                                              }
                                            }
                                          },
                                        )),
                                        SizedBox(
                                          height: size.height * .01,
                                        ),
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : selectedIndex == 2
                    ? ListView(
                        children: [
                          SizedBox(
                            height: size.height * .83,
                            child: GridView.count(
                              crossAxisSpacing: 8,
                              crossAxisCount: 2,
                              mainAxisSpacing: 8,
                              childAspectRatio: .8,
                              padding: const EdgeInsets.all(8),
                              physics: const BouncingScrollPhysics(),
                              children: listeOrder.reversed
                                  .map(
                                    (e) => Container(
                                      decoration: BoxDecoration(
                                          color: gris,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: SuiviCmdeRetailerWidget(
                                        order: e,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          )
                        ],
                      )
                    : ListView(
                        children: [
                          SizedBox(
                            height: size.height * .83,
                            width: size.width,
                            child: ListView(
                              physics: const BouncingScrollPhysics(),
                              children: [
                                SizedBox(
                                  height: size.height * .02,
                                ),
                                SizedBox(
                                  height: size.height * .3,
                                  width: size.width,
                                  child: Column(
                                    children: [
                                      const Spacer(),
                                      Row(
                                        children: [
                                          Spacer(),
                                          Container(
                                            height: size.height * .25,
                                            width: size.width * .6,
                                            child: Icon(
                                                CupertinoIcons.building_2_fill,
                                                color: meuveFonce,
                                                size: size.height * .15),
                                            decoration: BoxDecoration(
                                                color: gris.withOpacity(.3),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        size.height)),
                                          ),
                                          Spacer(),
                                        ],
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * .02,
                                ),
                                Center(
                                  child: Container(
                                    height: size.height * .06,
                                    width: size.width * .9,
                                    child: BtnWidgetCompte(
                                        onTap: () => showCupertinoModalBottomSheet(
                                            context: context,
                                            builder: (context) => SizedBox(
                                                height: size.height * .9,
                                                child:
                                                    const CompanyScreenRetailer())),
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             const InfoPersonnel())),
                                        text: homeRetailerState.langue == 1
                                            ? "My company profile"
                                            : "Mon profil d'entreprise",
                                        bgColor: gris.withOpacity(.4)),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * .02,
                                ),
                                SizedBox(
                                  height: size.height * .05,
                                ),
                                Container(
                                  color: gris.withOpacity(.4),
                                  width: size.width,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: size.height * .02,
                                      ),
                                      Center(
                                        child: Container(
                                          height: size.height * .06,
                                          width: size.width * .9,
                                          child: BtnWidgetCompte(
                                              onTap: () =>
                                                  showCupertinoModalBottomSheet(
                                                      context: context,
                                                      builder: (context) =>
                                                          SizedBox(
                                                              height:
                                                                  size.height *
                                                                      .9,
                                                              child:
                                                                  GeneralTermUseRetailer(
                                                                title: langue ==
                                                                        1
                                                                    ? "General terms of use"
                                                                    : "Conditions générales d'utilisation",
                                                              ))),
                                              // Navigator.push(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //         builder: (context) =>
                                              //             const PolitiqueConfidentialite(
                                              //               title:
                                              //                   "General terms of use",
                                              //             ))),
                                              text: langue == 1
                                                  ? "General terms of use"
                                                  : "Conditions générales d'utilisation",
                                              bgColor: blanc),
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * .02,
                                      ),
                                      Center(
                                        child: Container(
                                          height: size.height * .06,
                                          width: size.width * .9,
                                          child: BtnWidgetCompte(
                                              onTap: () =>
                                                  showCupertinoModalBottomSheet(
                                                      context: context,
                                                      builder: (context) =>
                                                          SizedBox(
                                                              height:
                                                                  size.height *
                                                                      .9,
                                                              child:
                                                                  GeneralTermUseRetailer(
                                                                title: langue ==
                                                                        1
                                                                    ? "Privacy Policy"
                                                                    : "Politique de confidentialité",
                                                              ))),
                                              // Navigator.push(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //         builder: (context) =>
                                              //             const PolitiqueConfidentialite(
                                              //               title: "Privacy Policy",
                                              //             ))),
                                              text: langue == 1
                                                  ? "Privacy Policy"
                                                  : "Politique de confidentialité",
                                              bgColor: blanc),
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * .02,
                                      ),
                                      Center(
                                        child: Container(
                                          height: size.height * .06,
                                          width: size.width * .9,
                                          child: BtnWidgetCompte(
                                              onTap: () =>
                                                  showCupertinoModalBottomSheet(
                                                      context: context,
                                                      builder: (context) =>
                                                          SizedBox(
                                                              height:
                                                                  size.height *
                                                                      .9,
                                                              child:
                                                                  GeneralTermUseRetailer(
                                                                title: langue ==
                                                                        1
                                                                    ? "Terms of purchase"
                                                                    : "Conditions d'achat",
                                                              ))),
                                              text: langue == 1
                                                  ? "Terms of purchase"
                                                  : "Conditions d'achat",
                                              bgColor: blanc),
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * .02,
                                      ),
                                      Center(
                                        child: Container(
                                          height: size.height * .06,
                                          width: size.width * .9,
                                          child: BtnWidgetCompte(
                                              onTap: () =>
                                                  showCupertinoModalBottomSheet(
                                                      context: context,
                                                      builder: (context) =>
                                                          SizedBox(
                                                              height:
                                                                  size.height *
                                                                      .9,
                                                              child:
                                                                  GeneralTermUseRetailer(
                                                                title: langue ==
                                                                        1
                                                                    ? "Cookies policy"
                                                                    : "Politique des cookies",
                                                              ))),
                                              text: langue == 1
                                                  ? "Cookies policy"
                                                  : "Politique des cookies",
                                              bgColor: blanc),
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * .02,
                                      ),
                                      Center(
                                        child: Container(
                                          height: size.height * .06,
                                          width: size.width * .9,
                                          child: BtnBorderRound(
                                            onTap: () async {
                                              SharedPreferences.getInstance()
                                                  .then((prefs) {
                                                prefs.clear();
                                                Navigator.popAndPushNamed(
                                                    context, "/");
                                              });
                                            },
                                            titre: langue == 1
                                                ? "Log Out"
                                                : "Se deconecter",
                                            haveBg: true,
                                            bgActif: true,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * .02,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * .05,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
      ),
    );
  }
}
