import 'package:deally/screens/home/retailer.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:deally/utils/requette-by-dii.dart';
import 'package:deally/widgets/btn/btn-broder-round.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompanyScreenRetailer extends StatefulWidget {
  const CompanyScreenRetailer({Key? key}) : super(key: key);

  @override
  State<CompanyScreenRetailer> createState() => _CompanyScreenRetailerState();
}

class _CompanyScreenRetailerState extends State<CompanyScreenRetailer> {
  late Size size;
  late int choix;
  final _formKey = GlobalKey<FormState>();
  TextEditingController telephone = TextEditingController();
  TextEditingController cac = TextEditingController();
  TextEditingController cacNumber = TextEditingController();
  TextEditingController bvn = TextEditingController();
  TextEditingController nomI = TextEditingController();
  TextEditingController prenomI = TextEditingController();
  TextEditingController numberCard = TextEditingController();

  DropDownValueModel typeOfCompagny =
      const DropDownValueModel(name: "Ltd", value: "Ltd");

  DropDownValueModel nameOfCard =
      const DropDownValueModel(name: 'National', value: "National");

  DropDownValueModel maritalStatus =
      const DropDownValueModel(name: 'Married', value: "Married");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInfo();
  }

  getInfo() async {
    await getResponse(url: '/users').then((value) {
      print(value['data']['user']);
      setState(() {
        telephone.text = value['data']['user']['phone'];
        cac.text = value['data']['user']['cacName'];
        cacNumber.text = value['data']['user']['cacNumber'];
        bvn.text = value['data']['user']['bvn'];
        nomI.text = value['data']['user']['firstName'] ?? '';
        prenomI.text = value['data']['user']['lastName'] ?? '';
        numberCard.text = value['data']['user']['NumberfIDCard'] ?? '';
        typeOfCompagny = value['data']['user']['TypeOfCompany'] == 'Ltd'
            ? const DropDownValueModel(name: "Ltd", value: "Ltd")
            : const DropDownValueModel(name: "Plc", value: "Plc");
        nameOfCard = value['data']['user']['NameofIDCard'] == 'National'
            ? const DropDownValueModel(name: 'National', value: "National")
            : const DropDownValueModel(name: "Voter's", value: "Voters");
        maritalStatus = value['data']['user']['MaritalStatut'] == 'married'
            ? const DropDownValueModel(name: 'Married', value: "Married")
            : const DropDownValueModel(name: "Unmarried", value: "Unmarried");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: blanc,
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
                    homeRetailerState.langue == 1
                        ? "My company information"
                        : "Informations sur mon entreprise",
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
                  homeRetailerState.langue == 1
                      ? 'Make sure your information is the same as on your ID'
                      : "Assurez-vous que vos informations sont les mêmes que sur votre pièce d'identité",
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
                      controller: nomI,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: size.height * .02),
                      decoration: InputDecoration(
                        hintText: homeRetailerState.langue == 1
                            ? 'Last name '
                            : "Nom",
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
                      controller: prenomI,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: size.height * .02),
                      decoration: InputDecoration(
                        hintText: homeRetailerState.langue == 1
                            ? 'First name '
                            : "Prénom",
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
                      controller: cac,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: size.height * .02),
                      decoration: InputDecoration(
                        hintText: homeRetailerState.langue == 1
                            ? 'CAC registration Name '
                            : "Nom d'enregistrement CAC",
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
                      controller: cacNumber,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: size.height * .02),
                      decoration: InputDecoration(
                        hintText: homeRetailerState.langue == 1
                            ? 'CAC registration Number '
                            : "Numéro d'enregistrement CAC",
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
                      controller: bvn,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: size.height * .02),
                      decoration: InputDecoration(
                        hintText: homeRetailerState.langue == 1
                            ? 'BVN Bussiness '
                            : "BVN Bussiness ",
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
                      controller: telephone,
                      readOnly: true,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: size.height * .02),
                      decoration: InputDecoration(
                        hintText: homeRetailerState.langue == 1
                            ? 'Phone number'
                            : "Téléphone",
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
                      initialValue: typeOfCompagny.value,
                      clearOption: true,
                      enableSearch: true,
                      clearIconProperty: IconProperty(color: meuveFonce),
                      textFieldDecoration: InputDecoration(
                          border: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: homeRetailerState.langue == 1
                              ? "enter type of company"
                              : "entrer le type d'entreprise"),
                      searchDecoration: InputDecoration(
                          border: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: homeRetailerState.langue == 1
                              ? "enter type of company"
                              : "entrer le type d'entreprise"),
                      validator: (value) {
                        if (value == null) {
                          return "Required field";
                        } else {
                          return null;
                        }
                      },
                      dropDownList: const [
                        DropDownValueModel(name: 'Ltd', value: "Ltd"),
                        DropDownValueModel(name: 'Plc', value: "Plc"),
                        DropDownValueModel(name: 'Gte', value: "Gte"),
                        DropDownValueModel(name: 'Ultd', value: "Ultd"),
                        DropDownValueModel(
                            name: 'Syndics Incorporated',
                            value: "Syndics_Incorporated"),
                        DropDownValueModel(
                            name: 'Partenariat limite (LP)',
                            value: "Partenariat_limite"),
                      ],
                      onChanged: (val) {
                        print(val);
                        setState(() {
                          typeOfCompagny = val;
                        });
                      },
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
                      initialValue: nameOfCard.value,
                      clearOption: true,
                      enableSearch: true,
                      clearIconProperty: IconProperty(color: meuveFonce),
                      textFieldDecoration: InputDecoration(
                          border: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: homeRetailerState.langue == 1
                              ? "enter name of ID card"
                              : "entrez le nom de la carte d'identité"),
                      searchDecoration: InputDecoration(
                          border: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: homeRetailerState.langue == 1
                              ? "enter name of ID card"
                              : "entrez le nom de la carte d'identité"),
                      validator: (value) {
                        if (value == null) {
                          return "Required field";
                        } else {
                          return null;
                        }
                      },
                      dropDownList: const [
                        DropDownValueModel(name: 'National', value: "National"),
                        DropDownValueModel(name: "Voter's", value: "Voter"),
                        DropDownValueModel(name: 'Driver', value: "Driver"),
                        DropDownValueModel(name: "Passport", value: "Passport"),
                      ],
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
                      controller: numberCard,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: size.height * .02),
                      decoration: InputDecoration(
                        hintText: homeRetailerState.langue == 1
                            ? 'ID Card Number'
                            : "Numéro de carte d'identité",
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
                      initialValue: maritalStatus.value,
                      clearOption: true,
                      enableSearch: true,
                      clearIconProperty: IconProperty(color: meuveFonce),
                      textFieldDecoration: InputDecoration(
                          border: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: homeRetailerState.langue == 1
                              ? "enter marital statut"
                              : "entrer dans l'état civil"),
                      searchDecoration: InputDecoration(
                          border: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: homeRetailerState.langue == 1
                              ? "enter marital statut"
                              : "entrer dans l'état civil"),
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
                    titre: homeRetailerState.langue == 1
                        ? "Change my password"
                        : "Changer mon mot de passe",
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
                    titre:
                        homeRetailerState.langue == 1 ? "Save" : "Sauvegarder",
                    onTap: () async {
                      putResponse(url: '/users', body: {
                        "firstName": nomI.text,
                        "lastName": prenomI.text,
                        "cacName": cac.text,
                        "cacNumber": cacNumber.text,
                        "bvn": bvn.text,
                        "NumberfIDCard": numberCard.text,
                        "TypeOfCompany": typeOfCompagny.value,
                        "NameofIDCard": nameOfCard.value,
                        "MaritalStatut": maritalStatus.value,
                      }).then((value) {
                        print(value);
                        Navigator.pop(context, true);
                      });
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
