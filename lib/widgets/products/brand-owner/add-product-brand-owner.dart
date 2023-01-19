import 'package:deally/blocs/application-bloc.dart';
import 'package:deally/blocs/fournisseur-bloc.dart';
import 'package:deally/blocs/produits-bloc.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:deally/widgets/btn/btn-broder-round.dart';
import 'package:deally/widgets/products/brand-owner/add-product-step/0.dart';
import 'package:deally/widgets/products/brand-owner/add-product-step/1.dart';
import 'package:deally/widgets/products/brand-owner/add-product-step/2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProductBrandOwner extends StatelessWidget {
  const AddProductBrandOwner({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var applicationBloc = context.watch<ApplicationBloc>();
    var fournisseurBloc = context.watch<FournisseurBloc>();
    var productBloc = context.watch<ProduitsBloc>();
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: .0,
        backgroundColor: meuveFonce,
        elevation: .0,
        title: const Text('Add Product'),
      ),
      backgroundColor: blanc,
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: size.height * .02,
          ),
          Center(
            child: Container(
              height: 5,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2), color: gris),
            ),
          ),
          SizedBox(
            height: size.height * .02,
          ),
          Row(
            children: [
              const Spacer(),
              SizedBox(
                width: size.width * .05,
              ),
              SizedBox(
                width: size.width * .25,
                height: size.height * .05,
                child: BtnBorderRound(
                    haveBg: true,
                    onTap: () => productBloc.setStep(0),
                    titre: "Étape une",
                    bgActif: productBloc.step == 0),
              ),
              SizedBox(
                width: size.width * .05,
              ),
              SizedBox(
                width: size.width * .25,
                height: size.height * .05,
                child: BtnBorderRound(
                    bgActif: productBloc.step == 1,
                    haveBg: true,
                    onTap: () => productBloc.setStep(1),
                    titre: 'Étape deux'),
              ),
              SizedBox(
                width: size.width * .05,
              ),
              SizedBox(
                width: size.width * .25,
                height: size.height * .05,
                child: BtnBorderRound(
                    bgActif: productBloc.step == 2,
                    haveBg: true,
                    onTap: () => productBloc.setStep(2),
                    titre: "Étape trois"),
              ),
              SizedBox(
                width: size.width * .05,
              ),
              const Spacer(),
            ],
          ),
          SizedBox(
            height: size.height * .02,
          ),
          if (productBloc.step == 0) const Zero(),
          if (productBloc.step == 1) const Un(),
          if (productBloc.step == 2) const Deux()
        ],
      ),
    );
  }
}
