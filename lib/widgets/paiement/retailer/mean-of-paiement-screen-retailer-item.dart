import 'package:deally/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class MeanOfPayementItemRetailer extends StatefulWidget {
  final String title;
  final String asset_url;
  final bool isDefault;
  final bool isCreditOrCash;
  final String subTitle;
  final Function onTap;
  const MeanOfPayementItemRetailer(
      {Key? key,
      required this.title,
      required this.asset_url,
      this.isDefault = false,
      this.isCreditOrCash = true,
      this.subTitle = "",
      required this.onTap})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MeanOfPayementItemRetailerState createState() =>
      _MeanOfPayementItemRetailerState();
}

class _MeanOfPayementItemRetailerState
    extends State<MeanOfPayementItemRetailer> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => GestureDetector(
          onTap: () => widget.onTap(),
          child: Center(
            child: SizedBox(
              width: constraints.maxWidth * .9,
              height: constraints.maxHeight,
              child: Row(
                children: [
                  Container(
                    width: constraints.maxWidth * .05,
                    height: constraints.maxHeight * .27,
                    // ignore: sort_child_properties_last
                    child: Center(
                      child: widget.isDefault
                          ? Container(
                              height: constraints.maxHeight * .15,
                              width: constraints.maxWidth * .027,
                              decoration: BoxDecoration(
                                  color: meuveFonce,
                                  borderRadius: BorderRadius.circular(50.0)),
                            )
                          : SizedBox(
                              height: constraints.maxHeight * .15,
                              width: constraints.maxWidth * .027,
                            ),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color: gris),
                        borderRadius: BorderRadius.circular(50.0)),
                  ),
                  SizedBox(
                    width: constraints.maxWidth * .05,
                  ),
                  Container(
                    width: constraints.maxWidth * .8,
                    height: constraints.maxHeight * .9,
                    // ignore: sort_child_properties_last
                    child: Row(
                      children: [
                        SizedBox(
                          width: constraints.maxWidth * .05,
                        ),
                        Container(
                            width: constraints.maxWidth * .12,
                            child: Image.asset(
                              widget.asset_url,
                              fit: BoxFit.contain,
                            )),
                        Row(
                          children: [
                            SizedBox(
                              width: constraints.maxWidth * .02,
                            ),
                            Column(
                              children: [
                                Spacer(),
                                Container(
                                    width: constraints.maxWidth * .6,
                                    child: Text("${widget.title}")),
                                Container(
                                    width: constraints.maxWidth * .6,
                                    child: Text(
                                      "${widget.subTitle}",
                                      style: TextStyle(
                                          color: meuveFonce, fontSize: 10),
                                    )),
                                Spacer(),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color: gris),
                        borderRadius: BorderRadius.circular(5.0)),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
