import 'package:deally/models/pack-discounts-model.dart';
import 'package:deally/models/produit_by_dii.dart';
import 'package:deally/screens/home/brand-owner.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:deally/utils/requette-by-dii.dart';
import 'package:flutter/material.dart';

class EditProdcutBrandOwnner extends StatefulWidget {
  final ProduitModel produit;
  const EditProdcutBrandOwnner({Key? key, required this.produit})
      : super(key: key);

  @override
  State<EditProdcutBrandOwnner> createState() => _EditProdcutBrandOwnnerState();
}

class _EditProdcutBrandOwnnerState extends State<EditProdcutBrandOwnner> {
  late Size size;
  TextEditingController quantiteMin1 = TextEditingController();
  bool quantiteMin1Error = false;
  TextEditingController quantiteMax1 = TextEditingController();
  bool quantiteMax1Error = false;
  TextEditingController price1 = TextEditingController();
  bool price1Error = false;
  TextEditingController quantiteMin2 = TextEditingController();
  bool quantiteMin2Error = false;
  TextEditingController quantiteMax2 = TextEditingController();
  bool quantiteMax2Error = false;
  TextEditingController price2 = TextEditingController();
  bool price2Error = false;
  TextEditingController quantiteMin3 = TextEditingController();
  bool quantiteMin3Error = false;
  TextEditingController quantiteMax3 = TextEditingController();
  bool quantiteMax3Error = false;
  TextEditingController price3 = TextEditingController();
  bool price3Error = false;
  TextEditingController nom = TextEditingController();
  TextEditingController marque = TextEditingController();
  TextEditingController stock = TextEditingController();

