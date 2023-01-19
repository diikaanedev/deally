import 'package:deally/blocs/produits-bloc.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:deally/utils/upload-file.dart';
import 'package:deally/widgets/btn/btn-broder-round.dart';
import 'package:deally/widgets/caterogries/brand-owner/categorie-home-brand-owner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Deux extends StatelessWidget {
  const Deux({super.key});

  @override
  Widget build(BuildContext context) {
    var productBloc = context.watch<ProduitsBloc>();
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          height: size.height * .02,
        ),
        Row(
          children: [
            SizedBox(
              width: size.width * .05,
            ),
            Text(
              "Veuillez ajouter des photos de produits",
              style: TextStyle(fontWeight: FontWeight.w300, color: noir),
            ),
          ],
        ),
        SizedBox(
          height: size.height * .03,
        ),
        Center(
          child: Container(
            height: size.height * .06,
            width: size.width * .9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              // color: gris.withOpacity(.3),
            ),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    // Spacer(),
                    GestureDetector(
                      onTap: () => productBloc.setSourceCam(1),
                      child: Container(
                        width: size.width * .3,
                        child: Center(
                          child: Text(
                            'Gallery',
                            style: TextStyle(color: blanc),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: productBloc.source == 1
                                ? meuveFonce
                                : meuveFonce.withOpacity(.5),
                            borderRadius: BorderRadius.circular(6)),
                      ),
                    ),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    GestureDetector(
                      onTap: () => productBloc.setSourceCam(2),
                      child: Container(
                        width: size.width * .3,
                        child: Center(
                          child: Text(
                            'Camera',
                            style: TextStyle(color: blanc),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: productBloc.source == 2
                                ? meuveFonce
                                : meuveFonce.withOpacity(.5),
                            borderRadius: BorderRadius.circular(6)),
                      ),
                    ),
                    // Spacer(),
                  ],
                )),
          ),
        ),
        SizedBox(
          height: size.height * .03,
        ),
        Center(
          child: SizedBox(
            height: size.height * .17,
            width: size.width * .9,
            child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () => productBloc.getImageProduit1(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: productBloc.tabImg1[0] == null
                        ? Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: gris.withOpacity(.6)),
                            child: Column(
                              children: [
                                Expanded(
                                    child: Center(
                                  child: Text('1'),
                                )),
                                Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: Icon(
                                      CupertinoIcons.photo_camera,
                                      size: size.height * .05,
                                      color: productBloc.tofError
                                          ? rouge
                                          : meuveFonce,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Image.memory(productBloc.tabImg1[1],
                            fit: BoxFit.cover),
                  ),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () => productBloc.getImageProduit2(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: productBloc.tabImg2[0] == null
                        ? Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: gris.withOpacity(.6)),
                            child: Column(
                              children: [
                                Expanded(
                                    child: Center(
                                  child: Text('2'),
                                )),
                                Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: Icon(
                                      CupertinoIcons.photo_camera,
                                      size: size.height * .05,
                                      color: productBloc.tofError
                                          ? rouge
                                          : meuveFonce,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Image.memory(productBloc.tabImg2[1],
                            fit: BoxFit.cover),
                  ),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () => productBloc.getImageProduit3(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: productBloc.tabImg3[0] == null
                        ? Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: gris.withOpacity(.6)),
                            child: Column(
                              children: [
                                Expanded(
                                    child: Center(
                                  child: Text('3'),
                                )),
                                Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: Icon(
                                      CupertinoIcons.photo_camera,
                                      size: size.height * .05,
                                      color: productBloc.tofError
                                          ? rouge
                                          : meuveFonce,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Image.memory(productBloc.tabImg3[1],
                            fit: BoxFit.cover),
                  ),
                )),
              ],
            ),
          ),
        ),
        SizedBox(
          height: size.height * .1,
        ),
        // Center(
        //   child: Container(
        //     height: size.height * .35,
        //     width: size.width * .9,
        //     decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(5),
        //         border: Border.all(
        //             color:
        //                 productBloc.selectedAdresseError ? rouge : meuveFonce)),
        //     child: Column(
        //       children: [
        //         Expanded(
        //             flex: 2,
        //             child: Padding(
        //               padding: const EdgeInsets.all(10.0),
        //               child: Row(
        //                 children: [
        //                   Text(
        //                     "Entrepôt situé pour cet article :s",
        //                     style: const TextStyle(fontWeight: FontWeight.w300),
        //                   ),
        //                 ],
        //               ),
        //             )),
        //         Container(
        //           height: 1,
        //           color: meuveFonce,
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        // SizedBox(
        //   height: size.height * .02,
        // ),
        Center(
          child: SizedBox(
              height: size.height * .06,
              width: size.width * .9,
              child: BtnBorderRound(
                haveBg: true,
                onTap: () async {
                  await productBloc.addProduct();
                  if (productBloc.productAdd != null) {
                    Navigator.pop(context);
                  }
                },
                titre: productBloc.valid == 1
                    ? 'Chargement ...'
                    : "Ajouter un produits",
                bgActif: true,
              )),
        ),
        SizedBox(
          height: size.height * .017,
        ),
      ],
    );
  }
}
