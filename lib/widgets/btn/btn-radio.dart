import 'package:deally/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class BtnRadio extends StatefulWidget {
  final String titre;
  final bool actif;
  final Function onTap;
  const BtnRadio(
      {Key? key, required this.titre, required this.actif, required this.onTap})
      : super(key: key);

  @override
  _BtnRadioState createState() => _BtnRadioState();
}

class _BtnRadioState extends State<BtnRadio> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(),
      child: Container(
        child: Row(
          children: [
            Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: noir.withOpacity(.5), width: .4)),
              child: Center(
                child: widget.actif
                    ? Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: meuveFonce,
                            borderRadius: BorderRadius.circular(10)),
                      )
                    : Container(),
              ),
            ),
            SizedBox(width: 8),
            Text(
              widget.titre,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * .035,
                  color: noir),
            )
          ],
        ),
      ),
    );
  }
}