  TextEditingController conservation = TextEditingController();
  TextEditingController description = TextEditingController();
  List<PackDiscountsModel> packDiscount = [];
  bool isActif = true;
  int valid = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.produit.brand);
    setState(() {
      marque.value = TextEditingValue(text: widget.produit.brand);
      stock.value = TextEditingValue(text: widget.produit.stock);
      nom.value = TextEditingValue(text: widget.produit.name);
      quantiteMin1.value = TextEditingValue(
          text: widget.produit.packDiscounts[0].min.toString());
      quantiteMax1.value = TextEditingValue(
          text: widget.produit.packDiscounts[0].max.toString());
      price1.value = TextEditingValue(
          text: widget.produit.packDiscounts[0].price.toString());
      quantiteMin2.value = TextEditingValue(
          text: widget.produit.packDiscounts[1].min.toString());
      quantiteMax2.value = TextEditingValue(
          text: widget.produit.packDiscounts[1].max.toString());
      price2.value = TextEditingValue(
          text: widget.produit.packDiscounts[1].price.toString());
      quantiteMin3.value = TextEditingValue(
          text: widget.produit.packDiscounts[2].min.toString());
      quantiteMax3.value = TextEditingValue(
          text: widget.produit.packDiscounts[2].max.toString());
      price3.value = TextEditingValue(
          text: widget.produit.packDiscounts[2].price.toString());
      description.value = TextEditingValue(text: widget.produit.description);
      conservation.value =
          TextEditingValue(text: widget.produit.storageCondition);
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: meuveFonce,
        title: Text(''),
        elevation: .0,
        toolbarHeight: .0,
      ),
      backgroundColor: blanc,
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: size.height * .012,
          ),
          Row(
            children: [
              const Spacer(),
              Text(
                'Edit product',
                style: TextStyle(
                    fontSize: size.height * .03,
                    color: noir,
                    fontWeight: FontWeight.w300),
              ),
              const Spacer(),
            ],
          ),
          SizedBox(
            height: size.height * .015,
          ),
          SizedBox(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: size.width * .06,
                    ),
                    Text('Product name')
                  ],
                ),
                SizedBox(
                  height: size.height * .017,
                ),
                Center(
                  child: Container(
                    width: size.width * .9,
                    height: size.height * .06,
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          // ignore: sort_child_properties_last
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: nom,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: size.height * .017),
                              keyboardType: TextInputType.text,
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                // label: Text('Product name'),
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: size.height * .017),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: meuveFonce)),
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * .017,
          ),
          SizedBox(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: size.width * .06,
                    ),
                    Text('Product brand')
                  ],
                ),
                SizedBox(
                  height: size.height * .017,
                ),
                Center(
                  child: Container(
                    width: size.width * .9,
                    height: size.height * .06,
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          // ignore: sort_child_properties_last
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: marque,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: size.height * .017),
                              keyboardType: TextInputType.text,
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                // label: Text('Product brand'),
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: size.height * .017),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: meuveFonce)),
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * .017,
          ),
          SizedBox(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: size.width * .06,
                    ),
                    Text('Product description')
                  ],
                ),
                SizedBox(
                  height: size.height * .017,
                ),
                Center(
                  child: Container(
                    width: size.width * .9,
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          height: size.height * .2,
                          // ignore: sort_child_properties_last
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: description,
                              keyboardType: TextInputType.multiline,
                              minLines:
                                  1, //Normal textInputField will be displayed
                              maxLines: 10,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: size.height * .017),
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                // label: Text('Product description'),
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: size.height * .017),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: meuveFonce)),
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * .017,
          ),
          SizedBox(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: size.width * .06,
                    ),
                    Text('Product condition storage')
                  ],
                ),
                SizedBox(
                  height: size.height * .017,
                ),
                Center(
                  child: Container(
                    width: size.width * .9,
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          height: size.height * .2,
                          // ignore: sort_child_properties_last
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: conservation,
                              keyboardType: TextInputType.multiline,
                              minLines:
                                  1, //Normal textInputField will be displayed
                              maxLines: 10,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: size.height * .017),
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                // label: Text('Product  condition storage'),
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: size.height * .017),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: meuveFonce)),
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * .017,
          ),
          SizedBox(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: size.width * .06,
                    ),
                    Text('Product quantity available')
                  ],
                ),
                SizedBox(
                  height: size.height * .017,
                ),
                Center(
                  child: Container(
                    width: size.width * .9,
                    height: size.height * .06,
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          // ignore: sort_child_properties_last
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: stock,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: size.height * .017),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                // label: Text('Product brand'),
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: size.height * .017),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: meuveFonce)),
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * .017,
          ),
          SizedBox(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: size.width * .06,
                    ),
                    Text('Minimum order')
                  ],
                ),
                SizedBox(
                  height: size.height * .017,
                ),
                Center(
                  child: Container(
                    width: size.width * .9,
                    height: size.height * .06,
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          // ignore: sort_child_properties_last
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: quantiteMin1,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: quantiteMin1Error ? rouge : noir,
                                  fontSize: size.height * .017),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                label: quantiteMin1Error
                                    ? Text('value need to be change')
                                    : Text('Minimum quantity'),
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: quantiteMin1Error ? rouge : noir,
                                    fontSize: size.height * .017),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color:
                                      quantiteMin1Error ? rouge : meuveFonce)),
                        )),
                        SizedBox(
                          width: size.width * .017,
                        ),
                        Expanded(
                            child: Container(
                          // ignore: sort_child_properties_last
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: quantiteMax1,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: quantiteMax1Error ? rouge : noir,
                                  fontSize: size.height * .017),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                label: quantiteMax1Error
                                    ? Text('value need to be change')
                                    : Text('Maximum quantity'),
                                labelStyle: TextStyle(
                                    color: quantiteMax1Error ? rouge : noir,
                                    fontWeight: FontWeight.w300,
                                    fontSize: size.height * .017),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color:
                                      quantiteMax1Error ? rouge : meuveFonce)),
                        )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * .017,
                ),
                Center(
                  child: Container(
                    width: size.width * .9,
                    height: size.height * .06,
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          // ignore: sort_child_properties_last
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: price1,
                              style: TextStyle(
                                  color: price1Error ? rouge : noir,
                                  fontWeight: FontWeight.w300,
                                  fontSize: size.height * .017),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                label: price1Error
                                    ? Text('value need to be change')
                                    : Text("Price per quantity"),
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: price1Error ? rouge : noir,
                                    fontSize: size.height * .017),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: price1Error ? rouge : meuveFonce)),
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * .017,
          ),
          SizedBox(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: size.width * .06,
                    ),
                    Text('Acceptable order')
                  ],
                ),
                SizedBox(
                  height: size.height * .017,
                ),
                Center(
                  child: Container(
                    width: size.width * .9,
                    height: size.height * .06,
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          // ignore: sort_child_properties_last
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: quantiteMin2,
                              style: TextStyle(
                                  color: quantiteMin2Error ? rouge : noir,
                                  fontWeight: FontWeight.w300,
                                  fontSize: size.height * .017),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                label: quantiteMin2Error
                                    ? Text('value need to be change')
                                    : Text('Minimum quantity'),
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: quantiteMin2Error ? rouge : noir,
                                    fontSize: size.height * .017),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color:
                                      quantiteMin2Error ? rouge : meuveFonce)),
                        )),
                        SizedBox(
                          width: size.width * .017,
                        ),
                        Expanded(
                            child: Container(
                          // ignore: sort_child_properties_last
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: quantiteMax2,
                              style: TextStyle(
                                  color: quantiteMin2Error ? rouge : noir,
                                  fontWeight: FontWeight.w300,
                                  fontSize: size.height * .017),
                              onChanged: (value) {},
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                label: quantiteMax2Error
                                    ? Text('value need to be change')
                                    : Text('Maximum quantity'),
                                labelStyle: TextStyle(
                                    color: quantiteMin2Error ? rouge : noir,
                                    fontWeight: FontWeight.w300,
                                    fontSize: size.height * .017),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color:
                                      quantiteMin2Error ? rouge : meuveFonce)),
                        )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * .017,
                ),
                Center(
                  child: Container(
                    width: size.width * .9,
                    height: size.height * .06,
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          // ignore: sort_child_properties_last
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: price2,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: price2Error ? rouge : noir,
                                  fontSize: size.height * .017),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                label: price2Error
                                    ? Text('value need to be change')
                                    : Text('Price per quantity'),
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: price2Error ? rouge : noir,
                                    fontSize: size.height * .017),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: price2Error ? rouge : meuveFonce)),
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * .017,
          ),
          SizedBox(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: size.width * .06,
                    ),
                    Text('Best pricing')
                  ],
                ),
                SizedBox(
                  height: size.height * .017,
                ),
                Center(
                  child: Container(
                    width: size.width * .9,
                    height: size.height * .06,
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          // ignore: sort_child_properties_last
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: quantiteMin3,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: quantiteMin3Error ? rouge : noir,
                                  fontSize: size.height * .017),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                label: quantiteMin3Error
                                    ? Text('value need to be change')
                                    : Text('Maximum quantity'),
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: quantiteMin3Error ? rouge : noir,
                                    fontSize: size.height * .017),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color:
                                      quantiteMin3Error ? rouge : meuveFonce)),
                        )),
                        SizedBox(
                          width: size.width * .017,
                        ),
                        Expanded(
                            child: Container(
                          // ignore: sort_child_properties_last
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: quantiteMax3,
                              style: TextStyle(
                                  color: quantiteMax3Error ? rouge : noir,
                                  fontWeight: FontWeight.w300,
                                  fontSize: size.height * .017),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                label: quantiteMax3Error
                                    ? Text('value need to be change')
                                    : Text('Maximum quantity'),
                                labelStyle: TextStyle(
                                    color: quantiteMax3Error ? rouge : noir,
                                    fontWeight: FontWeight.w300,
                                    fontSize: size.height * .017),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color:
                                      quantiteMax3Error ? rouge : meuveFonce)),
                        )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * .017,
                ),
                Center(
                  child: Container(
                    width: size.width * .9,
                    height: size.height * .06,
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          // ignore: sort_child_properties_last
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: price3,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: price3Error ? rouge : noir,
                                  fontSize: size.height * .017),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  isActif = true;
                                });
                              },
                              decoration: InputDecoration(
                                label: price3Error
                                    ? Text('value need to be change')
                                    : Text('Price per quantity'),
                                labelStyle: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: price3Error ? rouge : noir,
                                    fontSize: size.height * .017),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: price3Error ? rouge : meuveFonce)),
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * .02,
          ),
          Center(
            child: GestureDetector(
              onTap: () async {
                setState(() {
                  valid = 1;
                });
                if (int.parse(quantiteMin1.text) > 1 &&
                    int.parse(quantiteMin1.text) <
                        int.parse(quantiteMax1.text)) {
                  setState(() {
                    quantiteMin1Error = false;
                  });
                } else {
                  setState(() {
                    valid = 2;
                    quantiteMin1Error = true;
                  });
                }

                if (int.parse(quantiteMax1.text) >
                    int.parse(quantiteMin1.text)) {
                  setState(() {
                    quantiteMax1Error = false;
                  });
                } else {
                  setState(() {
                    valid = 2;
                    quantiteMax1Error = true;
                  });
                }

                if (int.parse(quantiteMax2.text) >
                    int.parse(quantiteMin2.text)) {
                  setState(() {
                    quantiteMax2Error = false;
                  });
                } else {
                  setState(() {
                    valid = 2;
                    quantiteMax2Error = true;
                  });
                }

                if (int.parse(quantiteMin2.text) >
                        int.parse(quantiteMax1.text) &&
                    int.parse(quantiteMin2.text) <
                        int.parse(quantiteMax2.text)) {
                  setState(() {
                    quantiteMin2Error = false;
                  });
                } else {
                  setState(() {
                    valid = 2;
                    quantiteMin2Error = true;
                  });
                }

                if (int.parse(quantiteMax3.text) >
                    int.parse(quantiteMin3.text)) {
                  setState(() {
                    quantiteMax3Error = false;
                  });
                } else {
                  setState(() {
                    valid = 2;
                    quantiteMax3Error = true;
                  });
                }

                if (int.parse(quantiteMin3.text) >
                        int.parse(quantiteMax2.text) &&
                    int.parse(quantiteMin3.text) <
                        int.parse(quantiteMax3.text)) {
                  setState(() {
                    quantiteMin3Error = false;
                  });
                } else {
                  setState(() {
                    valid = 2;
                    quantiteMin3Error = true;
                  });
                }

                if (int.parse(price1.text) >= 50) {
                  setState(() {
                    price1Error = false;
                  });
                } else {
                  setState(() {
                    valid = 2;
                    price1Error = true;
                  });
                }

                if (int.parse(price2.text) <= int.parse(price1.text)) {
                  setState(() {
                    price2Error = false;
                  });
                } else {
                  setState(() {
                    valid = 2;
                    price2Error = true;
                  });
                }

                if (int.parse(price3.text) <= int.parse(price2.text)) {
                  setState(() {
                    price3Error = false;
                  });
                } else {
                  setState(() {
                    valid = 2;
                    price3Error = true;
                  });
                }

                if (valid == 1) {
                  packDiscount = [];
                  packDiscount.add(PackDiscountsModel(
                      id: "1",
                      min: int.parse(quantiteMin1.text),
                      max: int.parse(quantiteMax1.text),
                      price: int.parse(price1.text)));
                  packDiscount.add(PackDiscountsModel(
                      id: "2",
                      min: int.parse(quantiteMin2.text),
                      max: int.parse(quantiteMax2.text),
                      price: int.parse(price2.text)));
                  packDiscount.add(PackDiscountsModel(
                      id: "3",
                      min: int.parse(quantiteMin3.text),
                      max: int.parse(quantiteMax3.text),
                      price: int.parse(price3.text)));

                  Map<String, dynamic> body = {
                    "name": nom.text,
                    "description": description.text,
                    "pack_discounts": packDiscount
                        .map((e) =>
                            {"min": e.min, "max": e.max, "price": e.price})
                        .toList(),
                    "saleEnd": DateTime.now()
                        .add(Duration(days: 10))
                        .toIso8601String(),
                    "stock": stock.text,
                    "brand": marque.text,
                    "storageCondition": conservation.text,
                  };
                  print(body);
                  await putResponse(
                          url: '/products/' + widget.produit.id, body: body)
                      .then((value) => print(value));
                  homeBrandOwnerState.getProduct();
                  Navigator.pop(context);

                  // ignore: use_build_context_synchronously
                }
              },
              child: Container(
                height: size.height * .06,
                width: size.width * .9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: isActif ? meuveFonce : meuveFonce.withOpacity(.3)),
                child: Center(
                    child: Row(
                  children: [
                    Spacer(),
                    Text(
                      "Update Product ".toUpperCase(),
                      style:
                          TextStyle(fontSize: size.height * .016, color: blanc),
                    ),
                    Spacer(),
                  ],
                )),
              ),
            ),
          ),
          SizedBox(
            height: size.height * .05,
          ),
        ],
      ),
    );
  }
}
