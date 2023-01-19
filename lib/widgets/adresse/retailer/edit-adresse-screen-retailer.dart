import 'package:deally/models/adress-model.dart';
import 'package:deally/screens/home/retailer.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:deally/utils/requette-by-dii.dart';
import 'package:deally/widgets/adresse/retailer/add-adresse-screen-retailer.dart';
import 'package:deally/widgets/adresse/retailer/adresse-screen-retailer.dart';
import 'package:deally/widgets/btn/btn-broder-round.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class EditAddressScreenRetailer extends StatefulWidget {
  final AdresseModel address;
  const EditAddressScreenRetailer({Key? key, required this.address})
      : super(key: key);

  @override
  _EditAddressScreenRetailerState createState() =>
      _EditAddressScreenRetailerState();
}

class _EditAddressScreenRetailerState extends State<EditAddressScreenRetailer> {
  late Size size;
  TextEditingController nom = TextEditingController();
  FocusNode focusNodeNom = FocusNode();
  TextEditingController prenom = TextEditingController();
  FocusNode focusNodePrenom = FocusNode();
  TextEditingController phone = TextEditingController();
  FocusNode focusNodePhone = FocusNode();
  TextEditingController pays = TextEditingController();
  FocusNode focusNodePays = FocusNode();
  TextEditingController ville = TextEditingController();
  FocusNode focusNodeVille = FocusNode();
  TextEditingController cp = TextEditingController();
  FocusNode focusNodeCp = FocusNode();
  TextEditingController rue = TextEditingController();
  FocusNode focusNodeRue = FocusNode();
  TextEditingController apartement = TextEditingController();
  FocusNode focusNodeApartement = FocusNode();

