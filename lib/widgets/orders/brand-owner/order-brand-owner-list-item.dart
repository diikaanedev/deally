import 'package:deally/utils/colors-by-dii.dart';
import 'package:deally/widgets/orders/brand-owner/order-brand-owner-item-select.dart';
import 'package:flutter/material.dart';

class OrderBrandOwnerListItem extends StatelessWidget {
  const OrderBrandOwnerListItem({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const OrderBrandOwnerItemSelect(),
          )),
      child: Card(
        elevation: 2,
        child: Container(
          height: size.height * .08,
          child: Column(
            children: [
              Expanded(
                  child: Row(
                children: [
                  SizedBox(
                    width: size.width * .01,
                  ),
                  Text(
                    '#123',
                    style: TextStyle(fontWeight: FontWeight.bold, color: noir),
                  ),
                  const Spacer(),
                  Text(
                    "20000 FGN",
                    style: TextStyle(fontWeight: FontWeight.bold, color: jaune),
                  ),
                  SizedBox(
                    width: size.width * .01,
                  ),
                ],
              )),
              Expanded(
                  child: Row(
                children: [
                  SizedBox(
                    width: size.width * .01,
                  ),
                  Text(
                    'Sat 25 December 1:30 PM',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: noir.withOpacity(.5)),
                  ),
                  const Spacer(),
                  Text("Pending"),
                  SizedBox(
                    width: size.width * .01,
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
