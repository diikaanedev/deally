import 'package:deally/models/pack-discounts-model.dart';
import 'package:deally/screens/home/retailer.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:deally/utils/price-format.dart';
import 'package:flutter/material.dart';

class PriceProductMargeRetailer extends StatefulWidget {
  final PackDiscountsModel packDiscountsModel;

  final bool isSelected;

  final Function onPress;

  const PriceProductMargeRetailer(
      {Key? key,
      required this.isSelected,
      required this.packDiscountsModel,
      required this.onPress})
      : super(key: key);

  @override
  _PriceProductMargeRetailerState createState() =>
      _PriceProductMargeRetailerState();
}

class _PriceProductMargeRetailerState extends State<PriceProductMargeRetailer> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: () => widget.onPress(),
          child: Container(
            width: constraints.maxWidth * .7,
            decoration: BoxDecoration(
                border: widget.isSelected
                    ? Border.all(color: meuveFonce)
                    : Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Spacer(),
                  Text(
                    '${widget.packDiscountsModel.price} ${priceDevice(homeRetailerState.contry)}',
                    style: TextStyle(
                        fontSize: constraints.maxWidth * .1,
                        fontWeight: FontWeight.w300,
                        color: widget.isSelected
                            ? meuveFonce
                            : noir.withOpacity(.3)),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    homeRetailerState.langue == 1
                        ? "From ${widget.packDiscountsModel.min} to ${widget.packDiscountsModel.max}"
                        : "De ${widget.packDiscountsModel.min} à ${widget.packDiscountsModel.max}",
                    style: TextStyle(
                        fontSize: constraints.maxWidth * .07,
                        fontWeight: FontWeight.w300,
                        color: widget.isSelected
                            ? meuveFonce
                            : noir.withOpacity(.3)),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'pieces',
                    style: TextStyle(
                        fontSize: constraints.maxWidth * .07,
                        fontWeight: FontWeight.w300,
                        color: widget.isSelected
                            ? meuveFonce
                            : noir.withOpacity(.3)),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
