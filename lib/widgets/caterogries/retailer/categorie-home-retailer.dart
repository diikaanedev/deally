import 'package:deally/models/categorie_by_dii.dart';
import 'package:deally/screens/home/retailer.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class CategorieHomeRetailerWidget extends StatefulWidget {
  final CategorieShopList categorieShopList;
  final Function ontap;
  final bool isActif;
  const CategorieHomeRetailerWidget({
    Key? key,
    required this.categorieShopList,
    required this.ontap,
    this.isActif = false,
  }) : super(key: key);

  @override
  _CategorieHomeRetailerWidgetState createState() =>
      _CategorieHomeRetailerWidgetState();
}

class _CategorieHomeRetailerWidgetState
    extends State<CategorieHomeRetailerWidget> {
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
                            // ignore: sort_child_properties_last
                            child: Center(
                              child: Text(
                                homeRetailerState.langue == 1
                                    ? widget.categorieShopList.nom
                                    : widget.categorieShopList.nomFrench,
                                style: TextStyle(color: blanc),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: meuveFonce,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
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
