import 'package:deally/models/order-model.dart';
import 'package:deally/models/produit_by_dii.dart';
import 'package:deally/models/revenue.dart';
import 'package:deally/utils/close-app.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:deally/utils/price-format.dart';
import 'package:deally/utils/requette-by-dii.dart';
import 'package:deally/widgets/adresse/brand-owner/adresse-screen-brand-owner.dart';
import 'package:deally/widgets/btn/btn-broder-round.dart';
import 'package:deally/widgets/btn/btn-compte.dart';
import 'package:deally/widgets/company/brand-owner/compagny-screen-brand-owner.dart';
import 'package:deally/widgets/company/retailer/company-screen-retailer.dart';
import 'package:deally/widgets/general-term-use/retailer/general-term-use-screen-retailer.dart';
import 'package:deally/widgets/menu/bottom-navigation.dart';
import 'package:deally/widgets/orders/brand-owner/order-to-prepare-brand-owner.dart';
import 'package:deally/widgets/products/brand-owner/add-product-brand-owner.dart';
import 'package:deally/widgets/products/brand-owner/home-brand-owner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:shared_preferences/shared_preferences.dart';

late _HomeBrandOwnerState homeBrandOwnerState;

class HomeBrandOwner extends StatefulWidget {
  const HomeBrandOwner({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<HomeBrandOwner> createState() {
    homeBrandOwnerState = _HomeBrandOwnerState();
    return homeBrandOwnerState;
  }
}

class _HomeBrandOwnerState extends State<HomeBrandOwner> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int selectIndex = 0;
  late Size size;
  List<ProduitModel> listeProduct = [];
  List<Widget> liste = [];

  String nameCompagny = "";

  int langue = 1;

  int i = 1;
  int choix = 1;
  int bankTranfert = 0;
  int confirmed = 0;
  int total = 0;
  String contry = "";

  // TODO : Nobre orders

  int bankNumber = 0;
  int confirmedNumber = 0;

  List<OrderModel> orders = [];

  int choixPrepare = 2;
  List<OrderModel> ordersPrepare = [];

  getInfo() async {
    setState(() {
      nameCompagny = "";
    });
    await getResponse(url: "/users").then((value) {
      setState(() {
        nameCompagny = value['data']['user']['nameShop'];
        contry = value['data']['user']['contry'];
        langue = value['data']['user']['contry'] == 'Nigeria' ? 1 : 2;
      });
    });
  }

  getOrderPrepare() async {
    await getResponse(url: '/order-items/orderShop')
        .then((value) => setState(() {
              ordersPrepare = OrderModel.fromJson(data: value['data']);
            }));
  }

  getProduct() async {
    await getResponse(url: '/products/shop').then((value) {
      setState(() {
        listeProduct = [];
        listeProduct = ProduitModel.fromJson(data: value['data']);
        liste = listeProduct
            .map(
              (e) => SizedBox(
                width: size.width * .45,
                child: Center(
                    child: HomeBrandOwnerProduct(
                  produitModel: e,
                )),
              ),
            )
            .toList();

        liste.add(SizedBox(
          width: size.width * .45,
          height: size.height * .1,
        ));
      });
    });
  }

  getWallet() async {
    await getResponse(url: '/order-items/orderShop')
        .then((value) => setState(() {
              orders = OrderModel.fromJson(data: value['data']);
            }));

    print(orders.length);

    for (var element in orders) {
      bankTranfert += element.typePaiment == "BANK_TRANSFERT"
          ? int.parse(element.priceTotal)
          : 0;

      bankNumber += element.typePaiment == "BANK_TRANSFERT" ? 1 : 0;

      confirmed += element.typePaiment != "BANK_TRANSFERT"
          ? int.parse(element.priceTotal)
          : 0;

      confirmedNumber += element.typePaiment != "BANK_TRANSFERT" ? 1 : 0;
    }

    total = confirmed + bankTranfert;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInfo();
    getProduct();
    getWallet();
    getOrderPrepare();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () => onpressKit(context),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: blanc,
        bottomNavigationBar: MenuButton(
            selectIndex: selectIndex,
            ontap: (value) {
              setState(() {
                selectIndex = value;
              });
              print(value);
            }),
        appBar: AppBar(
          backgroundColor: meuveFonce,
          elevation: .0,
          toolbarHeight: .0,
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => showCupertinoModalBottomSheet(
                context: context,
                builder: (context) => SizedBox(
                    height: MediaQuery.of(context).size.height * .9,
                    child: const AddProductBrandOwner())),
            backgroundColor: meuveFonce,
            child: const Icon(Icons.add)),
        body: selectIndex == 0
            ? ListView(
                children: [
                  Container(
                    height: size.height * .07,
                    width: size.width,
                    // ignore: sort_child_properties_last
                    child: Column(
                      children: [
                        Spacer(),
                        Container(
                          child: Column(
                            children: [
                              Text(
                                nameCompagny,
                                style: TextStyle(
                                    fontSize: size.width * .05,
                                    color: blanc,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        Spacer()
                      ],
                    ),
                    decoration: BoxDecoration(color: meuveFonce),
                  ),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  Container(
                      height: size.height * .05,
                      width: size.width,
                      // color: gris.withOpacity(.2),
                      child: Padding(
                        padding: EdgeInsets.only(left: size.width * .03),
                        child: Column(
                          children: [
                            Container(
                                width: size.width * .95,
                                child: Text(
                                  langue == 1
                                      ? 'Your products online '
                                      : 'Vos produits en ligne',
                                  style: TextStyle(
                                      fontSize: size.height * .02,
                                      fontWeight: FontWeight.w300),
                                )),
                            // Container(
                            //     width: size.width * .95,
                            //     child: Text(
                            //       'votre entrepot ${widget.stock} piecessupermarket',
                            //       style: TextStyle(
                            //           fontSize: size.height * .03,
                            //           fontWeight: FontWeight.w300),
                            //     )),
                          ],
                        ),
                      )),
                  // SizedBox(
                  //   height: size.height * .02,
                  // ),
                  Center(
                    child: Container(
                      height: size.height * .7,
                      width: size.width * .95,
                      // color: rouge,
                      child: GridView.count(
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: .7,
                        crossAxisCount: 2,
                        children: liste,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .2,
                  )
                ],
              )
            : selectIndex == 1
                ? ListView(
                    children: [
                      Container(
                        height: size.height * .07,
                        width: size.width,
                        // ignore: sort_child_properties_last
                        child: Column(
                          children: [
                            const Spacer(),
                            Column(
                              children: [
                                Text(
                                  homeBrandOwnerState.langue == 1
                                      ? "Order to prepare"
                                      : "Commande à préparer",
                                  style: TextStyle(
                                      fontSize: size.width * .05,
                                      color: blanc,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            const Spacer()
                          ],
                        ),
                        decoration: BoxDecoration(color: meuveFonce),
                      ),
                      SizedBox(
                        height: size.height * .8,
                        width: size.width,
                        child: ListView(
                          children: [
                            SizedBox(
                              height: size.height * .02,
                            ),
                            Container(
                              height: size.height * .05,
                              // color: rouge,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Center(
                                    child: GestureDetector(
                                      onTap: () => setState(() {
                                        choixPrepare = 1;
                                      }),
                                      child: Container(
                                          height: size.height * .04,
                                          width: size.width * .3,
                                          decoration: choixPrepare == 1
                                              ? BoxDecoration(
                                                  color: meuveFonce,
                                                  borderRadius:
                                                      BorderRadius.circular(8))
                                              : const BoxDecoration(),
                                          child: Center(
                                              child: Text(
                                                  homeBrandOwnerState.langue ==
                                                          1
                                                      ? '     Refused     '
                                                      : '     Refusé     ',
                                                  style: TextStyle(
                                                      color: choixPrepare == 1
                                                          ? blanc
                                                          : noir)))),
                                    ),
                                  )),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                      child: Center(
                                    child: GestureDetector(
                                      onTap: () => setState(() {
                                        choixPrepare = 2;
                                      }),
                                      child: Container(
                                          height: size.height * .04,
                                          width: size.width * .3,
                                          decoration: choixPrepare == 2
                                              ? BoxDecoration(
                                                  color: meuveFonce,
                                                  borderRadius:
                                                      BorderRadius.circular(8))
                                              : const BoxDecoration(),
                                          child: Center(
                                              child: Text(
                                            homeBrandOwnerState.langue == 1
                                                ? '     Your orders     '
                                                : '     Commandes     ',
                                            style: TextStyle(
                                                color: choixPrepare == 2
                                                    ? blanc
                                                    : noir),
                                          ))),
                                    ),
                                  )),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                      child: Center(
                                    child: Container(
                                      height: size.height * .04,
                                      width: size.width * .3,
                                      decoration: choixPrepare == 3
                                          ? BoxDecoration(
                                              color: meuveFonce,
                                              borderRadius:
                                                  BorderRadius.circular(8))
                                          : const BoxDecoration(),
                                      child: GestureDetector(
                                        onTap: () => setState(() {
                                          choixPrepare = 3;
                                        }),
                                        child: Center(
                                          child: Text(
                                              homeBrandOwnerState.langue == 1
                                                  ? '     Preparations     '
                                                  : '     Préparations     ',
                                              style: TextStyle(
                                                  color: choixPrepare == 3
                                                      ? blanc
                                                      : noir)),
                                        ),
                                      ),
                                    ),
                                  )),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size.height * .02,
                            ),
                            Column(
                              children: ordersPrepare
                                  .where((element) => choixPrepare == 2
                                      ? element.statusShop == "CREATE"
                                      : choixPrepare == 1
                                          ? element.statusShop == "FAILED"
                                          : (element.statusShop == "FINISHED" ||
                                              element.statusShop == "DELIVERY"))
                                  .map((e) => SizedBox(
                                      height: size.height * .2,
                                      child: OrderToPrepareBrandOwner(
                                        orderModel: e,
                                      )))
                                  .toList(),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                : selectIndex == 2
                    ? Stack(
                        children: [
                          SizedBox(
                            height: size.height,
                            width: size.width,
                          ),
                          SizedBox(
                            height: size.height,
                            width: size.width,
                            child: ListView(
                              children: [
                                Container(
                                  height: size.height * .25,
                                  width: size.width,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/revenu.jpeg"),
                                          fit: BoxFit.cover)),
                                  child: Column(children: [
                                    const Spacer(),
                                    Text(
                                      homeBrandOwnerState.langue == 1
                                          ? "Wallet management"
                                          : "Gestion du portefeuille",
                                      style: TextStyle(
                                          fontSize: size.height * .035,
                                          color: blanc,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const Spacer(),
                                  ]),
                                ),
                                SizedBox(
                                  height: size.height * .01,
                                ),
                                Container(
                                  height: size.height * .05,
                                  // color: rouge,
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Center(
                                        child: GestureDetector(
                                          onTap: () => setState(() {
                                            choix = 1;
                                          }),
                                          child: Container(
                                              height: size.height * .04,
                                              width: size.width * .3,
                                              decoration: choix == 1
                                                  ? BoxDecoration(
                                                      color: meuveFonce,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8))
                                                  : const BoxDecoration(),
                                              child: Center(
                                                  child: Text('     Total     ',
                                                      style: TextStyle(
                                                          color: choix == 1
                                                              ? blanc
                                                              : noir,
                                                          fontSize: 12)))),
                                        ),
                                      )),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                          child: Center(
                                        child: GestureDetector(
                                          onTap: () => setState(() {
                                            choix = 2;
                                          }),
                                          child: Container(
                                              height: size.height * .04,
                                              width: size.width * .3,
                                              decoration: choix == 2
                                                  ? BoxDecoration(
                                                      color: meuveFonce,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8))
                                                  : const BoxDecoration(),
                                              child: Center(
                                                  child: Text(
                                                '     Transfert     ',
                                                style: TextStyle(
                                                    color: choix == 2
                                                        ? blanc
                                                        : noir,
                                                    fontSize: 12),
                                              ))),
                                        ),
                                      )),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                          child: Center(
                                        child: Container(
                                          height: size.height * .04,
                                          width: size.width * .3,
                                          decoration: choix == 3
                                              ? BoxDecoration(
                                                  color: meuveFonce,
                                                  borderRadius:
                                                      BorderRadius.circular(8))
                                              : const BoxDecoration(),
                                          child: GestureDetector(
                                            onTap: () => setState(() {
                                              choix = 3;
                                            }),
                                            child: Center(
                                              child: Text(
                                                  homeBrandOwnerState.langue ==
                                                          1
                                                      ? '     To be confirmed     '
                                                      : '     Être confirmé     ',
                                                  style: TextStyle(
                                                      color: choix == 3
                                                          ? blanc
                                                          : noir,
                                                      fontSize: 12)),
                                            ),
                                          ),
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * .01,
                                ),
                                Row(
                                  children: [
                                    const Spacer(),
                                    Text(
                                      choix == 1
                                          ? '$total ${priceDevice(contry)}'
                                          : choix == 2
                                              ? '$bankTranfert ${priceDevice(contry)}'
                                              : '$confirmed ${priceDevice(contry)}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          color: meuveFonce,
                                          fontSize: size.height * .03),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * .01,
                                ),
                                SizedBox(
                                  height: size.height * .25,
                                  width: size.width,
                                  child: charts.BarChart(
                                    i == 1 ? seriesMonth : seriesWeek,
                                    animate: true,
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * .01,
                                ),
                                Center(
                                  child: Container(
                                    height: .2,
                                    color: noir,
                                    width: size.width * .9,
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * .01,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: size.width * .05,
                                    ),
                                    Text(
                                      homeBrandOwnerState.langue == 1
                                          ? 'Number of orders'
                                          : 'Nombre de commandes',
                                      style: TextStyle(
                                        fontSize: size.height * .012,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      choix == 1
                                          ? orders.length.toString()
                                          : choix == 2
                                              ? bankNumber.toString()
                                              : confirmedNumber.toString(),
                                      style: TextStyle(
                                          fontSize: size.height * .014),
                                    ),
                                    SizedBox(
                                      width: size.width * .05,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * .01,
                                ),
                                Center(
                                  child: Container(
                                    height: .2,
                                    color: noir,
                                    width: size.width * .9,
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * .01,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: size.width * .05,
                                    ),
                                    Text(
                                      'Profit  ',
                                      style: TextStyle(
                                        fontSize: size.height * .012,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      choix == 1
                                          ? '$total ${priceDevice(contry)}'
                                          : choix == 2
                                              ? '$bankTranfert ${priceDevice(contry)}'
                                              : '$confirmed ${priceDevice(contry)}',
                                      style: TextStyle(
                                          fontSize: size.height * .014),
                                    ),
                                    SizedBox(
                                      width: size.width * .05,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * .01,
                                ),
                                Container(
                                  height: size.height * .05,
                                  width: size.width * .9,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: gris)),
                                  child: Center(
                                    child: Text(
                                      homeBrandOwnerState.langue == 1
                                          ? 'Check the details'.toUpperCase()
                                          : 'Vérifiez les détails'
                                              .toUpperCase(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: size.height * .014),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * .01,
                                ),
                                Container(
                                  height: size.height * .14,
                                  color: gris,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: size.height * .012,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: size.height * .03,
                                          ),
                                          Text(
                                            homeBrandOwnerState.langue == 1
                                                ? 'Balance : $bankTranfert ${priceDevice(contry)} '
                                                : 'Solde : $bankTranfert ${priceDevice(contry)} ',
                                            style: TextStyle(
                                                fontSize: size.height * .016,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: size.height * .01,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: size.height * .03,
                                          ),
                                          Text(
                                            homeBrandOwnerState.langue == 1
                                                ? 'Payment validation within 3 days'
                                                : "Validation du paiement sous 3 jours",
                                            style: TextStyle(
                                                fontSize: size.height * .014,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: size.height * .015,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: size.width * .06,
                                          ),
                                          Container(
                                            height: size.height * .04,
                                            width: size.width * .3,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: noir.withOpacity(.8),
                                            ),
                                            child: Center(
                                              child: Text(
                                                homeBrandOwnerState.langue == 1
                                                    ? 'COLLECT'
                                                    : 'collecter'.toUpperCase(),
                                                style: TextStyle(
                                                  color: blanc,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: size.height * .01,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : ListView(
                        children: [
                          Container(
                            height: size.height * .07,
                            width: size.width,
                            // ignore: sort_child_properties_last
                            child: Column(
                              children: [
                                Spacer(),
                                Container(
                                  child: Column(
                                    children: [
                                      Text(
                                        homeBrandOwnerState.langue == 1
                                            ? "My account"
                                            : "Mon compte",
                                        style: TextStyle(
                                            fontSize: size.width * .05,
                                            color: blanc,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer()
                              ],
                            ),
                            decoration: BoxDecoration(color: meuveFonce),
                          ),
                          Container(
                            height: size.height * .82,
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
                                            decoration: BoxDecoration(
                                                color: gris.withOpacity(.3),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        size.height)),
                                            child: Icon(
                                                CupertinoIcons.building_2_fill,
                                                color: meuveFonce,
                                                size: size.height * .15),
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
                                                    const CompanyScreenBrandOwner())),
                                        text: homeBrandOwnerState.langue == 1
                                            ? "My company profile"
                                            : "Mon profil d'entreprise",
                                        bgColor: gris.withOpacity(.4)),
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
                                                builder: (context) => SizedBox(
                                                    height: size.height * .9,
                                                    child:
                                                        const AdresseScreenBrandOwnerWidget(
                                                      textAdress: "",
                                                    ))),
                                        text: homeBrandOwnerState.langue == 1
                                            ? "address company"
                                            : "Mes addresses",
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
                                                                title: homeBrandOwnerState
                                                                            .langue ==
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
                                              text: homeBrandOwnerState
                                                          .langue ==
                                                      1
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
                                                                title: homeBrandOwnerState
                                                                            .langue ==
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
                                              text: homeBrandOwnerState
                                                          .langue ==
                                                      1
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
                                                                title: homeBrandOwnerState
                                                                            .langue ==
                                                                        1
                                                                    ? "Terms of purchase"
                                                                    : "Conditions d'achat",
                                                              ))),
                                              // Navigator.push(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //         builder: (context) =>
                                              //             const PolitiqueConfidentialite(
                                              //               title:
                                              //                   "Terms of purchase ",
                                              //             ))),
                                              text:
                                                  homeBrandOwnerState.langue ==
                                                          1
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
                                                                title: homeBrandOwnerState
                                                                            .langue ==
                                                                        1
                                                                    ? "Cookies Policy"
                                                                    : "Politique des cookies",
                                                              ))),
                                              // Navigator.push(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //         builder: (context) =>
                                              //             const PolitiqueConfidentialite(
                                              //               title:
                                              //                   "Politique des cookies",
                                              //             ))),
                                              text:
                                                  homeBrandOwnerState.langue ==
                                                          1
                                                      ? "Cookies Policy"
                                                      : "Politique des cookies",
                                              bgColor: blanc),
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * .02,
                                      ),
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
                                    child: BtnBorderRound(
                                      onTap: () async {
                                        SharedPreferences.getInstance()
                                            .then((prefs) {
                                          prefs.clear();
                                          Navigator.popAndPushNamed(
                                              context, "/");
                                        });
                                      },
                                      titre: homeBrandOwnerState.langue == 1
                                          ? "Log Out"
                                          : "Se déconnecter",
                                      haveBg: true,
                                      bgActif: true,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * .07,
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
