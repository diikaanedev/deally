import 'package:deally/blocs/application-bloc.dart';
import 'package:deally/utils/close-app.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:deally/widgets/btn/btn-admin.dart';
import 'package:deally/widgets/menu/menu-button-brand-owner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RetailerScreen extends StatelessWidget {
  const RetailerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var applicationBloc = context.watch<ApplicationBloc>();

    return WillPopScope(
      onWillPop: () => onpressKit(context),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: meuveFonce,
          elevation: .0,
          centerTitle: true,
          title: Text(
            applicationBloc.appTitle,
            style: TextStyle(
                fontSize: size.width * .05,
                color: blanc,
                fontWeight: FontWeight.w400),
          ),
        ),
        body: applicationBloc.selectedIndex == 0
            ? ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    height: size.height * .02,
                  ),
                  Center(
                    child: Container(
                      height: size.height * .18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: noir,
                      ),
                      width: size.width * .9,
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * .01,
                          ),
                          Expanded(
                              child: Column(
                            children: [
                              const SizedBox(
                                height: 16,
                              ),
                              Expanded(
                                  child: Text(
                                "Your balance",
                                style: TextStyle(
                                    fontSize: size.width * .04, color: blanc),
                              )),
                              Expanded(
                                  child: Row(
                                children: [
                                  Spacer(),
                                  Text(
                                    '19000000',
                                    style: TextStyle(
                                        color: blanc,
                                        fontSize: size.width * .05,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    'FGN',
                                    style: TextStyle(color: blanc),
                                  ),
                                  const Spacer(),
                                ],
                              )),
                              const SizedBox(
                                height: 8,
                              ),
                              Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: Container(
                                      height: size.height * .05,
                                      width: size.width * .4,
                                      decoration: BoxDecoration(
                                          color: meuveFonce,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Center(
                                        child: Text(
                                          'Withhdraw'.toUpperCase(),
                                          style: TextStyle(
                                              color: blanc,
                                              fontSize: size.width * .03),
                                        ),
                                      ),
                                    ),
                                  )),
                              const SizedBox(
                                height: 8,
                              ),
                            ],
                          )),
                          const SizedBox(
                            width: 4,
                          ),
                          Container(
                            width: size.width * .005,
                            height: size.height * .17,
                            color: blanc,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Expanded(
                              child: Column(
                            children: [
                              const Spacer(),
                              Text(
                                "All Time Sales ",
                                style: TextStyle(
                                    fontSize: size.width * .04, color: blanc),
                              ),
                              SizedBox(
                                height: size.height * .02,
                              ),
                              Row(
                                children: [
                                  const Spacer(),
                                  Text(
                                    '29000000',
                                    style: TextStyle(
                                        color: meuveFonce,
                                        fontSize: size.width * .05,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    'FGN',
                                    style: TextStyle(
                                        color: meuveFonce,
                                        fontSize: size.width * .04,
                                        fontWeight: FontWeight.w200),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                              const Spacer(),
                            ],
                          )),
                          SizedBox(
                            width: size.width * .01,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * .06,
                          width: size.width * .9,
                          child: BtnAdminWidget(
                            color: meuveFonce,
                            onTap: () =>
                                applicationBloc.setSelectedIndexComercant(3),
                            text: "Add a car",
                            url: "assets/images/car.png",
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Container(
                          height: 2,
                          width: size.width * .9,
                          color: gris,
                        ),
                        SizedBox(
                          height: size.height * .06,
                          width: size.width * .9,
                          child: BtnAdminWidget(
                            onTap: () =>
                                applicationBloc.setSelectedIndexComercant(1),
                            text: "Pickup ",
                            color: meuveFonce,
                            url: "assets/images/distribution.png",
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Container(
                          height: 2,
                          width: size.width * .9,
                          color: gris,
                        ),
                        SizedBox(
                          height: size.height * .06,
                          width: size.width * .9,
                          child: BtnAdminWidget(
                            onTap: () =>
                                applicationBloc.setSelectedIndexComercant(4),
                            text: "Gestion du  compte ",
                            color: meuveFonce,
                            url: "assets/images/group.png",
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * .005,
                  ),
                  Center(
                    child: SizedBox(
                      // color: jaune,
                      height: size.height * .4,
                      width: size.width,
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * .02,
                          ),
                          SizedBox(
                            height: size.height * .05,
                            width: size.width,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: size.width * .02,
                                ),
                                Container(
                                  height: size.height * .05,
                                  width: size.width * .3,
                                  decoration: BoxDecoration(
                                      color: meuveFonce,
                                      borderRadius: BorderRadius.circular(16)),
                                  child: Center(
                                    child: Text(
                                      'Today',
                                      style: TextStyle(
                                          fontSize: size.width * .035,
                                          color: blanc),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * .02,
                                ),
                                Container(
                                  height: size.height * .05,
                                  width: size.width * .3,
                                  decoration: BoxDecoration(
                                      // color: noir,
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                          color: meuveFonce.withOpacity(.4))),
                                  child: Center(
                                    child: Text(
                                      'Monthly',
                                      style: TextStyle(
                                          fontSize: size.width * .035,
                                          color: meuveFonce.withOpacity(.4)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * .02,
                                ),
                                Container(
                                  height: size.height * .05,
                                  width: size.width * .3,
                                  decoration: BoxDecoration(
                                      // color: noir,
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                          color: meuveFonce.withOpacity(.4))),
                                  child: Center(
                                    child: Text(
                                      'View all',
                                      style: TextStyle(
                                          fontSize: size.width * .035,
                                          color: meuveFonce.withOpacity(.4)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * .005,
                          ),
                          Expanded(
                              child: Column(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: SizedBox(
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: blanc,
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Column(
                                                children: [
                                                  const Spacer(),
                                                  Text(
                                                    "0",
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.width * .07,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: meuveFonce),
                                                  ),
                                                  SizedBox(
                                                    height: size.height * .01,
                                                  ),
                                                  Text(
                                                    "New orders",
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.width * .05,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color: noir),
                                                  ),
                                                  const Spacer(),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )),
                                        Expanded(
                                            child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: blanc,
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Column(
                                                children: [
                                                  const Spacer(),
                                                  Text(
                                                    "0",
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.width * .07,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: jaune),
                                                  ),
                                                  SizedBox(
                                                    height: size.height * .01,
                                                  ),
                                                  Text(
                                                    "In progress",
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.width * .05,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color: noir),
                                                  ),
                                                  const Spacer(),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: SizedBox(
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: blanc,
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Column(
                                                children: [
                                                  const Spacer(),
                                                  Text(
                                                    "0",
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.width * .07,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: noir),
                                                  ),
                                                  SizedBox(
                                                    height: size.height * .01,
                                                  ),
                                                  Text(
                                                    "Complete ",
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.width * .05,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color: noir),
                                                  ),
                                                  const Spacer(),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )),
                                        Expanded(
                                            child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: blanc,
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Column(
                                                children: [
                                                  const Spacer(),
                                                  Text(
                                                    "0",
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.width * .07,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: rouge),
                                                  ),
                                                  SizedBox(
                                                    height: size.height * .01,
                                                  ),
                                                  Text(
                                                    "Canceled",
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.width * .05,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color: noir),
                                                  ),
                                                  const Spacer(),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ))
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : ListView(),
        backgroundColor: blanc,
        floatingActionButton: applicationBloc.selectedIndex == 3
            ? FloatingActionButton(
                elevation: 2,
                backgroundColor: noir,
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Container(),
                    )),
                child: const Icon(Icons.add),
              )
            : const SizedBox(),
        // bottomNavigationBar: MenuButtonRetailer(ontap: (value) {
        //   applicationBloc.setSelectedIndexComercant(value);
        // }),
      ),
    );
  }
}
