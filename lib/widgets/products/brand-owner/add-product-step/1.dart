import 'package:deally/blocs/produits-bloc.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:deally/widgets/btn/btn-broder-round.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Un extends StatelessWidget {
  const Un({super.key});

  @override
  Widget build(BuildContext context) {
    var productBloc = context.watch<ProduitsBloc>();
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: size.width * .06,
                  ),
                  const Text('Nom du produit')
                ],
              ),
              SizedBox(
                height: size.height * .017,
              ),
              Center(
                child: Container(
                  width: size.width * .9,
                  height: size.height * .06,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        // ignore: sort_child_properties_last
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            controller: productBloc.nom,
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: size.height * .017),
                            keyboardType: TextInputType.text,
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              label: productBloc.nomError
                                  ? Text('Nom du produit vide')
                                  : Text('Nom du produit'),
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: productBloc.nomError ? rouge : noir,
                                  fontSize: size.height * .017),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color:
                                    productBloc.nomError ? rouge : meuveFonce)),
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height * .017,
        ),
        SizedBox(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: size.width * .06,
                  ),
                  Text('Marque de produit')
                ],
              ),
              SizedBox(
                height: size.height * .017,
              ),
              Center(
                child: Container(
                  width: size.width * .9,
                  height: size.height * .06,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        // ignore: sort_child_properties_last
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            controller: productBloc.marque,
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: size.height * .017),
                            keyboardType: TextInputType.text,
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              label: productBloc.marqueError
                                  ? Text('Marque de produit vide')
                                  : Text('Marque de produit'),
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: productBloc.marqueError ? rouge : noir,
                                  fontSize: size.height * .017),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: productBloc.marqueError
                                    ? rouge
                                    : meuveFonce)),
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height * .017,
        ),
        Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: size.width * .06,
                ),
                Text('Volume de produit par article')
              ],
            ),
            SizedBox(
              height: size.height * .017,
            ),
            Row(
              children: [
                SizedBox(
                  width: size.width * .05,
                ),
                Container(
                  width: size.width * .42,
                  height: size.height * .06,
                  // ignore: sort_child_properties_last
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: productBloc.quantityPerItem,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: size.height * .017),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        // label: Text('Product brand'),
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: size.height * .017),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: meuveFonce)),
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: meuveFonce, width: 1)),
                  width: size.width * .42,
                  height: size.height * .06,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropDownTextField(
                      initialValue: productBloc.volumeUnity.value,
                      clearOption: true,
                      enableSearch: true,
                      clearIconProperty: IconProperty(color: meuveFonce),
                      textFieldDecoration: InputDecoration(
                          border: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "unité de volume"),
                      searchDecoration: InputDecoration(
                          border: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "unité de volume"),
                      validator: (value) {
                        if (value == null) {
                          return "Required field";
                        } else {
                          return null;
                        }
                      },
                      dropDownList: const [
                        DropDownValueModel(name: 'ml', value: "ml"),
                        DropDownValueModel(name: "g", value: "g"),
                      ],
                      onChanged: (val) {},
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * .05,
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: size.height * .017,
        ),
        SizedBox(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: size.width * .06,
                  ),
                  Text('Description du produit')
                ],
              ),
              SizedBox(
                height: size.height * .017,
              ),
              Center(
                child: Container(
                  width: size.width * .9,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: size.height * .15,
                        // ignore: sort_child_properties_last
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            controller: productBloc.description,
                            keyboardType: TextInputType.multiline,
                            minLines:
                                1, //Normal textInputField will be displayed
                            maxLines: 10,
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: size.height * .017),
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              label: productBloc.descriptionError
                                  ? Text('Description du produit vide')
                                  : Text('Description du produit'),
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: productBloc.descriptionError
                                      ? rouge
                                      : noir,
                                  fontSize: size.height * .017),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: productBloc.descriptionError
                                    ? rouge
                                    : meuveFonce)),
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height * .017,
        ),
        SizedBox(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: size.width * .06,
                  ),
                  Text("Stockage de l'état du produit")
                ],
              ),
              SizedBox(
                height: size.height * .017,
              ),
              Center(
                child: Container(
                  width: size.width * .9,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: size.height * .15,
                        // ignore: sort_child_properties_last
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            controller: productBloc.storage,
                            keyboardType: TextInputType.multiline,
                            minLines:
                                1, //Normal textInputField will be displayed
                            maxLines: 10,
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: size.height * .017),
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              label: productBloc.storageError
                                  ? Text("Stockage de l'état du produit vide")
                                  : Text('Product condition storage'),
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color:
                                      productBloc.storageError ? rouge : noir,
                                  fontSize: size.height * .017),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: productBloc.storageError
                                    ? rouge
                                    : meuveFonce)),
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height * .017,
        ),
        SizedBox(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: size.width * .06,
                  ),
                  Text('Quantité de produit disponible')
                ],
              ),
              SizedBox(
                height: size.height * .017,
              ),
              Center(
                child: Container(
                  width: size.width * .9,
                  height: size.height * .06,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        // ignore: sort_child_properties_last
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            controller: productBloc.stock,
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: size.height * .017),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              label: productBloc.stockError
                                  ? Text("Quantité de produit disponible vide")
                                  : Text("Quantité de produit disponible"),
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: productBloc.stockError ? rouge : noir,
                                  fontSize: size.height * .017),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: productBloc.stockError
                                    ? rouge
                                    : meuveFonce)),
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height * .017,
        ),
        SizedBox(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: size.width * .06,
                  ),
                  Text('Commande minimum')
                ],
              ),
              SizedBox(
                height: size.height * .017,
              ),
              Center(
                child: Container(
                  width: size.width * .9,
                  height: size.height * .06,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        // ignore: sort_child_properties_last
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            controller: productBloc.quantiteMin1,
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: productBloc.quantiteMin1Error
                                    ? rouge
                                    : noir,
                                fontSize: size.height * .017),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              label: productBloc.quantiteMin1Error
                                  ? Text("la valeur doit être changée")
                                  : Text("Quantité minimum"),
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: productBloc.quantiteMin1Error
                                      ? rouge
                                      : noir,
                                  fontSize: size.height * .017),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: productBloc.quantiteMin1Error
                                    ? rouge
                                    : meuveFonce)),
                      )),
                      SizedBox(
                        width: size.width * .017,
                      ),
                      Expanded(
                          child: Container(
                        // ignore: sort_child_properties_last
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            controller: productBloc.quantiteMax1,
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: productBloc.quantiteMax1Error
                                    ? rouge
                                    : noir,
                                fontSize: size.height * .017),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              label: productBloc.quantiteMax1Error
                                  ? Text("la valeur doit être changée")
                                  : Text("Quantité maximum"),
                              labelStyle: TextStyle(
                                  color: productBloc.quantiteMax1Error
                                      ? rouge
                                      : noir,
                                  fontWeight: FontWeight.w300,
                                  fontSize: size.height * .017),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: productBloc.quantiteMax1Error
                                    ? rouge
                                    : meuveFonce)),
                      )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .017,
              ),
              Center(
                child: Container(
                  width: size.width * .9,
                  height: size.height * .06,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        // ignore: sort_child_properties_last
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            controller: productBloc.price1,
                            style: TextStyle(
                                color: productBloc.price1Error ? rouge : noir,
                                fontWeight: FontWeight.w300,
                                fontSize: size.height * .017),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              label: productBloc.price1Error
                                  ? Text("la valeur doit être changée")
                                  : Text("Prix ​​par quantité"),
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: productBloc.price1Error ? rouge : noir,
                                  fontSize: size.height * .017),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: productBloc.price1Error
                                    ? rouge
                                    : meuveFonce)),
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height * .017,
        ),
        SizedBox(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: size.width * .06,
                  ),
                  Text("Commande acceptable")
                ],
              ),
              SizedBox(
                height: size.height * .017,
              ),
              Center(
                child: Container(
                  width: size.width * .9,
                  height: size.height * .06,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        // ignore: sort_child_properties_last
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            controller: productBloc.quantiteMin2,
                            style: TextStyle(
                                color: productBloc.quantiteMin2Error
                                    ? rouge
                                    : noir,
                                fontWeight: FontWeight.w300,
                                fontSize: size.height * .017),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              label: productBloc.quantiteMin2Error
                                  ? Text("la valeur doit être changée")
                                  : Text("Quantité minimum"),
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: productBloc.quantiteMin2Error
                                      ? rouge
                                      : noir,
                                  fontSize: size.height * .017),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: productBloc.quantiteMin2Error
                                    ? rouge
                                    : meuveFonce)),
                      )),
                      SizedBox(
                        width: size.width * .017,
                      ),
                      Expanded(
                          child: Container(
                        // ignore: sort_child_properties_last
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            controller: productBloc.quantiteMax2,
                            style: TextStyle(
                                color: productBloc.quantiteMin2Error
                                    ? rouge
                                    : noir,
                                fontWeight: FontWeight.w300,
                                fontSize: size.height * .017),
                            onChanged: (value) {},
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              label: productBloc.quantiteMax2Error
                                  ? Text("la valeur doit être changée")
                                  : Text("Quantité maximum"),
                              labelStyle: TextStyle(
                                  color: productBloc.quantiteMin2Error
                                      ? rouge
                                      : noir,
                                  fontWeight: FontWeight.w300,
                                  fontSize: size.height * .017),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: productBloc.quantiteMin2Error
                                    ? rouge
                                    : meuveFonce)),
                      )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .017,
              ),
              Center(
                child: Container(
                  width: size.width * .9,
                  height: size.height * .06,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        // ignore: sort_child_properties_last
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            controller: productBloc.price2,
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: productBloc.price2Error ? rouge : noir,
                                fontSize: size.height * .017),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              label: productBloc.price2Error
                                  ? Text("la valeur doit être changée")
                                  : Text("Prix ​​par quantité"),
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: productBloc.price2Error ? rouge : noir,
                                  fontSize: size.height * .017),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: productBloc.price2Error
                                    ? rouge
                                    : meuveFonce)),
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height * .017,
        ),
        SizedBox(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: size.width * .06,
                  ),
                  Text('Meilleur prix')
                ],
              ),
              SizedBox(
                height: size.height * .017,
              ),
              Center(
                child: Container(
                  width: size.width * .9,
                  height: size.height * .06,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        // ignore: sort_child_properties_last
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            controller: productBloc.quantiteMin3,
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: productBloc.quantiteMin3Error
                                    ? rouge
                                    : noir,
                                fontSize: size.height * .017),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              label: productBloc.quantiteMin3Error
                                  ? Text("la valeur doit être changée")
                                  : Text("Quantité minimum"),
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: productBloc.quantiteMin3Error
                                      ? rouge
                                      : noir,
                                  fontSize: size.height * .017),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: productBloc.quantiteMin3Error
                                    ? rouge
                                    : meuveFonce)),
                      )),
                      SizedBox(
                        width: size.width * .017,
                      ),
                      Expanded(
                          child: Container(
                        // ignore: sort_child_properties_last
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            controller: productBloc.quantiteMax3,
                            style: TextStyle(
                                color: productBloc.quantiteMax3Error
                                    ? rouge
                                    : noir,
                                fontWeight: FontWeight.w300,
                                fontSize: size.height * .017),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              label: productBloc.quantiteMax3Error
                                  ? Text("la valeur doit être changée")
                                  : Text("Quantité maximum"),
                              labelStyle: TextStyle(
                                  color: productBloc.quantiteMax3Error
                                      ? rouge
                                      : noir,
                                  fontWeight: FontWeight.w300,
                                  fontSize: size.height * .017),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: productBloc.quantiteMax3Error
                                    ? rouge
                                    : meuveFonce)),
                      )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .017,
              ),
              Center(
                child: Container(
                  width: size.width * .9,
                  height: size.height * .06,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        // ignore: sort_child_properties_last
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            controller: productBloc.price3,
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: productBloc.price3Error ? rouge : noir,
                                fontSize: size.height * .017),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              // setState(() {
                              //   isActif = true;
                              // });
                            },
                            decoration: InputDecoration(
                              label: productBloc.price3Error
                                  ? Text("la valeur doit être changée")
                                  : Text("Prix ​​par quantité"),
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: productBloc.price3Error ? rouge : noir,
                                  fontSize: size.height * .017),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: productBloc.price3Error
                                    ? rouge
                                    : meuveFonce)),
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height * .017,
        ),
        Center(
          child: SizedBox(
              height: size.height * .06,
              width: size.width * .9,
              child: BtnBorderRound(
                haveBg: true,
                onTap: () => productBloc.setStep(2),
                titre: "Étape suivante",
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
