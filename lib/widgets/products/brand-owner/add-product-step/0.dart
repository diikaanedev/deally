import 'package:deally/blocs/produits-bloc.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:deally/widgets/btn/btn-broder-round.dart';
import 'package:deally/widgets/caterogries/brand-owner/categorie-home-brand-owner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Zero extends StatelessWidget {
  const Zero({super.key});

  @override
  Widget build(BuildContext context) {
    var productBloc = context.watch<ProduitsBloc>();
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          height: size.height * .17,
          width: size.width,
          // color: rouge,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: productBloc.listeCategories
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: size.height * .05,
                      width: size.width * .3,
                      child: CategorieHomeBrandOwnerWidget(
                          categorie: e,
                          ontap: () => productBloc.getCategorieSon(e)),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        SizedBox(
          height: size.height * .02,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * .05),
          child: Text(
            'Choisir une catégorie',
            style: TextStyle(
                fontSize: size.height * .02,
                color: productBloc.selectCatagorieError ? rouge : noir,
                fontWeight: FontWeight.w300),
          ),
        ),
        SizedBox(
          height: size.height * .01,
        ),
        SizedBox(
          height: size.height * .45,
          width: size.width,
          // color: rouge,
          child: GridView.count(
              crossAxisCount: 3,
              padding: const EdgeInsets.all(8.0),
              childAspectRatio: .85,
              children: productBloc.listeCategoriesSon.reversed
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: size.height * .2,
                        width: size.width * .9,
                        child: CategorieHomeBrandOwnerWidget(
                            categorie: e,
                            ontap: () => productBloc.setSelectedCategorie(e)),
                      ),
                    ),
                  )
                  .toList()),
        ),
        SizedBox(
          height: size.height * .01,
        ),
        Center(
          child: SizedBox(
              height: size.height * .06,
              width: size.width * .9,
              child: BtnBorderRound(
                haveBg: true,
                onTap: () => productBloc.setStep(1),
                titre: 'Étape suivant',
                bgActif: true,
              )),
        ),
        SizedBox(
          height: size.height * .0,
        ),
      ],
    );
  }
}
