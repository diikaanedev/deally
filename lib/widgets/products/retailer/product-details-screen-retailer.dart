// ignore: import_of_legacy_library_into_null_safe
import 'package:carousel_pro/carousel_pro.dart';
import 'package:deally/models/produit_by_dii.dart';
import 'package:deally/screens/home/retailer.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:deally/utils/price-format.dart';
import 'package:deally/utils/requette-by-dii.dart';
import 'package:deally/widgets/btn/btn-broder-round.dart';
import 'package:deally/widgets/products/retailer/item-product-details-list-retailer.dart';
import 'package:deally/widgets/products/retailer/price-product-marge-retailer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreenRetailer extends StatefulWidget {
  final ProduitModel produitModel;
  const ProductDetailsScreenRetailer({Key? key, required this.produitModel})
      : super(key: key);

  @override
  _ProductDetailsScreenRetailerState createState() =>
      _ProductDetailsScreenRetailerState();
}

class _ProductDetailsScreenRetailerState
    extends State<ProductDetailsScreenRetailer> {
  late Size size;
  int nomreProduit = 0;
  int marge = 50;
  late int prixTotal;
  String city = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.produitModel.id);
    getCity();
    setState(() {
      prixTotal = widget.produitModel.packDiscounts.first.min *
          widget.produitModel.packDiscounts.first.price;
      nomreProduit = widget.produitModel.packDiscounts.first.min;
    });
  }

  getCity() async {
    getResponse(url: '/address/}').then((value) {
      setState(() {
        city = value['data']['city'];
      });
    });
  }

  int getPrice(int nbre, int prixUnite) {
    return nbre * prixUnite;
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: blanc,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            height: size.height,
            width: size.width,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: size.height * .02,
                ),
                Center(
                  child: Container(
                    // ignore: sort_child_properties_last
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * .01,
                        ),
                        Container(
                          height: size.height * .3,
                          width: size.width,
                          child: Carousel(
                            boxFit: BoxFit.cover,
                            autoplay: false,
                            animationCurve: Curves.fastOutSlowIn,
                            animationDuration: Duration(milliseconds: 1000),
                            dotSize: 6.0,
                            dotIncreasedColor: meuveFonce,
                            dotColor: meuveFonce.withOpacity(.7),
                            dotBgColor: Colors.transparent,
                            dotPosition: DotPosition.bottomCenter,
                            dotVerticalPadding: 10.0,
                            showIndicator: true,
                            indicatorBgPadding: 7.0,
                            images: widget.produitModel.listImage
                                .map((e) => Image.network(e['url']))
                                .toList(),
                          ),
                        ),
                        SizedBox(
                          height: size.height * .005,
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      // color: noir.withOpacity(.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * .005,
                ),
                Center(
                  child: Container(
                    // width: size.width * .8,
                    color: gris,
                    child: Center(
                      child: Text(
                        homeRetailerState.langue == 1
                            ? '    unit price ${widget.produitModel.packDiscounts.first.min} minimum pieces    '
                            : 'prix unitaire ${widget.produitModel.packDiscounts.first.min} pièces minimum',
                        style: TextStyle(
                            color: blanc,
                            fontSize: size.height * .015,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                Container(
                  height: size.height * .09,
                  width: size.width,
                  child: Row(
                    children: [
                      Expanded(
                          child: Center(
                              child: PriceProductMargeRetailer(
                        isSelected: nomreProduit >=
                                widget.produitModel.packDiscounts[0].min &&
                            nomreProduit <
                                widget.produitModel.packDiscounts[1].min,
                        onPress: () {
                          setState(() {
                            nomreProduit =
                                widget.produitModel.packDiscounts[0].min;
                            prixTotal = getPrice(
                                widget.produitModel.packDiscounts[0].min,
                                widget.produitModel.packDiscounts[0].price);
                          });
                        },
                        packDiscountsModel:
                            widget.produitModel.packDiscounts.first,
                      ))),
                      Expanded(
                          child: Center(
                              child: PriceProductMargeRetailer(
                                  isSelected: nomreProduit >=
                                          widget.produitModel.packDiscounts[1]
                                              .min &&
                                      nomreProduit <
                                          widget.produitModel.packDiscounts[2]
                                              .min,
                                  onPress: () {
                                    setState(() {
                                      nomreProduit = widget
                                          .produitModel.packDiscounts[1].min;
                                      prixTotal = getPrice(
                                          widget.produitModel.packDiscounts[1]
                                              .min,
                                          widget.produitModel.packDiscounts[1]
                                              .price);
                                    });
                                  },
                                  packDiscountsModel:
                                      widget.produitModel.packDiscounts[1]))),
                      Expanded(
                          child: Center(
                              child: PriceProductMargeRetailer(
                                  isSelected: nomreProduit >=
                                      widget.produitModel.packDiscounts[2].min,
                                  onPress: () {
                                    setState(() {
                                      nomreProduit = widget
                                          .produitModel.packDiscounts[2].min;
                                      prixTotal = getPrice(
                                          widget.produitModel.packDiscounts[2]
                                              .min,
                                          widget.produitModel.packDiscounts[2]
                                              .price);
                                    });
                                  },
                                  packDiscountsModel:
                                      widget.produitModel.packDiscounts[2]))),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * .05,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: size.width * .07,
                    ),
                    Text(
                      homeRetailerState.langue == 1 ? 'Quantity' : "Quantité",
                      style: TextStyle(
                          fontSize: size.width * .05,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                Container(
                  width: size.width,
                  height: size.height * .12,
                  child: ItemProductDetailsListRetailer(
                    nbre: nomreProduit,
                    produitModel: widget.produitModel,
                    decremente: () {
                      if (widget.produitModel.packDiscounts.first.min <
                          nomreProduit) {
                        setState(() {
                          nomreProduit -= 5;
                          prixTotal = getPrice(
                              nomreProduit,
                              nomreProduit >
                                      widget
                                          .produitModel.packDiscounts.first.max
                                  ? nomreProduit >
                                          widget
                                              .produitModel.packDiscounts[1].max
                                      ? widget
                                          .produitModel.packDiscounts[2].price
                                      : widget
                                          .produitModel.packDiscounts[1].price
                                  : widget
                                      .produitModel.packDiscounts.first.price);
                        });
                      }
                    },
                    incremente: () {
                      if (int.parse(widget.produitModel.stock) > nomreProduit) {
                        setState(() {
                          nomreProduit += 5;
                          prixTotal = getPrice(
                              nomreProduit,
                              nomreProduit >
                                      widget
                                          .produitModel.packDiscounts.first.max
                                  ? nomreProduit >
                                          widget
                                              .produitModel.packDiscounts[1].max
                                      ? widget
                                          .produitModel.packDiscounts[2].price
                                      : widget
                                          .produitModel.packDiscounts[1].price
                                  : widget
                                      .produitModel.packDiscounts.first.price);
                        });
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * .01,
                ),
                Center(
                  child: Container(
                    width: size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size.width * .1),
                        color: blanc),
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Row(
                          children: [
                            Spacer(),
                            Text(
                                '${widget.produitModel.name} ${widget.produitModel.brand}'),
                            Spacer(),
                          ],
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: size.width * .05,
                            ),
                            Icon(
                              CupertinoIcons.floppy_disk,
                              size: size.width * .05,
                              color: noir,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Stock : ${widget.produitModel.stock} products',
                              style: TextStyle(
                                  fontSize: size.width * .03,
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: size.width * .05,
                            ),
                            Icon(
                              CupertinoIcons.placemark_fill,
                              size: size.width * .05,
                              color: noir,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              homeRetailerState.langue == 1
                                  ? 'City : $city'
                                  : 'Ville : $city',
                              style: TextStyle(
                                  fontSize: size.width * .03,
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: size.width * .05,
                            ),
                            Icon(
                              Icons.directions_car,
                              size: size.width * .05,
                              color: noir,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              homeRetailerState.langue == 1
                                  ? 'Delivery delay :${widget.produitModel.deliveryDelay == '' ? '24' : widget.produitModel.deliveryDelay} hours '
                                  : 'Délai de livraison :${widget.produitModel.deliveryDelay == '' ? '24' : widget.produitModel.deliveryDelay} heures',
                              style: TextStyle(
                                  fontSize: size.width * .03,
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: size.width * .05,
                            ),
                            Text(
                              'Description',
                              style: TextStyle(
                                  fontSize: size.height * .02,
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: size.width * .05,
                            ),
                            Container(
                                width: size.width * .9,
                                child: Text(
                                  widget.produitModel.description,
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        widget.produitModel.brand == ''
                            ? Container()
                            : Row(
                                children: [
                                  SizedBox(
                                    width: size.width * .05,
                                  ),
                                  Text(
                                    'Brand',
                                    style: TextStyle(
                                        fontSize: size.height * .02,
                                        fontWeight: FontWeight.w300),
                                  )
                                ],
                              ),
                        widget.produitModel.brand == ''
                            ? Container()
                            : SizedBox(
                                height: size.height * .02,
                              ),
                        widget.produitModel.brand == ''
                            ? Container()
                            : Row(
                                children: [
                                  SizedBox(
                                    width: size.width * .05,
                                  ),
                                  SizedBox(
                                      width: size.width * .7,
                                      child: Text(
                                        widget.produitModel.brand,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w300),
                                      ))
                                ],
                              ),
                        widget.produitModel.storageCondition == ''
                            ? Container()
                            : SizedBox(
                                height: size.height * .02,
                              ),
                        widget.produitModel.storageCondition == ''
                            ? Container()
                            : Row(
                                children: [
                                  SizedBox(
                                    width: size.width * .05,
                                  ),
                                  Text(
                                    'Conservation advices',
                                    style: TextStyle(
                                        fontSize: size.height * .02,
                                        fontWeight: FontWeight.w300),
                                  )
                                ],
                              ),
                        widget.produitModel.storageCondition == ''
                            ? Container()
                            : SizedBox(
                                height: size.height * .02,
                              ),
                        widget.produitModel.storageCondition == ''
                            ? Container()
                            : Row(
                                children: [
                                  SizedBox(
                                    width: size.width * .05,
                                  ),
                                  SizedBox(
                                      width: size.width * .7,
                                      child: Text(
                                        widget.produitModel.storageCondition,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w300),
                                      ))
                                ],
                              ),
                        SizedBox(
                          height: size.height * .15,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * .1,
                )
              ],
            ),
          ),
          Positioned(
              bottom: 8,
              child: Container(
                color: blanc,
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        height: size.height * .05,
                        width: size.width * .95,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: gris.withOpacity(.5)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: size.width * .05,
                            ),
                            Text(
                              '$nomreProduit pieces',
                              style: TextStyle(
                                  fontSize: size.width * .027,
                                  fontWeight: FontWeight.w300),
                            ),
                            Spacer(),
                            Text(
                              'Total',
                              style: TextStyle(
                                  fontSize: size.width * .03,
                                  fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              width: size.width * .05,
                            ),
                            Text(
                              // ignore: prefer_adjacent_string_concatenation
                              '$prixTotal' +
                                  ' ${priceDevice(homeRetailerState.contry)}',
                              style: TextStyle(
                                  fontSize: size.width * .030,
                                  fontWeight: FontWeight.w300,
                                  color: meuveFonce),
                            ),
                            SizedBox(
                              width: size.width * .07,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * .01),
                    SizedBox(
                      height: size.height * .06,
                      width: size.width,
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * .02,
                          ),
                          Expanded(
                            child: BtnBorderRound(
                              titre: homeRetailerState.langue == 1
                                  ? "Add to Cart"
                                  : "Ajouter au pannier",
                              haveBg: true,
                              onTap: () async {
                                print(widget.produitModel.id);
                                await postResponse(url: '/order-items', body: {
                                  "quantite": nomreProduit,
                                  "product": widget.produitModel.id,
                                  "price": prixTotal.toString(),
                                  "statusClient": 'PANNIER'
                                }).then((value) async {
                                  homeRetailerState.getListOrderItem();
                                  Navigator.pop(context);
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: size.width * .02,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
