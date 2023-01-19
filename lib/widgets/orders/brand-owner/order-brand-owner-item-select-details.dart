import 'package:deally/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';

class OrderBrandOwnerItemSelectDertails extends StatelessWidget {
  const OrderBrandOwnerItemSelectDertails({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          height: size.height * .07,
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      SizedBox(
                        width: size.width * .03,
                      ),
                      Text(
                        '1X',
                        style: TextStyle(
                            color: jaune,
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * .045),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Télévison',
                        style: TextStyle(
                            color: noir.withOpacity(.7),
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * .04),
                      ),
                    ],
                  )),
              Expanded(
                  child: Row(
                children: [
                  SizedBox(
                    width: size.width * .03,
                  ),
                  Text(
                    'More Details',
                    style: TextStyle(color: jaune, fontSize: size.width * .03),
                  )
                ],
              )),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 1,
          width: size.width * .95,
          color: gris,
        )
      ],
    );
  }
}
