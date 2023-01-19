import 'package:deally/blocs/application-bloc.dart';
import 'package:deally/blocs/fournisseur-bloc.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:deally/widgets/company/brand-owner/whole-sale/add-wholesale-screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WholeSaleScreen extends StatelessWidget {
  const WholeSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var fournisseur = context.read<FournisseurBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('WholeSale'),
        elevation: .0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddWholeSaleScreen(),
            )),
        child: const Center(
          child: Icon(Icons.add),
        ),
      ),
      body: ListView(
        children: fournisseur.listWholeSaler
            .map((e) => Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Container(
                      height: size.height * .1,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: CircleAvatar(
                                radius: size.width * .08,
                                child: Center(
                                  child: Text(
                                    e.nameShop,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ),
                              )),
                          const SizedBox(
                            width: 6,
                          ),
                          Expanded(
                              flex: 3,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: size.height * .02,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: size.width * .5,
                                        height: size.height * .02,
                                        child: Text(
                                          "${e.firstName} ${e.lastName}",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: noir,
                                              fontSize: size.width * .045,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        e.matricule[0],
                                        style: TextStyle(
                                            fontSize: size.width * .04,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {},
                              child: Card(
                                color: gris,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)),
                                child: CircleAvatar(
                                  backgroundColor: gris,
                                  radius: size.width * .08,
                                  child: Icon(
                                    CupertinoIcons.phone,
                                    color: noir,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * .03,
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
