import 'package:deally/models/produit_by_dii.dart';
import 'package:deally/screens/home/brand-owner.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:deally/widgets/products/brand-owner/edit-product-brand-owner.dart';
import 'package:flutter/cupertino.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// class HomeBrandOwnerProduct extends StatefulWidget {
//   final bool forDetails;
//   const HomeBrandOwnerProduct(
//       {Key? key, this.forDetails = true, this.produitModel})
//       : super(key: key);

//   @override
//   _HomeBrandOwnerProductState createState() => _HomeBrandOwnerProductState();
// }

// class _HomeBrandOwnerProductState extends State<HomeBrandOwnerProduct> {
//   late PackDiscountsModel packDiscountsModel;
//   String city = "";
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getCity();
//   }
// }

class HomeBrandOwnerProduct extends StatelessWidget {
  final ProduitModel? produitModel;
  final bool forDetails;

  const HomeBrandOwnerProduct(
      {super.key, this.produitModel, this.forDetails = true});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
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
                    child: produitModel!.images == null
                        ? Image.network(
                            "https://1080motion.com/wp-content/uploads/2018/06/NoImageFound.jpg.png",
                          )
                        : Image.network(
                            produitModel!.images,
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
                      left: constraints.maxWidth * .01,
                      right: constraints.maxWidth * .01),
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
                            "${produitModel!.name} ",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: constraints.maxWidth * .07,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * .0,
                        ),
                        Container(
                          height: constraints.maxHeight * .07,
                          child: Row(
                            children: [
                              SizedBox(
                                width: constraints.maxWidth * .01,
                              ),
                              Icon(
                                CupertinoIcons.check_mark,
                                size: constraints.maxWidth * .07,
                              ),
                              Text(
                                produitModel!.categorie['title'],
                                style: TextStyle(fontWeight: FontWeight.w200),
                              )
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   height: constraints.maxHeight * .02,
                        // ),
                        Spacer(),
                        GestureDetector(
                          onTap: () => showCupertinoModalBottomSheet(
                              context: context,
                              builder: (context) => SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .9,
                                  child: EditProdcutBrandOwnner(
                                    produit: produitModel!,
                                  ))),
                          child: Container(
                            width: constraints.maxWidth * .9,
                            height: constraints.maxHeight * .13,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    constraints.maxWidth * .05),
                                color: blanc),
                            child: Center(
                                child: Text(
                              // .langue == 1
                              // ? 'Renew'
                              // :
                              'Renouveler',
                              style: TextStyle(
                                  fontSize: constraints.maxWidth * .07,
                                  fontWeight: FontWeight.w300),
                            )),
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * .05,
                        )
                      ],
                    ),
                  ),
                ))
          ],
        );
      },
    );
  }
}
