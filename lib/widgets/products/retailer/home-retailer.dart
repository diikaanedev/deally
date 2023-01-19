import 'package:deally/models/pack-discounts-model.dart';
import 'package:deally/models/produit_by_dii.dart';
import 'package:deally/screens/home/retailer.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:deally/utils/price-format.dart';
import 'package:deally/widgets/products/retailer/product-details-screen-retailer.dart';
import 'package:flutter/cupertino.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomeRetailerProduct extends StatefulWidget {
  final bool forDetails;
  final ProduitModel? produitModel;
  const HomeRetailerProduct(
      {Key? key, this.forDetails = true, this.produitModel})
      : super(key: key);

  @override
  _HomeRetailerProductState createState() => _HomeRetailerProductState();
}

class _HomeRetailerProductState extends State<HomeRetailerProduct> {
  late PackDiscountsModel packDiscountsModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.produitModel!);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: () => showCupertinoModalBottomSheet(
              context: context,
              builder: (context) => SizedBox(
                  height: MediaQuery.of(context).size.height * .9,
                  child: ProductDetailsScreenRetailer(
                      produitModel: widget.produitModel!))),
          child: Stack(
            children: [
              Container(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(constraints.maxWidth * .1),
                    color: gris.withOpacity(.5)),
              ),
              Positioned(
                  top: constraints.maxHeight * .02,
                  left: constraints.maxWidth * .05,
                  child: Container(
                    height: constraints.maxHeight * .5,
                    width: constraints.maxWidth * .9,
                    // ignore: sort_child_properties_last
                    child: Center(
                      child: widget.produitModel!.images == null
                          ? Image.network(
                              "https://1080motion.com/wp-content/uploads/2018/06/NoImageFound.jpg.png")
                          : Image.network(
                              widget.produitModel!.images,
                              width: constraints.maxWidth * .7,
                              height: constraints.maxHeight * .5,
                            ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(constraints.maxWidth * .05),
                      color: blanc,
                    ),
                  )),
              Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: constraints.maxWidth * .03,
                        right: constraints.maxWidth * .03),
                    child: Container(
                      height: constraints.maxHeight * .4,
                      width: constraints.maxWidth,
                      // color: rouge,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: constraints.maxWidth,
                            height: constraints.maxHeight * .1,
                            child: Text(
                              "${widget.produitModel!.name} ",
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: constraints.maxWidth * .06,
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: constraints.maxHeight * .02,
                          // ),
                          Container(
                            height: constraints.maxHeight * .05,
                            child: Row(
                              children: [
                                // SizedBox(width: constraints.maxWidth * .01,),
                                Icon(
                                  CupertinoIcons.placemark_fill,
                                  size: constraints.maxWidth * .07,
                                ),
                                Text(
                                  "Lagos",
                                  style: TextStyle(fontWeight: FontWeight.w200),
                                )
                              ],
                            ),
                          ),
                          // SizedBox(
                          //   height: constraints.maxHeight * .02,
                          // ),
                          Container(
                            height: constraints.maxHeight * .05,
                            child: Row(
                              children: [
                                // SizedBox(width: constraints.maxWidth * .01,),
                                Icon(
                                  CupertinoIcons.hourglass,
                                  size: constraints.maxWidth * .07,
                                ),
                                Text(
                                  homeRetailerState.langue == 1
                                      ? 'time left'
                                      : 'Temps retsant',
                                  style: TextStyle(fontWeight: FontWeight.w200),
                                )
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: constraints.maxWidth * .8,
                            height: constraints.maxHeight * .13,
                            // ignore: sort_child_properties_last
                            child: Center(
                              child: widget
                                          .produitModel!.packDiscounts.length ==
                                      0
                                  ? Text(
                                      '0 ${priceDevice(homeRetailerState.contry)}',
                                      style: TextStyle(
                                          fontSize: constraints.maxWidth * .07,
                                          fontWeight: FontWeight.w300),
                                    )
                                  : Text(
                                      '${widget.produitModel!.packDiscounts[2].price} ${priceDevice(homeRetailerState.contry)}',
                                      style: TextStyle(
                                          fontSize: constraints.maxWidth * .07,
                                          fontWeight: FontWeight.w300),
                                    ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    constraints.maxWidth * .05),
                                color: blanc),
                          ),
                          SizedBox(
                            height: constraints.maxHeight * .02,
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        );
      },
    );
  }
}
