import 'package:deally/blocs/application-bloc.dart';
import 'package:deally/blocs/auth-bloc.dart';
import 'package:deally/blocs/fournisseur-bloc.dart';
import 'package:deally/screens/home/brand-owner.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:deally/utils/requette-by-dii.dart';
import 'package:deally/widgets/btn/btn-broder-round.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class CompanyScreenBrandOwner extends StatelessWidget {
  const CompanyScreenBrandOwner({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var fournisseur = context.read<FournisseurBloc>();
    return Scaffold(
      appBar: AppBar(
        elevation: .0,
        title: const Text('Profile'),
      ),
      body: Center(
        child: Container(
          width: size.width,
          height: size.height,
          child: ListView(
            reverse: false,
            shrinkWrap: true,
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
                    "My company information",
                    style: TextStyle(
                        fontSize: 18,
                        color: meuveFonce,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * .01,
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * .05),
                child: Text(
                  'Make sure your information is the same as on your ID',
                  style: TextStyle(
                      fontSize: 14, color: noir, fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(
                height: size.height * .03,
              ),
              Center(
                child: Container(
                  height: size.height * .07,
                  width: size.width * .9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: meuveFonce, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: fournisseur.nomI,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: size.height * .02),
                      decoration: InputDecoration(
                        hintText: 'Last name ',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: size.height * .02),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .03,
              ),
              Center(
                child: Container(
                  height: size.height * .07,
                  width: size.width * .9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: meuveFonce, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: fournisseur.prenomI,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: size.height * .02),
                      decoration: InputDecoration(
                        hintText: 'First name ',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: size.height * .02),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .03,
              ),
              Center(
                child: Container(
                  height: size.height * .07,
                  width: size.width * .9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: meuveFonce, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: fournisseur.nameShop,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: size.height * .02),
                      decoration: InputDecoration(
                        hintText: 'name shop ',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: size.height * .02),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .03,
              ),
              Center(
                child: Container(
                  height: size.height * .07,
                  width: size.width * .9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: meuveFonce, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: fournisseur.cac,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: size.height * .02),
                      decoration: InputDecoration(
                        hintText: 'CAC registration Name ',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: size.height * .02),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .03,
              ),
              Center(
                child: Container(
                  height: size.height * .07,
                  width: size.width * .9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: meuveFonce, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: fournisseur.cacNumber,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: size.height * .02),
                      decoration: InputDecoration(
                        hintText: 'CAC registration Number ',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: size.height * .02),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .03,
              ),
              Center(
                child: Container(
                  height: size.height * .07,
                  width: size.width * .9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: meuveFonce, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: fournisseur.bvn,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: size.height * .02),
                      decoration: InputDecoration(
                        hintText: 'BVN Bussiness ',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: size.height * .02),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .03,
              ),
              Center(
                child: Container(
                  height: size.height * .07,
                  width: size.width * .9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: meuveFonce, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: fournisseur.telephone,
                      readOnly: true,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: size.height * .02),
                      decoration: InputDecoration(
                        hintText: 'Phone number',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: size.height * .02),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .03,
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: meuveFonce, width: 1)),
                  width: size.width * .9,
                  height: size.height * .07,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropDownTextField(
                      initialValue: fournisseur.typeOfCompagny.value,
                      clearOption: true,
                      enableSearch: true,
                      clearIconProperty: IconProperty(color: meuveFonce),
                      textFieldDecoration: const InputDecoration(
                          border: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "enter type of company"),
                      searchDecoration: const InputDecoration(
                          border: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "enter type of company"),
                      validator: (value) {
                        if (value == null) {
                          return "Required field";
                        } else {
                          return null;
                        }
                      },
                      dropDownList: fournisseur.listeTypeOfCpmpany,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .03,
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: meuveFonce, width: 1)),
                  width: size.width * .9,
                  height: size.height * .07,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropDownTextField(
                      initialValue: fournisseur.nameOfCard.value,
                      clearOption: true,
                      enableSearch: true,
                      clearIconProperty: IconProperty(color: meuveFonce),
                      textFieldDecoration: const InputDecoration(
                          border: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "enter name of ID card"),
                      searchDecoration: const InputDecoration(
                          border: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "enter name of ID card"),
                      validator: (value) {
                        if (value == null) {
                          return "Required field";
                        } else {
                          return null;
                        }
                      },
                      dropDownList: fournisseur.listePieceType,
                      onChanged: (val) {},
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .03,
              ),
              Center(
                child: Container(
                  height: size.height * .07,
                  width: size.width * .9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: meuveFonce, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: fournisseur.numberCard,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: size.height * .02),
                      decoration: InputDecoration(
                        hintText: 'ID Card Number',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: size.height * .02),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .03,
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: meuveFonce, width: 1)),
                  width: size.width * .9,
                  height: size.height * .07,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropDownTextField(
                      initialValue: fournisseur.maritalStatus.value,
                      clearOption: true,
                      enableSearch: true,
                      clearIconProperty: IconProperty(color: meuveFonce),
                      textFieldDecoration: const InputDecoration(
                          border: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "enter marital statut"),
                      searchDecoration: const InputDecoration(
                          border: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "enter  marital statut"),
                      validator: (value) {
                        if (value == null) {
                          return "Required field";
                        } else {
                          return null;
                        }
                      },
                      dropDownList: const [
                        DropDownValueModel(name: 'Married', value: "Married"),
                        DropDownValueModel(
                            name: "Unmarried", value: "Unmarried"),
                      ],
                      onChanged: (val) {},
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: size.height * .03,
              // ),
              // Center(
              //   child: Container(
              //     height: size.height * .07,
              //     width: size.width * .9,
              //     child: BtnBorderRound(
              //       haveBg: true,
              //       onTap: () => showCupertinoModalBottomSheet(
              //                               context: context,
              //                               builder: (context) => SizedBox(
              //                                   height: size.height * .9,
              //                                   child:
              //                                       const CompanyScreenBrandOwner())),
              //       // Navigator.push(
              //       //     context,
              //       //     MaterialPageRoute(
              //       //         builder: (context) => const ForgetPassword())),
              //       titre: "Add an address",
              //     ),
              //   ),
              // ),
              SizedBox(
                height: size.height * .03,
              ),
              Center(
                child: Container(
                  height: size.height * .07,
                  width: size.width * .9,
                  child: BtnBorderRound(
                    haveBg: true,
                    onTap: () => null,
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const ForgetPassword())),
                    titre: "Change my password",
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .03,
              ),
              Center(
                child: Container(
                  width: size.width * .9,
                  height: size.height * .07,
                  child: BtnBorderRound(
                    haveBg: true,
                    bgActif: true,
                    titre: fournisseur.loading ? "Loading ..." : "Save",
                    onTap: () {
                      fournisseur.updateUser();
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
