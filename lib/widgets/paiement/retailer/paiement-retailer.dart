import 'package:deally/screens/home/retailer.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoyenPayementRetailerWidget extends StatefulWidget {
  final String asseturl;
  final String title;
  final String subTitle;
  const MoyenPayementRetailerWidget(
      {Key? key,
      required this.asseturl,
      required this.title,
      required this.subTitle})
      : super(key: key);

  @override
  _MoyenPayementRetailerWidgetState createState() =>
      _MoyenPayementRetailerWidgetState();
}

class _MoyenPayementRetailerWidgetState
    extends State<MoyenPayementRetailerWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => GestureDetector(
        child: Column(
          children: [
            SizedBox(
              height: constraints.maxHeight * .1,
            ),
            Expanded(
                flex: 1,
                child: Container(
                  width: constraints.maxWidth,
                  child: Row(
                    children: [
                      SizedBox(
                        width: constraints.maxWidth * .03,
                      ),
                      Icon(
                        CupertinoIcons.money_dollar,
                        size: constraints.maxHeight * .2,
                      ),
                      SizedBox(
                        width: constraints.maxWidth * .01,
                      ),
                      Text(
                        homeRetailerState.langue == 1
                            ? 'Means of payment '
                            : 'Moyen de paiement',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: noir,
                            fontSize: constraints.maxHeight * .15),
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
                flex: 2,
                child: Container(
                    width: constraints.maxWidth,
                    child: Row(
                      children: [
                        SizedBox(
                          width: constraints.maxWidth * .02,
                        ),
                        SizedBox(
                            width: constraints.maxWidth * .15,
                            child: Image.asset(widget.asseturl)),
                        SizedBox(
                          width: constraints.maxWidth * .02,
                        ),
                        Column(
                          children: [
                            Spacer(),
                            Container(
                                width: constraints.maxWidth * .7,
                                child: Text(
                                  "${widget.title}",
                                  style: TextStyle(color: noir, fontSize: 12),
                                )),
                            Container(
                                width: constraints.maxWidth * .7,
                                child: Text(
                                  "${widget.subTitle}",
                                  style: TextStyle(
                                      color: meuveFonce, fontSize: 10),
                                )),
                            Spacer(),
                          ],
                        )
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
