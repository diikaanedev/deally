import 'package:deally/models/categorie_by_dii.dart';
import 'package:deally/screens/home/retailer.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class CategorieFilterRetailerWidget extends StatefulWidget {
  final CategorieShopList categorieShopList;
  final Function ontap;
  final bool isActif;
  const CategorieFilterRetailerWidget({
    Key? key,
    required this.categorieShopList,
    required this.ontap,
    this.isActif = false,
  }) : super(key: key);

  @override
  _CategorieFilterRetailerWidgetState createState() =>
      _CategorieFilterRetailerWidgetState();
}

class _CategorieFilterRetailerWidgetState
    extends State<CategorieFilterRetailerWidget> {
  bool isAct = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                isAct = !isAct;
              });
              widget.ontap();
            },
            child: Stack(
              children: [
                Container(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                  // ignore: sort_child_properties_last
                  child: Column(
                    children: [
                      Expanded(
                          flex: 7,
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          widget.categorieShopList.url),
                                      fit: BoxFit.cover),
                                  // borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ],
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              color: meuveFonce,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                homeRetailerState.langue == 1
                                    ? widget.categorieShopList.nom
                                    : widget.categorieShopList.nomFrench,
                                style: TextStyle(color: blanc),
                              ),
                            ),
                          ))
                    ],
                  ),
                  // decoration: BoxDecoration(color: noir),
                  // borderRadius: BorderRadius.circular(8),
                ),
                isAct
                    ? Container(
                        decoration: BoxDecoration(
                            color: noir.withOpacity(.4),
                            borderRadius: BorderRadius.circular(8)),
                      )
                    : Container()
              ],
            ),
          ),
        );
      },
    );
  }
}
