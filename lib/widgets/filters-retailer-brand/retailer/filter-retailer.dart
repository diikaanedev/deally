// ignore_for_file: sort_child_properties_last

import 'package:deally/models/categorie_by_dii.dart';
import 'package:deally/screens/home/retailer.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:deally/widgets/btn/btn-broder-round.dart';
import 'package:deally/widgets/caterogries/retailer/categorie-filter-retailer.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class FilterRetailerWidget extends StatefulWidget {
  List<CategorieShopList> categoriesParents;
  bool isParent;
  FilterRetailerWidget(
      {Key? key, required this.categoriesParents, this.isParent = true})
      : super(key: key);

  @override
  State<FilterRetailerWidget> createState() => _FilterRetailerWidgetState();
}

class _FilterRetailerWidgetState extends State<FilterRetailerWidget> {
  RangeValues prices = const RangeValues(0, 500);
  int arrangedBy = 1;
  CategorieShopList categorieShopListSelct =
      CategorieShopList(url: "", nom: "", nomFrench: "", id: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => Container(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: constraints.maxHeight * .05,
              ),
              Center(
                child: Container(
                  height: 5,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2), color: gris),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * .01,
              ),
              SizedBox(
                height: constraints.maxHeight * .05,
                width: constraints.maxWidth,
                child: Row(
                  children: [
                    SizedBox(
                      width: constraints.maxWidth * 0.02,
                    ),
                    Text(
                      homeRetailerState.langue == 1
                          ? 'Choose Familly'
                          : 'Choisissez la famille',
                      style: TextStyle(fontSize: 14, color: noir),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * .01,
              ),
              SizedBox(
                height: constraints.maxHeight * .3,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: widget.categoriesParents
                      .map((e) => SizedBox(
                            width: constraints.maxWidth * .35,
                            height: constraints.maxHeight * .3,
                            child: CategorieFilterRetailerWidget(
                                categorieShopList: e,
                                ontap: () => setState(() {
                                      categorieShopListSelct = e;
                                    })),
                          ))
                      .toList(),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * .01,
              ),
              SizedBox(
                height: constraints.maxHeight * .05,
                width: constraints.maxWidth,
                child: Row(
                  children: [
                    SizedBox(
                      width: constraints.maxWidth * 0.02,
                    ),
                    Text(
                      homeRetailerState.langue == 1
                          ? 'Range price'
                          : "Tranche de prix",
                      style: TextStyle(fontSize: 14, color: noir),
                    )
                  ],
                ),
              ),
              // SizedBox(
              //   height: constraints.maxHeight * .01,
              // ),
              SizedBox(
                // height: constraints.maxHeight * .1,
                child: RangeSlider(
                    // ignore: prefer_const_constructors
                    values: prices,
                    min: 0,
                    max: 500,
                    labels: RangeLabels(prices.start.round().toString(),
                        prices.end.round().toString()),
                    divisions: 20,
                    onChanged: (RangeValues values) {
                      setState(() {
                        if (values.end - values.start >= 20) {
                          prices = values;
                        } else {
                          if (prices.start == values.start) {
                            prices =
                                RangeValues(prices.start, prices.start + 20);
                          } else {
                            prices = RangeValues(prices.end - 20, prices.end);
                          }
                        }
                      });
                    }),
              ),
              SizedBox(
                height: constraints.maxHeight * .01,
              ),
              SizedBox(
                height: constraints.maxHeight * .05,
                width: constraints.maxWidth,
                child: Row(
                  children: [
                    SizedBox(
                      width: constraints.maxWidth * 0.02,
                    ),
                    Text(
                      homeRetailerState.langue == 1
                          ? 'Arrange By'
                          : 'organiser par vente élevé',
                      style: TextStyle(fontSize: 14, color: noir),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * .01,
              ),
              SizedBox(
                height: constraints.maxHeight * .1,
                child: Row(
                  children: [
                    SizedBox(
                      width: constraints.maxWidth * .02,
                    ),
                    GestureDetector(
                      onTap: () => setState(() {
                        arrangedBy = 1;
                      }),
                      child: Container(
                        width: constraints.maxWidth * .2,
                        // ignore: sort_child_properties_last
                        child: Center(
                          child: Text(
                            homeRetailerState.langue == 1
                                ? 'Higth Sales'
                                : 'Croissant',
                            style: TextStyle(
                                color: arrangedBy == 1 ? blanc : noir),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: arrangedBy == 1 ? meuveFonce : blanc,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: arrangedBy == 1
                                    ? meuveFonce
                                    : noir.withOpacity(.4))),
                      ),
                    ),
                    SizedBox(
                      width: constraints.maxWidth * .02,
                    ),
                    GestureDetector(
                      onTap: () => setState(() {
                        arrangedBy = 2;
                      }),
                      child: Container(
                        width: constraints.maxWidth * .25,
                        // ignore: sort_child_properties_last
                        child: Center(
                          child: Text(
                            'Décroissant',
                            style: TextStyle(
                                color: arrangedBy == 2 ? blanc : noir),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: arrangedBy == 2 ? meuveFonce : blanc,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: arrangedBy == 2
                                    ? meuveFonce
                                    : noir.withOpacity(.4))),
                      ),
                    ),
                    SizedBox(
                      width: constraints.maxWidth * .02,
                    ),
                    GestureDetector(
                      onTap: () => setState(() {
                        arrangedBy = 3;
                      }),
                      child: Container(
                        width: constraints.maxWidth * .25,
                        child: Center(
                          child: Text(
                            'Récente',
                            style: TextStyle(
                                color: arrangedBy == 3 ? blanc : noir),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: arrangedBy == 3 ? meuveFonce : blanc,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: arrangedBy == 3
                                    ? meuveFonce
                                    : noir.withOpacity(.4))),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  const Spacer(),
                  SizedBox(
                    width: constraints.maxWidth * .85,
                    height: constraints.maxHeight * .1,
                    child: BtnBorderRound(
                        haveBg: true,
                        onTap: () async {
                          if (categorieShopListSelct.id != "") {
                            await homeRetailerState.getCategoriesFamilly(
                                url: categorieShopListSelct.id);
                            await homeRetailerState.getProductFamilly(
                                url:
                                    'familly?cat=${categorieShopListSelct.id}&min=${prices.start.round().toString()}&max=${prices.end.round().toString()}&arrangeBy=$arrangedBy');
                          } else {
                            await homeRetailerState.getCategorie();
                            await homeRetailerState.getProduct();
                          }
                          // ignore: use_build_context_synchronously
                          Navigator.pop(context);
                        },
                        titre: homeRetailerState.langue == 1
                            ? 'Save Filter'
                            : 'Enregistrer le filtre'),
                  ),
                  const Spacer(),
                ],
              ),
              SizedBox(
                height: constraints.maxHeight * .05,
              )
            ],
          ),
        ),
      ),
    );
  }
}
