import 'package:deally/utils/colors-by-dii.dart';
import 'package:deally/widgets/orders/brand-owner/order-brand-owner-item-select-details.dart';
import 'package:flutter/material.dart';

class OrderBrandOwnerItemSelect extends StatelessWidget {
  const OrderBrandOwnerItemSelect({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('pickUp #123'),
        centerTitle: true,
        backgroundColor: jaune,
        elevation: .5,
      ),
      backgroundColor: blanc,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: size.height * .25,
            child: Expanded(
                child: Column(
              children: [
                Expanded(
                    child: Row(
                  children: [
                    SizedBox(
                      width: size.width * .05,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: size.height * .012,
                        ),
                        SizedBox(
                          width: size.width * .6,
                          child: Text(
                            "Date pick-up ",
                            style: TextStyle(
                                color: jaune,
                                fontSize: size.width * .05,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        SizedBox(
                          width: size.width * .6,
                          child: Text(
                            "Sat 25 December 1:30 PM",
                            style: TextStyle(
                                color: noir.withOpacity(.5),
                                fontSize: size.width * .04,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
                Expanded(
                    flex: 2,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Card(
                            elevation: 2,
                            child: SizedBox(
                              width: size.width * .35,
                              height: size.height * .15,
                              child: Column(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Spacer(),
                                  Text(
                                    'Total',
                                    style: TextStyle(
                                        fontSize: size.height * .025,
                                        color: jaune),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    '190000 FGN',
                                    style: TextStyle(
                                        fontSize: size.height * .017,
                                        color: noir.withOpacity(.5)),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            elevation: 2,
                            child: SizedBox(
                              width: size.width * .35,
                              height: size.height * .15,
                              child: Column(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Spacer(),
                                  Text(
                                    'Status',
                                    style: TextStyle(
                                        fontSize: size.height * .025,
                                        color: jaune),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Pending  Approval',
                                    style: TextStyle(
                                        fontSize: size.height * .017,
                                        color: noir.withOpacity(.5)),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            )),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: size.height * .6,
            child: Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            SizedBox(
                              width: size.width * .05,
                            ),
                            Text(
                              'PickUp Details',
                              style: TextStyle(
                                  fontSize: size.height * .03,
                                  color: noir.withOpacity(.6)),
                            )
                          ],
                        )),
                    Expanded(
                        flex: 9,
                        child: Center(
                          child: SizedBox(
                            height: size.height * .6,
                            width: size.width,
                            child: Card(
                              child: ListView(
                                physics: const BouncingScrollPhysics(),
                                children: ['f', 'j', "f", 'e', 'f']
                                    .map((e) =>
                                        const OrderBrandOwnerItemSelectDertails())
                                    .toList(),
                              ),
                            ),
                          ),
                        )),
                  ],
                )),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        // width: size.width,
        // color: rouge,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: size.height * .05,
              ),
              child: Container(
                height: 56.0,
                width: size.width * .45,
                decoration: BoxDecoration(
                    color: rouge, borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(
                    "Reject",
                    style: TextStyle(color: blanc),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: size.height * .05,
              ),
              child: Container(
                height: 56.0,
                width: size.width * .45,
                decoration: BoxDecoration(
                    color: vertFonce, borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(
                    "Accept",
                    style: TextStyle(color: blanc),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