  bool isMap = false;
  bool isMapSelect = false;
  bool chargement = false;
  String localizationAdress = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.address);
    setState(() {
      nom.value = TextEditingValue(text: widget.address.lastName);
      prenom.value = TextEditingValue(text: widget.address.firstName);
      phone.value = TextEditingValue(text: widget.address.phoneNumber);
      pays.value = TextEditingValue(text: widget.address.contry);
      ville.value = TextEditingValue(text: widget.address.city);
      cp.value = TextEditingValue(text: widget.address.zipcode);
      rue.value = TextEditingValue(text: widget.address.addr1);
      apartement.value = TextEditingValue(text: widget.address.addr2);
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: blanc,
      appBar: AppBar(
        backgroundColor: meuveFonce,
        toolbarHeight: .0,
        elevation: .0,
      ),
      body: Container(
        height: size.height * .95,
        width: size.width,
        child: ListView(
          reverse: false,
          shrinkWrap: false,
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
                  'Upate delevery address',
                  style: TextStyle(
                    fontSize: size.width * .035,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * .02,
            ),
            Center(
              child: Container(
                width: size.width * .9,
                height: size.height * .06,
                decoration: BoxDecoration(
                  border: Border.all(color: noir.withOpacity(.6)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.height * .03),
                  child: TextFormField(
                    // cursorHeight: constraints.maxHeight * .4,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    focusNode: focusNodeNom,
                    controller: nom,
                    onChanged: (value) => null,
                    obscureText: false,
                    style: TextStyle(fontSize: size.height * .02),
                    decoration: InputDecoration(
                      hintText: 'Last Name',
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
              height: size.height * .02,
            ),
            Center(
              child: Container(
                width: size.width * .9,
                height: size.height * .06,
                decoration: BoxDecoration(
                  border: Border.all(color: noir.withOpacity(.6)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.height * .03),
                  child: TextFormField(
                    // cursorHeight: constraints.maxHeight * .4,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    focusNode: focusNodePrenom,
                    controller: prenom,
                    onChanged: (value) => null,
                    obscureText: false,
                    style: TextStyle(fontSize: size.height * .02),
                    decoration: InputDecoration(
                      hintText: 'Firts Name',
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
              height: size.height * .02,
            ),
            Center(
              child: Container(
                width: size.width * .9,
                height: size.height * .06,
                decoration: BoxDecoration(
                  border: Border.all(color: noir.withOpacity(.6)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.height * .03),
                  child: TextFormField(
                    // cursorHeight: constraints.maxHeight * .4,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    focusNode: focusNodePhone,
                    controller: phone,
                    onChanged: (value) => null,
                    obscureText: false,
                    readOnly: true,
                    style: TextStyle(fontSize: size.height * .02),
                    decoration: InputDecoration(
                      hintText: 'Phone',
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
              height: size.height * .02,
            ),
            // Row(
            //   children: [
            //     SizedBox(
            //       width: size.width * .03,
            //     ),
            //     CupertinoSwitch(
            //       value: isMap,
            //       activeColor: meuveFonce,
            //       onChanged: (v) => setState(() {
            //         isMap = v;
            //       }),
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: size.height * .02,
            // ),
            isMap
                ? Container(
                    height: size.height * .37,
                    child: Column(
                      children: [
                        Container(
                          height: size.height * .2,
                          width: size.width * .84,
                          decoration: BoxDecoration(
                              border: Border.all(color: noir.withOpacity(.4)),
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: AssetImage("assets/images/map.png"),
                                  fit: BoxFit.cover)),
                          child: Column(
                            children: [
                              Spacer(),
                              Container(
                                height: size.height * .07,
                                width: size.height * .07,
                                child: Center(
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    child: Center(
                                      child: Icon(
                                        Icons.circle,
                                        size: 15,
                                        color: meuveFonce,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: blanc,
                                        border:
                                            Border.all(color: noir, width: .2)),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: meuveFonce.withOpacity(.2),
                                    borderRadius: BorderRadius.circular(
                                        size.height * .1)),
                              ),
                              Spacer()
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        SizedBox(
                          height: size.height * .05,
                          width: size.width * .85,
                          child: Container(
                            child: BtnBorderRound(
                              bgActif: true,
                              titre: isMapSelect
                                  ? "Geolocated "
                                  : "save geolocation",
                              onTap: () async {
                                // getPosition().then((value) async {
                                //   var d = await getAdress(Coordinates(
                                //       latitude: value.latitude,
                                //       longitude: value.longitude));
                                //   setState(() {
                                //     localizationAdress = d.toString();
                                //   });
                                // });
                                // print(localizationAdress);
                                // setState(() {
                                //   isMapSelect = !isMapSelect;
                                // });
                              },
                              haveBg: isMapSelect,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : Container(
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            width: size.width * .9,
                            height: size.height * .06,
                            decoration: BoxDecoration(
                              border: Border.all(color: noir.withOpacity(.6)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.height * .03),
                              child: TextFormField(
                                // cursorHeight: constraints.maxHeight * .4,
                                keyboardType: TextInputType.name,
                                focusNode: focusNodePays,
                                controller: pays,
                                textInputAction: TextInputAction.next,
                                onChanged: (value) => null,
                                obscureText: false,
                                style: TextStyle(fontSize: size.height * .02),
                                decoration: InputDecoration(
                                  hintText: 'Country',
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
                          height: size.height * .02,
                        ),
                        Center(
                          child: Container(
                            width: size.width * .9,
                            height: size.height * .06,
                            decoration: BoxDecoration(
                              border: Border.all(color: noir.withOpacity(.6)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.height * .03),
                              child: TextFormField(
                                // cursorHeight: constraints.maxHeight * .4,
                                keyboardType: TextInputType.name,
                                focusNode: focusNodeVille,
                                controller: ville,
                                textInputAction: TextInputAction.next,
                                onChanged: (value) => null,
                                obscureText: false,
                                style: TextStyle(fontSize: size.height * .02),
                                decoration: InputDecoration(
                                  hintText: 'State and/or locality',
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
                          height: size.height * .02,
                        ),
                        Center(
                          child: Container(
                            width: size.width * .9,
                            height: size.height * .06,
                            decoration: BoxDecoration(
                              border: Border.all(color: noir.withOpacity(.6)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.height * .03),
                              child: TextFormField(
                                // cursorHeight: constraints.maxHeight * .4,
                                keyboardType: TextInputType.name,
                                focusNode: focusNodeCp,
                                controller: cp,
                                textInputAction: TextInputAction.next,
                                onChanged: (value) => null,
                                obscureText: false,
                                style: TextStyle(fontSize: size.height * .02),
                                decoration: InputDecoration(
                                  hintText: 'Postal code',
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
                          height: size.height * .02,
                        ),
                        Center(
                          child: Container(
                            width: size.width * .9,
                            height: size.height * .06,
                            decoration: BoxDecoration(
                              border: Border.all(color: noir.withOpacity(.6)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.height * .03),
                              child: TextFormField(
                                // cursorHeight: constraints.maxHeight * .4,
                                keyboardType: TextInputType.name,
                                focusNode: focusNodeRue,
                                controller: rue,
                                textInputAction: TextInputAction.next,
                                onChanged: (value) => null,
                                obscureText: false,
                                style: TextStyle(fontSize: size.height * .02),
                                decoration: InputDecoration(
                                  hintText: 'Street, number & city',
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
                          height: size.height * .02,
                        ),
                        Center(
                          child: Container(
                            width: size.width * .9,
                            height: size.height * .06,
                            decoration: BoxDecoration(
                              border: Border.all(color: noir.withOpacity(.6)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.height * .03),
                              child: TextFormField(
                                // cursorHeight: constraints.maxHeight * .4,
                                keyboardType: TextInputType.name,
                                textInputAction: TextInputAction.done,
                                focusNode: focusNodeApartement,
                                controller: apartement,
                                onChanged: (value) => null,
                                obscureText: false,
                                style: TextStyle(fontSize: size.height * .02),
                                decoration: InputDecoration(
                                  hintText: 'Further informations for location',
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
                      ],
                    ),
                  ),

            SizedBox(
              height: size.height * .05,
            ),
            Center(
              child: SizedBox(
                height: size.height * .08,
                width: size.width * .9,
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * .01,
                    ),
                    Expanded(
                        child: Container(
                            child: BtnBorderRound(
                      haveBg: true,
                      bgActif: false,
                      titre: chargement == false
                          ? "Update address"
                          : "Loading ...",
                      onTap: chargement == false
                          ? () async {
                              setState(() {
                                chargement = true;
                              });
                              Map<String, dynamic> body;
                              if (isMapSelect) {
                                body = {
                                  "name":
                                      "adresse livraison de ${prenom.text} ${nom.text} ",
                                  "addr1": localizationAdress,
                                  "addr2": "",
                                  "city": ville.text,
                                  "country": localizationAdress.split(',').last,
                                  "zipcode": "",
                                  "phone": phone.text,
                                  "fisrtName": nom.text,
                                  "lastName": prenom.text,
                                  "default": false,
                                };
                              } else {
                                body = {
                                  "name":
                                      "adresse livraison de ${prenom.text} ${nom.text} ",
                                  "addr1": rue.text,
                                  "addr2": apartement.text,
                                  "city": ville.text,
                                  "country": pays.text,
                                  "zipcode": cp.text,
                                  "phone": phone.text,
                                  "firstName": nom.text,
                                  "lastName": prenom.text,
                                  "default": false,
                                };
                              }

                              print(body);

                              var response = await putResponse(
                                  url: '/address/' + widget.address.id,
                                  body: body);

                              print(response['body']);
                              Navigator.pop(context);
                              homeRetailerState.getAddressDefault();

                              showCupertinoModalBottomSheet(
                                  context: context,
                                  builder: (context) => SizedBox(
                                      height: size.height * .7,
                                      child:
                                          const AdresseScreenRetailerWidget()));
                            }
                          : () {},
                    ))),
                    SizedBox(
                      height: size.height * .01,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * .02,
            )
          ],
        ),
      ),
    );
  }
}
