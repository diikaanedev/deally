import 'package:deally/blocs/application-bloc.dart';
import 'package:deally/utils/close-app.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:deally/widgets/btn/btn-admin.dart';
import 'package:deally/widgets/btn/btn-broder-round.dart';
import 'package:deally/widgets/btn/btn-compte.dart';
import 'package:deally/widgets/company/brand-owner/compagny-screen-brand-owner.dart';
import 'package:deally/widgets/company/brand-owner/whole-sale/wholesale-screen.dart';
import 'package:deally/widgets/condition-utilisations.dart';
import 'package:deally/widgets/menu/menu-button-whole-saler.dart';
import 'package:deally/widgets/orders/brand-owner/order-brand-owner-list-item.dart';
import 'package:deally/widgets/products/brand-owner/add-product-brand-owner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WholeSellerScreen extends StatelessWidget {
  const WholeSellerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var applicationBloc = context.watch<ApplicationBloc>();
    return WillPopScope(
      onWillPop: () => onpressKit(context),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: vertVoiture,
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
                                    '19000000',
                                    style: TextStyle(
                                        color: blanc,
                                        fontSize: size.width * .05,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    'FGN',
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
                                          color: vertVoiture,
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
                                    '29000000',
                                    style: TextStyle(
                                        color: jaune,
                                        fontSize: size.width * .05,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    'FGN',
                                    style: TextStyle(
                                        color: jaune,
                                        fontSize: size.width * .04,
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
                            color: vertVoiture,
                            onTap: () =>
                                applicationBloc.setSelectedIndexComercant(3),
                            text: "Add a product",
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
                                applicationBloc.setSelectedIndexComercant(1),
                            text: "Reports ",
                            color: vertVoiture,
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
                                applicationBloc.setSelectedIndexComercant(4),
                            text: "Gestion du compte ",
                            color: vertVoiture,
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
                                      color: vertVoiture,
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
                                          color: vertVoiture.withOpacity(.4))),
                                  child: Center(
                                    child: Text(
                                      'Monthly',
                                      style: TextStyle(
                                          fontSize: size.width * .035,
                                          color: vertVoiture.withOpacity(.4)),
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
                                          color: vertVoiture.withOpacity(.4))),
                                  child: Center(
                                    child: Text(
                                      'View all',
                                      style: TextStyle(
                                          fontSize: size.width * .035,
                                          color: vertVoiture.withOpacity(.4)),
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
                                                        color: vertVoiture),
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
                          children: [
                            SizedBox(
                              width: size.width * .03,
                            ),
                            Container(
                              // height: size.height * .05,
                              width: size.width * .3,
                              decoration: BoxDecoration(
                                  color: noir,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Center(
                                child: Text(
                                  'News (3)',
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
                              // height: size.height * .05,
                              width: size.width * .3,
                              decoration: BoxDecoration(
                                  // color: noir,
                                  borderRadius: BorderRadius.circular(16),
                                  border:
                                      Border.all(color: noir.withOpacity(.4))),
                              child: Center(
                                child: Text(
                                  'In progress',
                                  style: TextStyle(
                                      fontSize: size.width * .035,
                                      color: noir.withOpacity(.4)),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.width * .02,
                            ),
                            Container(
                              // height: size.height * .05,
                              width: size.width * .3,
                              decoration: BoxDecoration(
                                  // color: noir,
                                  borderRadius: BorderRadius.circular(16),
                                  border:
                                      Border.all(color: noir.withOpacity(.4))),
                              child: Center(
                                child: Text(
                                  'Completed ',
                                  style: TextStyle(
                                      fontSize: size.width * .035,
                                      color: noir.withOpacity(.4)),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.width * .02,
                            ),
                            Container(
                              // height: size.height * .05,
                              width: size.width * .3,
                              decoration: BoxDecoration(
                                  // color: noir,
                                  borderRadius: BorderRadius.circular(16),
                                  border:
                                      Border.all(color: noir.withOpacity(.4))),
                              child: Center(
                                child: Text(
                                  'Canceled ',
                                  style: TextStyle(
                                      fontSize: size.width * .035,
                                      color: noir.withOpacity(.4)),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.width * .02,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Expanded(
                      flex: 14,
                      child: Center(
                        child: SizedBox(
                          width: size.width * .95,
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            children: ['d', 'f', 'f', 'r', 'f']
                                .map((e) => const OrderBrandOwnerListItem())
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
                              children: [
                                SizedBox(
                                  width: size.width * .03,
                                ),
                                Container(
                                  // height: size.height * .05,
                                  width: size.width * .3,
                                  decoration: BoxDecoration(
                                      color: noir,
                                      borderRadius: BorderRadius.circular(16)),
                                  child: Center(
                                    child: Text(
                                      '  Tous ',
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
                                  // height: size.height * .05,
                                  width: size.width * .3,
                                  decoration: BoxDecoration(
                                      // color: noir,
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                          color: noir.withOpacity(.4))),
                                  child: Center(
                                    child: Text(
                                      'Categorie phare',
                                      style: TextStyle(
                                          fontSize: size.width * .035,
                                          color: noir.withOpacity(.4)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * .02,
                                ),
                              ],
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
                              // child: ListView(
                              //     physics: const BouncingScrollPhysics(),
                              //     children: [
                              //       '1',
                              //       '2',
                              //       '3',
                              //       '4',
                              //       '5',
                              //       '6',
                              //       '7',
                              //       '8',
                              //       '9',
                              //       '10'
                              //     ]
                              //         .map(
                              //           (e) => const CarListItemWidget(),
                              //         )
                              //         .toList())
                            ),
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
                                          CircleAvatar(
                                            radius: size.height * .07,
                                            backgroundColor: vertVoiture,
                                            child: ImageIcon(
                                                size: size.width * .2,
                                                color: blanc,
                                                const AssetImage(
                                                    "assets/images/user.png")),
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
                                        color: vertVoiture,
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
                                  height: size.height * .02,
                                ),
                                Center(
                                  child: SizedBox(
                                    height: size.height * .06,
                                    width: size.width * .9,
                                    child: BtnWidgetCompte(
                                        color: vertVoiture,
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const WholeSaleScreen())),
                                        text: applicationBloc.langue == 1
                                            ? "Wholesale"
                                            : "Grossite",
                                        bgColor: gris.withOpacity(.4)),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * .03,
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
                                        child: SizedBox(
                                          height: size.height * .06,
                                          width: size.width * .9,
                                          child: BtnWidgetCompte(
                                              color: vertVoiture,
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
                                              color: vertVoiture,
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
                                              color: vertVoiture,
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
                                              color: vertVoiture,
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
                onPressed: () =>
                    //  showCupertinoModalBottomSheet(
                    //     context: context,
                    //     builder: (context) => SizedBox(
                    //           height: size.height * .9,
                    //           width: size.width,
                    //           child: const AddProductBrandOwner(),
                    //         ))

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddProductBrandOwner(),
                        )),
                child: const Icon(Icons.add),
              )
            : const SizedBox(),
        bottomNavigationBar: MenuButtonWholeSaler(ontap: (value) {
          applicationBloc.setSelectedIndexWholeSaler(value);
        }),
      ),
    );
  }
}
