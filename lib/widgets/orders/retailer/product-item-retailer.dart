import 'package:deally/models/order-item-model.dart';
import 'package:deally/models/produit_by_dii.dart';
import 'package:deally/screens/home/retailer.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:deally/utils/price-format.dart';
import 'package:deally/utils/requette-by-dii.dart';
import 'package:flutter/material.dart';

class ProduitItemWidgetOrderRetailer extends StatefulWidget {
  final OrderItemModel orderItemModel;
  final int isSelectable;
  const ProduitItemWidgetOrderRetailer(
      {Key? key, required this.orderItemModel, this.isSelectable = 0})
      : super(key: key);

  @override
  _ProduitItemWidgetOrderRetailerState createState() =>
      _ProduitItemWidgetOrderRetailerState();
}

class _ProduitItemWidgetOrderRetailerState
    extends State<ProduitItemWidgetOrderRetailer> {
  Future<ProduitModel> getProduct() async {
    return getResponse(url: "/products/${widget.orderItemModel.produitModel}")
        .then((value) {
      return ProduitModel.fromObject(value['data']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProduitModel>(
        future: getProduct(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return LayoutBuilder(
              builder: (context, constraints) => SizedBox(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                child: Row(
                  children: [
                    if (widget.isSelectable == 1)
                      SizedBox(
                        width: constraints.maxWidth * .03,
                      ),
                    if (widget.isSelectable == 1)
                      Column(
                        children: [
                          SizedBox(
                            height: constraints.maxHeight * .2,
                          ),
                          GestureDetector(
                            onTap: () async {
                              await deleteResponse(
                                      url:
                                          '/order-items/${widget.orderItemModel.id}')
                                  .then((value) {
                                print(value['data']);
                                homeRetailerState.getListOrderItem();
                              });
                            },
                            child: Icon(
                              Icons.delete_rounded,
                              color: meuveFonce,
                            ),
                          ),
                        ],
                      ),
                    SizedBox(
                      width: widget.isSelectable == 0
                          ? constraints.maxWidth
                          : constraints.maxWidth * .9,
                      height: constraints.maxHeight * .9,
                      child: Column(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Container(
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: constraints.maxWidth * .07,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: constraints.maxHeight,
                                        width: constraints.maxWidth * .15,
                                        decoration: BoxDecoration(
                                            color: blanc,
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: Center(
                                            child: Image.network(
                                                snapshot.data!.images)),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 4,
                                        child: Container(
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 16,
                                              ),
                                              Container(
                                                width:
                                                    constraints.maxWidth * .7,
                                                child: Text(
                                                  "${snapshot.data!.name} ${snapshot.data!.brand}",
                                                  style: TextStyle(
                                                      fontSize: constraints
                                                              .maxHeight *
                                                          .1,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Container(
                                                width:
                                                    constraints.maxWidth * .6,
                                                child: Text(
                                                  '${widget.orderItemModel.quantity} pieces',
                                                  style: TextStyle(
                                                      fontSize: constraints
                                                              .maxHeight *
                                                          .1,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                    Expanded(
                                        flex: 2,
                                        child: Container(
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height:
                                                    constraints.maxHeight * .2,
                                              ),
                                              Container(
                                                height:
                                                    constraints.maxHeight * .18,
                                                width:
                                                    constraints.maxWidth * .35,
                                                // ignore: sort_child_properties_last
                                                child: Center(
                                                    child: Text(
                                                  " ${widget.orderItemModel.price} ${priceDevice(homeRetailerState.contry)}",
                                                  style: TextStyle(
                                                      fontSize: constraints
                                                              .maxHeight *
                                                          .1,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                )),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    color: blanc),
                                              ),
                                              SizedBox(
                                                height:
                                                    constraints.maxHeight * .2,
                                              ),
                                            ],
                                          ),
                                        )),
                                    SizedBox(
                                      width: 8,
                                    )
                                  ],
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: Container(
                                child: Column(
                                  children: [
                                    Expanded(
                                        child: Row(
                                      children: [
                                        SizedBox(
                                          width: constraints.maxWidth * .3,
                                        ),
                                        Text(
                                          'Transprort (free) ',
                                          style: TextStyle(
                                              fontSize:
                                                  constraints.maxHeight * .1,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        Spacer(),
                                        Text(
                                          '0 ${priceDevice(homeRetailerState.contry)}',
                                          style: TextStyle(
                                              fontSize:
                                                  constraints.maxHeight * .12,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        SizedBox(
                                          width: constraints.maxWidth * .05,
                                        ),
                                      ],
                                    )),
                                    SizedBox(
                                      height: constraints.maxHeight * .1,
                                    )
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
