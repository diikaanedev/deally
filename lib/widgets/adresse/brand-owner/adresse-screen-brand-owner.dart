import 'package:deally/models/adress-model.dart';
import 'package:deally/screens/home/brand-owner.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:deally/utils/requette-by-dii.dart';
import 'package:deally/widgets/adresse/brand-owner/add-adresse-screen-brand-owner.dart';
import 'package:deally/widgets/adresse/brand-owner/adresse-item-screen-brand-owner.dart';
import 'package:deally/widgets/adresse/retailer/add-adresse-screen-retailer.dart';
import 'package:deally/widgets/adresse/retailer/adresse-item-screen-retailer.dart';
import 'package:deally/widgets/btn/btn-broder-round.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AdresseScreenBrandOwnerWidget extends StatefulWidget {
  final String textAdress;
  const AdresseScreenBrandOwnerWidget(
      {Key? key, this.textAdress = "Delivery address"})
      : super(key: key);

  @override
  _AdresseScreenBrandOwnerWidgetState createState() =>
      _AdresseScreenBrandOwnerWidgetState();
}

class _AdresseScreenBrandOwnerWidgetState
    extends State<AdresseScreenBrandOwnerWidget> {
  late Size size;

  List<AdresseModel> listes = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAdresse();
  }

  getAdresse() async {
    await getResponse(url: '/address/me').then((value) {
      print(value);
      setState(() {
        listes = AdresseModel.fromJson(data: value['data']);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: blanc,
      appBar: AppBar(
        backgroundColor: meuveFonce,
        elevation: .0,
        toolbarHeight: .0,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
            ),
            Positioned(
                top: 0,
                child: Container(
                  height: size.height * .75,
                  width: size.width,
                  child: LayoutBuilder(
                    builder: (context, constraints) => ListView(
                      children: [
                        SizedBox(
                          height: constraints.maxHeight * .02,
                        ),
                        Center(
                          child: Container(
                            height: 5,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: gris),
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * .02,
                        ),
                        Column(
                          children: listes
                              .map((e) => Container(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: constraints.maxHeight * .25,
                                          width: constraints.maxWidth,
                                          child: AdresseItemScreenBrandOwnerWidget(
                                              adresse: e,
                                              asset_url: e.contry == "Nigeria"
                                                  ? "assets/images/drapeau-nigeria.png"
                                                  : e.contry == "Guinee"
                                                      ? "assets/images/drapeau-guinee.png"
                                                      : e.contry == "Senegal"
                                                          ? "assets/images/drapeau-senegal.png"
                                                          : "assets/images/drapeau-cote-ivoire.png"),
                                        ),
                                        SizedBox(
                                          height: constraints.maxHeight * .02,
                                        ),
                                      ],
                                    ),
                                  ))
                              .toList(),
                        )
                      ],
                    ),
                  ),
                )),
            Positioned(
                bottom: size.height * .02,
                left: size.width * .05,
                child: Container(
                  height: size.height * .15,
                  width: size.width * .9,
                  color: blanc,
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * .01,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            showCupertinoModalBottomSheet(
                                context: context,
                                builder: (context) => SizedBox(
                                    height: size.height * .7,
                                    child: const AddAdresseScreenBrandOwner()));
                          },
                          child: Container(
                            width: size.width * .9,
                            // ignore: sort_child_properties_last
                            child: Center(
                              child: Text(
                                homeBrandOwnerState.langue == 1
                                    ? 'add a new address'.toUpperCase()
                                    : 'Ajouter une nouvelle addresse'
                                        .toUpperCase(),
                                style: TextStyle(
                                    fontSize: size.width * .03,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: noir, width: .5),
                                borderRadius:
                                    BorderRadius.circular(size.width * .02)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * .01,
                      ),
                      Expanded(
                          child: Container(
                        child: BtnBorderRound(
                          haveBg: true,
                          bgActif: true,
                          titre: homeBrandOwnerState.langue == 1
                              ? "Save"
                              : "Sauvegarder",
                          onTap: () {
                            Navigator.pop(context, true);
                          },
                        ),
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
    );
  }
}
