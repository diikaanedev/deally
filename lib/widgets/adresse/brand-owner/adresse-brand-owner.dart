import 'package:deally/models/adress-model.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdresseBrandOwnerWidget extends StatefulWidget {
  final bool haveAddress;
  final AdresseModel adresse;
  final Function ontap;
  const AdresseBrandOwnerWidget(
      {Key? key,
      required this.haveAddress,
      required this.adresse,
      required this.ontap})
      : super(key: key);

  @override
  _AdresseBrandOwnerWidgetState createState() =>
      _AdresseBrandOwnerWidgetState();
}

class _AdresseBrandOwnerWidgetState extends State<AdresseBrandOwnerWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => GestureDetector(
        onTap: () => widget.ontap(),
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => const AdresseLivraisonScreen(),
        //     )),
        child: Container(
          // color: rouge,
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Row(
                      children: [
                        SizedBox(
                          width: constraints.maxWidth * .05,
                        ),
                        Icon(
                          CupertinoIcons.placemark,
                          size: constraints.maxHeight * .25,
                        ),
                        SizedBox(
                          width: constraints.maxWidth * .01,
                        ),
                        Text(
                          'Delivery address',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: noir,
                              fontSize: constraints.maxHeight * .2),
                        ),
                        Spacer(),
                        Icon(
                          CupertinoIcons.chevron_right,
                          size: constraints.maxHeight * .25,
                          color: meuveFonce,
                        ),
                        SizedBox(
                          width: constraints.maxWidth * .02,
                        )
                      ],
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    child: Column(
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            SizedBox(
                              width: constraints.maxWidth * .05,
                            ),
                            SizedBox(
                                width: constraints.maxWidth * .9,
                                child: Text(
                                  '${widget.adresse.city} ${widget.adresse.addr1} ${widget.adresse.addr2}',
                                  style: TextStyle(
                                      fontSize: constraints.maxHeight * .17,
                                      fontWeight: FontWeight.w300,
                                      color: noir),
                                )),
                          ],
                        )),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
