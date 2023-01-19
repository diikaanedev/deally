import 'package:deally/blocs/application-bloc.dart';
import 'package:deally/blocs/fournisseur-bloc.dart';
import 'package:deally/blocs/produits-bloc.dart';
import 'package:deally/models/categorie_by_dii.dart';
import 'package:deally/utils/close-app.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:deally/utils/price-format.dart';
import 'package:deally/widgets/btn/btn-admin.dart';
import 'package:deally/widgets/btn/btn-broder-round.dart';
import 'package:deally/widgets/btn/btn-compte.dart';
import 'package:deally/widgets/company/brand-owner/compagny-screen-brand-owner.dart';
import 'package:deally/widgets/company/brand-owner/whole-sale/add-wholesale-screen.dart';
import 'package:deally/widgets/company/brand-owner/whole-sale/wholesale-screen.dart';
import 'package:deally/widgets/condition-utilisations.dart';
import 'package:deally/widgets/menu/menu-button-brand-owner.dart';
import 'package:deally/widgets/orders/brand-owner/order-brand-owner-list-item.dart';
import 'package:deally/widgets/products/brand-owner/add-product-brand-owner.dart';
import 'package:deally/widgets/products/brand-owner/home-brand-owner.dart';
import 'package:deally/widgets/whole-saler/home-whole-seller-raprot.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BrandOwnerScreen extends StatelessWidget {
  const BrandOwnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var applicationBloc = context.watch<ApplicationBloc>();
    var fournisseurBloc = context.watch<FournisseurBloc>();
    var productsBloc = context.watch<ProduitsBloc>();

    List<Widget> sonnCat = productsBloc.listeCategoriesSonInnitial
        .map((e) => Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: GestureDetector(
                onTap: () => productsBloc.setCategorieInit(e),
                child: Container(
                  // height: size.height * .05,
                  width: size.width * .3,
                  decoration: BoxDecoration(
                      color: productsBloc.categorieInit == e ? noir : blanc,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: noir.withOpacity(.4))),
                  child: Center(
                    child: Text(
                      e.nom,
                      style: TextStyle(
                          fontSize: size.width * .035,
                          color: productsBloc.categorieInit == e
                              ? blanc
                              : noir.withOpacity(.4)),
                    ),
                  ),
                ),
              ),
            ))
        .toList();

    sonnCat.insert(
        0,
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: GestureDetector(
            onTap: () => productsBloc.setCategorieInit(
                CategorieShopList(url: "", nom: "", nomFrench: "", id: "")),
            child: Container(
              // height: size.height * .05,
              width: size.width * .3,
              decoration: BoxDecoration(
                  color: productsBloc.categorieInit.id == "" ? noir : blanc,
                  border: Border.all(color: noir.withOpacity(.4)),
                  borderRadius: BorderRadius.circular(16)),
              child: Center(
                child: Text(
                  '  Tous ',
                  style: TextStyle(
                      fontSize: size.width * .035,
                      color: productsBloc.categorieInit.id == ""
                          ? blanc
                          : noir.withOpacity(.4)),
                ),
              ),
            ),
          ),
        ));

    return WillPopScope(
      onWillPop: () => onpressKit(context),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: meuveFonce,
          leadingWidth: 0,
          iconTheme: const IconThemeData(size: 0),
          elevation: .0,
          title: Text(
            applicationBloc.appTitle,
            style: TextStyle(
                fontSize: size.width * .05,
                color: blanc,
                fontWeight: FontWeight.w400),
          ),
        ),
        body: applicationBloc.selectedIndex == 0
            ? ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    height: size.height * .02,
                  ),
                  Center(
                    child: Container(
                      height: size.height * .18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: noir,
                      ),
                      width: size.width * .9,
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * .01,
                          ),
                          Expanded(
                              child: Column(
                            children: [
                              const SizedBox(
                                height: 16,
                              ),
                              Expanded(
                                  child: Text(
                                "Your balance",
                                style: TextStyle(
                                    fontSize: size.width * .04, color: blanc),
                              )),
                              Expanded(
                                  child: Row(
                                children: [
                                  Spacer(),
                                  Text(
                                    priceFormatByDii(19000000000),
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: blanc,
                                        fontSize: size.width * .04,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    'GNF',
                                    style: TextStyle(color: blanc),
                                  ),
                                  const Spacer(),
                                ],
                              )),
                              const SizedBox(
                                height: 8,
                              ),
                              Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: Container(
                                      height: size.height * .05,
                                      width: size.width * .4,
                                      decoration: BoxDecoration(
                                          color: meuveFonce,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Center(
                                        child: Text(
                                          'Withhdraw'.toUpperCase(),
                                          style: TextStyle(
                                              color: blanc,
                                              fontSize: size.width * .03),
                                        ),
                                      ),
                                    ),
                                  )),
                              const SizedBox(
                                height: 8,
                              ),
                            ],
                          )),
                          const SizedBox(
                            width: 4,
                          ),
                          Container(
                            width: size.width * .005,
                            height: size.height * .17,
                            color: blanc,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Expanded(
                              child: Column(
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              const Spacer(),
                              Text(
                                "All Time Sales ",
                                style: TextStyle(
                                    fontSize: size.width * .04, color: blanc),
                              ),
                              SizedBox(
                                height: size.height * .02,
                              ),
                              Row(
                                children: [
                                  const Spacer(),
                                  Text(
                                    priceFormatByDii(29000000000),
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: vertVoiture,
                                        fontSize: size.width * .04,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    'GNF',
                                    style: TextStyle(
                                        color: vertVoiture,
                                        fontSize: size.width * .03,
                                        fontWeight: FontWeight.w200),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  const Spacer(),
                                  Text(
                                    'voir +',
                                    style: TextStyle(color: blanc),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              )
                            ],
                          )),
                          SizedBox(
                            width: size.width * .01,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * .06,
                          width: size.width * .9,
                          child: BtnAdminWidget(
                            color: meuveFonce,
                            onTap: () =>
                                applicationBloc.setSelectedIndexFournisseur(2),
                            text: "Products",
                            url: "assets/images/add.png",
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Container(
                          height: 2,
                          width: size.width * .9,
                          color: gris,
                        ),
                        SizedBox(
                          height: size.height * .06,
                          width: size.width * .9,
                          child: BtnAdminWidget(
                            onTap: () =>
                                applicationBloc.setSelectedIndexFournisseur(1),
                            text: "Reports ",
                            color: meuveFonce,
                            url: "assets/images/choices.png",
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Container(
                          height: 2,
                          width: size.width * .9,
                          color: gris,
                        ),
                        SizedBox(
                          height: size.height * .06,
                          width: size.width * .9,
                          child: BtnAdminWidget(
                            onTap: () =>
                                applicationBloc.setSelectedIndexFournisseur(4),
                            text: "Gestion du compte ",
                            color: meuveFonce,
                            url: "assets/images/group.png",
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * .005,
                  ),
                  Center(
                    child: SizedBox(
                      // color: jaune,
                      height: size.height * .4,
                      width: size.width,
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * .02,
                          ),
                          SizedBox(
                            height: size.height * .05,
                            width: size.width,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: size.width * .02,
                                ),
                                Container(
                                  height: size.height * .05,
                                  width: size.width * .3,
                                  decoration: BoxDecoration(
                                      color: meuveFonce,
                                      borderRadius: BorderRadius.circular(16)),
                                  child: Center(
                                    child: Text(
                                      'Today',
                                      style: TextStyle(
                                          fontSize: size.width * .035,
                                          color: blanc),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * .02,
                                ),
                                Container(
                                  height: size.height * .05,
                                  width: size.width * .3,
                                  decoration: BoxDecoration(
                                      // color: noir,
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                          color: meuveFonce.withOpacity(.4))),
                                  child: Center(
                                    child: Text(
                                      'Monthly',
                                      style: TextStyle(
                                          fontSize: size.width * .035,
                                          color: meuveFonce.withOpacity(.4)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * .02,
                                ),
                                Container(
                                  height: size.height * .05,
                                  width: size.width * .3,
                                  decoration: BoxDecoration(
                                      // color: noir,
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                          color: meuveFonce.withOpacity(.4))),
                                  child: Center(
                                    child: Text(
                                      'View all',
                                      style: TextStyle(
                                          fontSize: size.width * .035,
                                          color: meuveFonce.withOpacity(.4)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * .015,
                          ),
                          Expanded(
                              child: Column(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: SizedBox(
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: blanc,
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Column(
                                                children: [
                                                  const Spacer(),
                                                  Text(
                                                    "0",
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.width * .07,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: meuveFonce),
                                                  ),
                                                  SizedBox(
                                                    height: size.height * .01,
                                                  ),
                                                  Text(
                                                    "New orders",
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.width * .05,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color: noir),
                                                  ),
                                                  const Spacer(),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )),
                                        Expanded(
                                            child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: blanc,
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Column(
                                                children: [
                                                  const Spacer(),
                                                  Text(
                                                    "0",
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.width * .07,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: jaune),
                                                  ),
                                                  SizedBox(
                                                    height: size.height * .01,
                                                  ),
                                                  Text(
                                                    "In progress",
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.width * .05,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color: noir),
                                                  ),
                                                  const Spacer(),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: SizedBox(
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: blanc,
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Column(
                                                children: [
                                                  const Spacer(),
                                                  Text(
                                                    "0",
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.width * .07,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: noir),
                                                  ),
                                                  SizedBox(
                                                    height: size.height * .01,
                                                  ),
                                                  Text(
                                                    "Complete ",
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.width * .05,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color: noir),
                                                  ),
                                                  const Spacer(),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )),
                                        Expanded(
                                            child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: blanc,
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Column(
                                                children: [
                                                  const Spacer(),
                                                  Text(
                                                    "0",
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.width * .07,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: rouge),
                                                  ),
                                                  SizedBox(
                                                    height: size.height * .01,
                                                  ),
                                                  Text(
                                                    "Canceled",
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.width * .05,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color: noir),
                                                  ),
                                                  const Spacer(),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ))
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : applicationBloc.selectedIndex == 1
                ? Column(children: [
                    SizedBox(
                      height: size.height * .01,
                    ),
                    Expanded(
                      flex: 14,
                      child: Center(
                        child: SizedBox(
                          width: size.width * .95,
                          child: ListView(
                            children: fournisseurBloc.listWholeSaler
                                .map((e) => Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8, bottom: 8),
                                      child: GestureDetector(
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomeWholeSalerRapport(),
                                            )),
                                        child: Card(
                                          elevation: 2,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Container(
                                            height: size.height * .1,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                    flex: 1,
                                                    child: CircleAvatar(
                                                      radius: size.width * .08,
                                                      child: Center(
                                                        child: Text(
                                                          e.nameShop,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 12),
                                                        ),
                                                      ),
                                                    )),
                                                const SizedBox(
                                                  width: 6,
                                                ),
                                                Expanded(
                                                    flex: 3,
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height:
                                                              size.height * .02,
                                                        ),
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                              width:
                                                                  size.width *
                                                                      .5,
                                                              height:
                                                                  size.height *
                                                                      .02,
                                                              child: Text(
                                                                "${e.firstName} ${e.lastName}",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: TextStyle(
                                                                    color: noir,
                                                                    fontSize:
                                                                        size.width *
                                                                            .045,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 8,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              e.matricule[0],
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      size.width *
                                                                          .04,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    )),
                                                Expanded(
                                                  flex: 1,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      print("telephone");
                                                    },
                                                    child: Card(
                                                      color: gris,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100)),
                                                      child: CircleAvatar(
                                                        backgroundColor: gris,
                                                        radius:
                                                            size.width * .08,
                                                        child: Icon(
                                                          CupertinoIcons.phone,
                                                          color: noir,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: size.width * .03,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                    )
                  ])
                : applicationBloc.selectedIndex == 2
                    ? Column(children: [
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            // height: size.height * .04,
                            // width: size.width,
                            child: ListView(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              controller: productsBloc.controllerCategorieSon,
                              children: sonnCat,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Expanded(
                          flex: 14,
                          child: Center(
                            child: Container(
                                width: size.width * .95,
                                child: GridView.count(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 8,
                                    childAspectRatio: .7,
                                    physics: const BouncingScrollPhysics(),
                                    controller: productsBloc.controllerProducts,
                                    children: productsBloc.listeProduct
                                        .where((element) {
                                          if (productsBloc.categorieInit.id ==
                                              "") {
                                            return true;
                                          } else {
                                            return productsBloc
                                                    .categorieInit.id ==
                                                element.categorie['_id'];
                                          }
                                        })
                                        .map((e) => Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: SizedBox(
                                                width: size.width * .45,
                                                child: Center(
                                                    child:
                                                        HomeBrandOwnerProduct(
                                                  produitModel: e,
                                                )),
                                              ),
                                            ))
                                        .toList()

                                    //  [
                                    //   '1',
                                    //   '2',
                                    //   '3',
                                    //   '4',
                                    //   '5',
                                    //   '6',
                                    //   '7',
                                    //   '8',
                                    //   '9',
                                    //   '10'
                                    // ]
                                    //     .map(
                                    //       (e) => const CarListItemWidget(),
                                    //     )
                                    //     .toList()

                                    )),
                          ),
                        )
                      ])
                    : ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          Container(
                            height: size.height,
                            width: size.width,
                            child: ListView(
                              physics: const BouncingScrollPhysics(),
                              children: [
                                SizedBox(
                                  height: size.height * .01,
                                ),
                                SizedBox(
                                  height: size.height * .15,
                                  width: size.width,
                                  child: Column(
                                    children: [
                                      const Spacer(),
                                      Row(
                                        children: [
                                          Spacer(),
                                          GestureDetector(
                                            onTap: () => fournisseurBloc
                                                .getImageAvatar(),
                                            child: CircleAvatar(
                                              radius: size.height * .07,
                                              backgroundColor: meuveFonce,
                                              // ignore: unnecessary_null_comparison
                                              child: fournisseurBloc
                                                          .avatarImg[0] ==
                                                      ""
                                                  ? ImageIcon(
                                                      size: size.width * .2,
                                                      color: blanc,
                                                      const AssetImage(
                                                          "assets/images/upload-file.png"))
                                                  : Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      200)),
                                                      child: Image.network(
                                                          fournisseurBloc
                                                              .user!.avatar,
                                                          height:
                                                              size.height * .1,
                                                          fit: BoxFit.cover),
                                                    ),
                                            ),
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
                                  child: SizedBox(
                                    height: size.height * .06,
                                    width: size.width * .9,
                                    child: BtnWidgetCompte(
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const CompanyScreenBrandOwner())),
                                        text: applicationBloc.langue == 1
                                            ? "My profile"
                                            : "Mon profil",
                                        bgColor: gris.withOpacity(.4)),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * .06,
                                ),
                                // Center(
                                //   child: SizedBox(
                                //     height: size.height * .06,
                                //     width: size.width * .9,
                                //     child: BtnWidgetCompte(
                                //         onTap: () => Navigator.push(
                                //             context,
                                //             MaterialPageRoute(
                                //                 builder: (context) =>
                                //                     const WholeSaleScreen())),
                                //         text: applicationBloc.langue == 1
                                //             ? "Wholesale"
                                //             : "Grossite",
                                //         bgColor: gris.withOpacity(.4)),
                                //   ),
                                // ),
                                // SizedBox(
                                //   height: size.height * .03,
                                // ),
                                Container(
                                  color: gris.withOpacity(.4),
                                  width: size.width,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: size.height * .02,
                                      ),
                                      Center(
                                        child: SizedBox(
                                          height: size.height * .06,
                                          width: size.width * .9,
                                          child: BtnWidgetCompte(
                                              onTap: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ConditionUtilisationScreen(
                                                            color: meuveFonce,
                                                            title:
                                                                "General terms of use",
                                                          ))),
                                              text: applicationBloc.langue == 1
                                                  ? "General terms of use"
                                                  : "Conditions générales d'utilisation",
                                              bgColor: blanc),
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * .02,
                                      ),
                                      Center(
                                        child: SizedBox(
                                          height: size.height * .06,
                                          width: size.width * .9,
                                          child: BtnWidgetCompte(
                                              onTap: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ConditionUtilisationScreen(
                                                            color: meuveFonce,
                                                            title:
                                                                "Privacy Policy",
                                                          ))),
                                              text: applicationBloc.langue == 1
                                                  ? "Privacy Policy"
                                                  : "Politique de confidentialité",
                                              bgColor: blanc),
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * .02,
                                      ),
                                      Center(
                                        child: SizedBox(
                                          height: size.height * .06,
                                          width: size.width * .9,
                                          child: BtnWidgetCompte(
                                              onTap: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ConditionUtilisationScreen(
                                                            color: meuveFonce,
                                                            title:
                                                                "Terms of purchase ",
                                                          ))),
                                              text: applicationBloc.langue == 1
                                                  ? "Terms of purchase"
                                                  : "Conditions d'achat",
                                              bgColor: blanc),
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * .02,
                                      ),
                                      Center(
                                        child: SizedBox(
                                          height: size.height * .06,
                                          width: size.width * .9,
                                          child: BtnWidgetCompte(
                                              onTap: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ConditionUtilisationScreen(
                                                            color: meuveFonce,
                                                            title:
                                                                "Politique des cookies",
                                                          ))),
                                              text: applicationBloc.langue == 1
                                                  ? "Cookies Policy"
                                                  : "Politique des cookies",
                                              bgColor: blanc),
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * .05,
                                      ),
                                    ],
                                  ),
                                ),
                                Center(
                                  child: SizedBox(
                                    height: size.height * .06,
                                    width: size.width * .9,
                                    child: BtnBorderRound(
                                      color: noir,
                                      onTap: () async {
                                        SharedPreferences.getInstance()
                                            .then((prefs) {
                                          prefs.clear();
                                          Navigator.popAndPushNamed(
                                              context, "/");
                                        });
                                      },
                                      titre: applicationBloc.langue == 1
                                          ? "Log Out"
                                          : "Se déconnecter",
                                      haveBg: true,
                                      bgActif: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
        backgroundColor: blanc,
        floatingActionButton: applicationBloc.selectedIndex == 2
            ? FloatingActionButton(
                elevation: 2,
                backgroundColor: meuveFonce,
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddProductBrandOwner(),
                    )),
                child: const Icon(Icons.add),
              )
            : applicationBloc.selectedIndex == 1
                ? FloatingActionButton(
                    elevation: 2,
                    backgroundColor: meuveFonce,
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddWholeSaleScreen(),
                        )),
                    child: const Icon(Icons.add),
                  )
                : const SizedBox(),
        bottomNavigationBar: MenuButtonBrandOwner(ontap: (value) {
          if (value == 0) {
          } else if (value == 1) {
          } else if (value == 2) {
            productsBloc.getCategorieSonInitial();
          } else {}
          applicationBloc.setSelectedIndexFournisseur(value);
        }),
      ),
    );
  }
}
