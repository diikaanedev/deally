import 'package:deally/models/adress-model.dart';
import 'package:deally/screens/home/retailer.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:deally/utils/requette-by-dii.dart';
import 'package:deally/widgets/adresse/retailer/adresse-screen-retailer.dart';
import 'package:deally/widgets/adresse/retailer/edit-adresse-screen-retailer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AdresseItemScreenRetailerWidget extends StatefulWidget {
  final AdresseModel adresse;
  final String asset_url;

  const AdresseItemScreenRetailerWidget({
    Key? key,
    required this.adresse,
    required this.asset_url,
  }) : super(key: key);

  @override
  _AdresseItemScreenRetailerWidgetState createState() =>
      _AdresseItemScreenRetailerWidgetState();
}

class _AdresseItemScreenRetailerWidgetState
    extends State<AdresseItemScreenRetailerWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Row(
        children: [
          SizedBox(
            width: constraints.maxWidth * .02,
          ),
          widget.adresse.isMap
              ? Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Spacer(),
                      Container(
                        width: 20,
                        height: 20,
                        // ignore: sort_child_properties_last
                        child: widget.adresse.isDefault
                            ? Center(
                                child: Icon(
                                  Icons.circle,
                                  size: 15,
                                  color: meuveFonce,
                                ),
                              )
                            : Center(),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: noir, width: .2)),
                      ),
                      const Spacer(),
                      const Spacer(),
                      const Spacer(),
                      const Spacer(),
                      const Spacer(),
                    ],
                  ))
              : Expanded(
                  flex: 1,
                  child: Container(
                    child: Column(
                      children: [
                        Spacer(),
                        GestureDetector(
                          onTap: () async {
                            if (widget.adresse.isDefault) {
                              await putResponse(
                                  url: '/address/' + widget.adresse.id,
                                  body: {"isDefault": false});
                            } else {
                              await putResponse(
                                  url: '/address/' + widget.adresse.id,
                                  body: {"isDefault": true});
                            }
                            Navigator.pop(context);
                            homeRetailerState.getAddressDefault();
                            showCupertinoModalBottomSheet(
                                context: context,
                                builder: (context) => SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height * .7,
                                    child:
                                        const AdresseScreenRetailerWidget()));
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) =>
                            //           AdresseLivraisonScreen(),
                            //     ));
                          },
                          child: Container(
                            width: 20,
                            height: 20,
                            // ignore: sort_child_properties_last
                            child: widget.adresse.isDefault
                                ? Center(
                                    child: Icon(
                                      Icons.circle,
                                      size: 15,
                                      color: meuveFonce,
                                    ),
                                  )
                                : Center(),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: noir, width: .2)),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  )),
          Expanded(
              flex: 9,
              child: Container(
                // ignore: sort_child_properties_last
                child: widget.adresse.isMap
                    ? Column(
                        children: [
                          if (widget.adresse.isDefault)
                            Row(
                              children: [
                                Spacer(),
                                Container(
                                  height: constraints.maxHeight * .15,
                                  width: constraints.maxWidth * .25,
                                  // ignore: sort_child_properties_last
                                  child: Center(
                                    child: Text(
                                      homeRetailerState.langue == 1
                                          ? 'By default'
                                          : "Par default",
                                      style: TextStyle(
                                          color: meuveFonce,
                                          fontSize: constraints.maxHeight * .07,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(8)),
                                      color: meuveFonce.withOpacity(.3)),
                                ),
                              ],
                            ),
                          widget.adresse.isDefault
                              ? SizedBox()
                              : SizedBox(
                                  height: constraints.maxHeight * .03,
                                ),
                          Row(
                            children: [
                              SizedBox(
                                width: constraints.maxWidth * .03,
                              ),
                              Text(
                                "${widget.adresse.firstName} ${widget.adresse.lastName} ",
                                style: TextStyle(
                                    color: noir,
                                    fontSize: constraints.maxHeight * .1,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: constraints.maxHeight * .03,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: constraints.maxWidth * .03,
                              ),
                              Image.asset(
                                widget.asset_url,
                                height: 15,
                                width: 15,
                              ),
                              Text(
                                ' ${widget.adresse.phoneNumber} ',
                                style: TextStyle(
                                    fontSize: constraints.maxHeight * .08,
                                    fontWeight: FontWeight.w300,
                                    color: noir),
                              ),
                              Spacer(),
                              //TODO : edit adresss after
                              GestureDetector(
                                onTap: () {
                                  print("here we tap");
                                  Navigator.pop(context);
                                  showCupertinoModalBottomSheet(
                                      context: context,
                                      builder: (context) => SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .7,
                                          child: EditAddressScreenRetailer(
                                            address: widget.adresse,
                                          )));
                                },
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) =>
                                //           EditAddress(address: widget.adresse),
                                //     )),
                                child: Container(
                                  color: rouge,
                                  height: constraints.maxHeight * .3,
                                  width: constraints.maxWidth * .3,
                                  child: Text(
                                    homeRetailerState.langue == 1
                                        ? 'Update'
                                        : 'Modifier',
                                    style: TextStyle(
                                        fontSize: constraints.maxHeight * .08,
                                        fontWeight: FontWeight.w300,
                                        color: noir),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Icon(
                                CupertinoIcons.arrow_right,
                                size: constraints.maxHeight * .06,
                              ),

                              SizedBox(
                                width: constraints.maxWidth * .05,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: constraints.maxHeight * .04,
                          ),
                          Container(
                            height: widget.adresse.isDefault
                                ? constraints.maxHeight * .55
                                : constraints.maxHeight * .65,
                            width: constraints.maxWidth * .84,
                            decoration: const BoxDecoration(
                                // color: rouge,
                                image: DecorationImage(
                                    image: AssetImage("assets/images/map.png"),
                                    fit: BoxFit.cover)),
                            child: Column(
                              children: [
                                Spacer(),
                                Container(
                                  height: constraints.maxHeight * .25,
                                  width: constraints.maxWidth * .1,
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
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: blanc,
                                          border: Border.all(
                                              color: noir, width: .2)),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: meuveFonce.withOpacity(.2),
                                      borderRadius: BorderRadius.circular(
                                          constraints.maxHeight * .3)),
                                ),
                                Spacer()
                              ],
                            ),
                          )
                        ],
                      )
                    : Column(
                        children: [
                          SizedBox(
                            height: constraints.maxHeight * .1,
                          ),
                          if (widget.adresse.isDefault)
                            Row(
                              children: [
                                Spacer(),
                                Container(
                                  height: constraints.maxHeight * .15,
                                  width: constraints.maxWidth * .25,
                                  child: Center(
                                    child: Text(
                                      homeRetailerState.langue == 1
                                          ? 'By default'
                                          : 'Par default',
                                      style: TextStyle(
                                          color: meuveFonce,
                                          fontSize: constraints.maxHeight * .07,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(8)),
                                      color: meuveFonce.withOpacity(.3)),
                                ),
                              ],
                            ),
                          SizedBox(
                            height: constraints.maxHeight * .03,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: constraints.maxWidth * .03,
                              ),
                              Text(
                                "${widget.adresse.firstName} ${widget.adresse.lastName} ",
                                style: TextStyle(
                                    color: noir,
                                    fontSize: constraints.maxHeight * .1,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: constraints.maxHeight * .03,
                          ),
                          // Row(
                          //   children: [
                          //     SizedBox(
                          //       width: constraints.maxWidth * .03,
                          //     ),
                          //     Text(
                          //       "${widget.adresse.addr1},${widget.adresse.addr2} ",
                          //       style: TextStyle(
                          //           color: noir,
                          //           fontSize: constraints.maxHeight * .08,
                          //           fontWeight: FontWeight.w300),
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(
                          //   height: constraints.maxHeight * .03,
                          // ),

                          Row(
                            children: [
                              SizedBox(
                                width: constraints.maxWidth * .03,
                              ),
                              Text(
                                widget.adresse.contry == null
                                    ? ''
                                    : widget.adresse.contry.toUpperCase(),
                                style: TextStyle(
                                    color: noir,
                                    fontSize: constraints.maxHeight * .08,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: constraints.maxHeight * .03,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: constraints.maxWidth * .03,
                              ),
                              Text(
                                '${widget.adresse.city} ,${widget.adresse.zipcode}'
                                    .toUpperCase(),
                                style: TextStyle(
                                    color: noir,
                                    fontSize: constraints.maxHeight * .08,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: constraints.maxHeight * .03,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: constraints.maxWidth * .03,
                              ),
                              Image.asset(
                                widget.asset_url,
                                height: 15,
                                width: 15,
                              ),
                              Text(
                                '${widget.adresse.phoneNumber} ',
                                style: TextStyle(
                                    fontSize: constraints.maxHeight * .08,
                                    fontWeight: FontWeight.w300,
                                    color: noir),
                              ),
                              Spacer(),
                              //TODO : edit adresss after
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                  showCupertinoModalBottomSheet(
                                      context: context,
                                      builder: (context) => SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .7,
                                          child: EditAddressScreenRetailer(
                                            address: widget.adresse,
                                          )));
                                },
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) =>
                                //           EditAddress(address: widget.adresse),
                                //     )),
                                child: Text(
                                  homeRetailerState.langue == 1
                                      ? 'Update'
                                      : 'Modifier',
                                  style: TextStyle(
                                      fontSize: constraints.maxHeight * .08,
                                      fontWeight: FontWeight.w300,
                                      color: noir),
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Icon(
                                CupertinoIcons.arrow_right,
                                size: constraints.maxHeight * .06,
                              ),
                              SizedBox(
                                width: constraints.maxWidth * .05,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  print("here we tap delete");
                                  var response = await deleteResponse(
                                    url: '/address/' + widget.adresse.id,
                                  );

                                  print(response['body']);
                                  Navigator.pop(context);
                                  homeRetailerState.getAddressDefault();

                                  showCupertinoModalBottomSheet(
                                      context: context,
                                      builder: (context) => SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .7,
                                          child:
                                              const AdresseScreenRetailerWidget()));
                                },
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) =>
                                //           EditAddress(address: widget.adresse),
                                //     )),
                                child: Text(
                                  homeRetailerState.langue == 1
                                      ? 'Delete'
                                      : 'Supprimer',
                                  style: TextStyle(
                                      fontSize: constraints.maxHeight * .08,
                                      fontWeight: FontWeight.w300,
                                      color: rouge),
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Icon(
                                CupertinoIcons.arrow_right,
                                size: constraints.maxHeight * .06,
                                color: rouge,
                              ),
                              SizedBox(
                                width: constraints.maxWidth * .05,
                              )
                            ],
                          )
                        ],
                      ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: noir.withOpacity(.6))),
              )),
          SizedBox(
            width: constraints.maxWidth * .02,
          ),
        ],
      ),
    );
  }
}
