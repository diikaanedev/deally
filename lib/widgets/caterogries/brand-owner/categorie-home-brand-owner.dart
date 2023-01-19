import 'package:deally/models/categorie_by_dii.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class CategorieHomeBrandOwnerWidget extends StatefulWidget {
  final CategorieShopList categorie;
  final Function ontap;
  const CategorieHomeBrandOwnerWidget(
      {Key? key, required this.ontap, required this.categorie})
      : super(key: key);

  @override
  _CategorieHomeBrandOwnerWidgetState createState() =>
      _CategorieHomeBrandOwnerWidgetState();
}

class _CategorieHomeBrandOwnerWidgetState
    extends State<CategorieHomeBrandOwnerWidget> {
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
        return GestureDetector(
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
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                                image: DecorationImage(
                                    image: NetworkImage(widget.categorie.url),
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
                              widget.categorie.nom,
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
        );
      },
    );
  }
}
