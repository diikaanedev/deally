import 'dart:ui';

import 'package:deally/models/categorie_by_dii.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class CategorieCategorieRetailerWidgetList extends StatefulWidget {
  final CategorieShopList categorie;
  final Function onPress;
  const CategorieCategorieRetailerWidgetList(
      {Key? key, required this.categorie, required this.onPress})
      : super(key: key);

  @override
  State<CategorieCategorieRetailerWidgetList> createState() =>
      _CategorieCategorieRetailerWidgetListState();
}

class _CategorieCategorieRetailerWidgetListState
    extends State<CategorieCategorieRetailerWidgetList> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => GestureDetector(
              onTap: () => widget.onPress(),
              child: Stack(
                children: [
                  Container(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(widget.categorie.url),
                              fit: BoxFit.cover),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 1),
                                blurRadius: .5,
                                color: noir.withOpacity(.1))
                          ],
                          borderRadius: BorderRadius.circular(16),
                          color: noir.withOpacity(.5)),
                      child: Column(
                        children: [
                          Spacer(),
                          Text(
                            '${widget.categorie.nom}',
                            style: TextStyle(
                                color: blanc,
                                fontWeight: FontWeight.w600,
                                shadows: [
                                  Shadow(
                                      blurRadius: 15,
                                      color: noir.withOpacity(.8),
                                      offset: Offset(0, 2))
                                ],
                                fontSize: constraints.maxHeight * .1),
                          ),
                          Spacer(),
                        ],
                      )),
                  Container(
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: noir.withOpacity(.1)),
                  )
                ],
              ),
            ));
  }
}
