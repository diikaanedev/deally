import 'package:deally/models/order-item-model.dart';
import 'package:deally/models/produit_by_dii.dart';
import 'package:deally/screens/home/retailer.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:deally/utils/get-date.dart';
import 'package:deally/utils/requette-by-dii.dart';
import 'package:deally/widgets/orders/retailer/suivi-suivi-cmd-retailer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SuiviCmdeRetailerWidget extends StatefulWidget {
  final OrderItemModel order;

  const SuiviCmdeRetailerWidget({Key? key, required this.order})
      : super(key: key);

  @override
  State<SuiviCmdeRetailerWidget> createState() =>
      _SuiviCmdeRetailerWidgetState();
}

class _SuiviCmdeRetailerWidgetState extends State<SuiviCmdeRetailerWidget> {
  ProduitModel produit = const ProduitModel(
      id: "",
      name: "",
      description: "",
      // location: "",
      saleEnd: "",
      stock: "",
      deliveryDelay: "",
      brand: "",
      storageCondition: "",
      images: "",
      packDiscounts: [],
      categorie: {},
      listImage: [],
      price: 0,
      rating: "5");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProduct();
  }

  getProduct() async {
    await getResponse(url: '/products/' + widget.order.produitModel)
        .then((value) {
      if (mounted) {
        setState(() {
          produit = ProduitModel.fromObject(value['data']);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: constraints.maxHeight * .02,
            ),
            Expanded(
                flex: 3,
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        height: constraints.maxHeight * .8,
                        width: constraints.maxWidth * .9,
                        decoration: BoxDecoration(
                            color: blanc,
                            borderRadius: BorderRadius.circular(4)),
                        child: Center(
                            child: Image.network(produit.images == ""
                                ? "http://isarta.com/infos/wp-content/uploads/2015/10/chargement-vitesse.png"
                                : produit.images)),
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: constraints.maxHeight * .04,
            ),
            Expanded(
                flex: 3,
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: constraints.maxHeight * .03,
                      ),
                      Container(
                        width: constraints.maxWidth,
                        // height: constraints.maxHeight * .2,
                        child: Row(
                          children: [
                            SizedBox(
                              width: constraints.maxWidth * .05,
                            ),
                            SizedBox(
                              width: constraints.maxWidth * .85,
                              child: Text(
                                "${produit.name}",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: constraints.maxWidth * .06,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * .03,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: constraints.maxWidth * .05,
                          ),
                          SizedBox(
                            height: constraints.maxHeight * .07,
                            child: Center(
                              child: Text(
                                homeRetailerState.langue == 1
                                    ? 'Order date: ${detFormatedDateWithhouTime(widget.order.date, homeRetailerState.langue)}'
                                    : 'Date de commande: ${detFormatedDateWithhouTime(widget.order.date, homeRetailerState.langue)}',
                                style: TextStyle(
                                    fontSize: constraints.maxHeight * .04,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: constraints.maxHeight * .05,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () => showCupertinoModalBottomSheet(
                              context: context,
                              builder: (context) => SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .9,
                                  child: SuiviScreen(
                                    order: widget.order,
                                  ))),
                          child: Container(
                            height: constraints.maxHeight * .15,
                            width: constraints.maxWidth * .8,
                            // ignore: sort_child_properties_last
                            child: Center(
                              child: Text(
                                homeRetailerState.langue == 1
                                    ? 'Order Tracking'
                                    : 'Suivi de commande',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: constraints.maxHeight * .05,
                                    color: meuveFonce,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: meuveFonce)),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
