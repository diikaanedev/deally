import 'package:deally/models/produit_by_dii.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class ItemProductDetailsListRetailer extends StatefulWidget {
  final int nbre;
  final Function incremente;
  final Function decremente;
  final ProduitModel? produitModel;
  final bool haveFunc;
  const ItemProductDetailsListRetailer(
      {Key? key,
      required this.nbre,
      required this.incremente,
      required this.decremente,
      this.haveFunc = false,
      this.produitModel})
      : super(key: key);

  @override
  _ItemProductDetailsListRetailerState createState() =>
      _ItemProductDetailsListRetailerState();
}

class _ItemProductDetailsListRetailerState
    extends State<ItemProductDetailsListRetailer> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        height: constraints.maxHeight,
        width: constraints.maxWidth,
        child: Row(
          children: [
            SizedBox(
              width: constraints.maxWidth * .05,
            ),
            Container(
              width: constraints.maxWidth * .75,
              // ignore: sort_child_properties_last
              child: Row(
                children: [
                  SizedBox(
                    width: constraints.maxWidth * .02,
                  ),
                  Center(
                    child: Container(
                      width: constraints.maxWidth * .2,
                      height: constraints.maxHeight * .8,
                      // ignore: sort_child_properties_last
                      child: Center(
                        child: Image.network(widget.produitModel!.images),
                      ),
                      decoration: BoxDecoration(
                          color: blanc, borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: constraints.maxWidth * .4,
                      height: constraints.maxHeight * .6,
                      // ignore: sort_child_properties_last
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${widget.produitModel!.name} ${widget.produitModel!.brand}",
                          style: TextStyle(
                              fontSize: constraints.maxWidth * .04,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      decoration: BoxDecoration(
                          // color: blanc,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: gris.withOpacity(.5),
                  borderRadius: BorderRadius.circular(10)),
            ),
            SizedBox(
              width: constraints.maxWidth * .03,
            ),
            Container(
              width: constraints.maxWidth * .12,
              // ignore: sort_child_properties_last
              child: Column(
                children: [
                  SizedBox(
                    height: constraints.maxHeight * .02,
                  ),
                  if (widget.haveFunc == false)
                    Expanded(
                        child: Center(
                            child: GestureDetector(
                      onTap: () => widget.incremente(),
                      child: Container(
                        height: constraints.maxHeight * .3,
                        width: constraints.maxWidth * .07,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(constraints.maxWidth),
                            border: Border.all(color: meuveFonce),
                            color: meuveClair),
                        child: Center(
                          child: Text(
                            '+',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: constraints.maxWidth * .05),
                          ),
                        ),
                      ),
                    ))),
                  SizedBox(
                    height: constraints.maxHeight * .02,
                  ),
                  Expanded(
                      child: Center(
                    child: Text(
                      '${widget.nbre == 0 ? 15 : widget.nbre}',
                      style: TextStyle(
                          fontSize: constraints.maxWidth * .03,
                          fontWeight: FontWeight.w300),
                    ),
                  )),
                  SizedBox(
                    height: constraints.maxHeight * .02,
                  ),
                  if (widget.haveFunc == false)
                    Expanded(
                        child: Center(
                            child: GestureDetector(
                      onTap: () => widget.decremente(),
                      child: Container(
                        height: constraints.maxHeight * .3,
                        width: constraints.maxWidth * .07,
                        child: Center(
                          child: Text(
                            '-',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: constraints.maxWidth * .05),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(constraints.maxWidth),
                            border: Border.all(color: meuveFonce),
                            color: meuveClair),
                      ),
                    ))),
                  SizedBox(
                    height: constraints.maxHeight * .02,
                  ),
                ],
              ),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
            )
          ],
        ),
      ),
    );
  }
}
