import 'package:deally/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class BtnBorderRound extends StatefulWidget {
  final bool haveBg;
  final String titre;
  final bgActif;
  final centerText;
  final Color color;
  final Function onTap;
  const BtnBorderRound({
    Key? key,
    required this.haveBg,
    required this.onTap,
    required this.titre,
    this.bgActif = false,
    this.color = const Color(0xFFC22AF4),
    this.centerText = false,
  }) : super(key: key);

  @override
  _BtnBorderRoundState createState() => _BtnBorderRoundState();
}

class _BtnBorderRoundState extends State<BtnBorderRound> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: () => widget.onTap(),
          child: Container(
            height: constraints.maxHeight * .9,
            decoration: BoxDecoration(
                border: Border.all(color: widget.haveBg ? widget.color : gris),
                color: widget.bgActif ? widget.color : blanc,
                borderRadius: BorderRadius.circular(10)),
            child: widget.centerText
                ? Center(
                    child: Row(
                      children: [
                        Text(
                          '   ${widget.titre}   '.toUpperCase(),
                          style: TextStyle(
                              fontSize: constraints.maxHeight * .3,
                              color: widget.bgActif
                                  ? blanc
                                  : widget.haveBg
                                      ? widget.color
                                      : noir,
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.normal),
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: Text(
                      '   ${widget.titre}   '.toUpperCase(),
                      style: TextStyle(
                          fontSize: constraints.maxHeight * .3,
                          color: widget.bgActif
                              ? blanc
                              : widget.haveBg
                                  ? widget.color
                                  : noir,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
