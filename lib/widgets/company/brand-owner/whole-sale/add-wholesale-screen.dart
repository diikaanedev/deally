import 'package:deally/blocs/application-bloc.dart';
import 'package:deally/blocs/fournisseur-bloc.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:deally/widgets/btn/btn-broder-round.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

class AddWholeSaleScreen extends StatelessWidget {
  const AddWholeSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var fournisseurBloc = context.read<FournisseurBloc>();
    return Scaffold(
      appBar: AppBar(
        elevation: .0,
        title: Text('Add wholeSaler'),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: size.height * .03,
          ),
          Row(
            children: [
              SizedBox(
                width: size.width * .05,
              ),
              Text(
                'Make sure your wholesaler information is the same as on his ID',
                style: TextStyle(
                    fontSize: 14, color: noir, fontWeight: FontWeight.w300),
              ),
            ],
          ),
          SizedBox(
            height: size.height * .03,
          ),
          Center(
            child: SizedBox(
              height: size.height * .1,
              width: size.width * .9,
              child: IntlPhoneField(
                invalidNumberMessage: 'Numéro de portable invalide',
                onCountryChanged: (value) {
                  // switch (value.code) {
                  //   case "GN":
                  //     appBlock.setLangue(2);
                  //     break;
                  //   case "CI":
                  //     appBlock.setLangue(2);
                  //     break;
                  //   case "SN":
                  //     appBlock.setLangue(2);
                  //     break;

                  //   default:
                  //     appBlock.setLangue(1);
                  //     break;
                  // }
                  fournisseurBloc.setContryWholeSaler(value.code);
                  print(value.code);
                },
                countries: const ['SN', 'GN', 'NG', 'CI'],
                decoration: const InputDecoration(
                  labelText: 'Téléphone',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'GN',
                onChanged: (phone) {
                  fournisseurBloc.setPhoneWholeSaler(phone.completeNumber);
                },
              ),
            ),
          ),
          SizedBox(
            height: size.height * .03,
          ),
          Center(
            child: Container(
              height: size.height * .07,
              width: size.width * .9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: meuveFonce, width: 1)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: fournisseurBloc.prenomWholeSaler,
                  style: TextStyle(
                      fontWeight: FontWeight.w300, fontSize: size.height * .02),
                  decoration: InputDecoration(
                    hintText: 'first name ',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: size.height * .02),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * .03,
          ),
          Center(
            child: Container(
              height: size.height * .07,
              width: size.width * .9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: meuveFonce, width: 1)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: fournisseurBloc.nomholeSaler,
                  style: TextStyle(
                      fontWeight: FontWeight.w300, fontSize: size.height * .02),
                  decoration: InputDecoration(
                    hintText: 'last name  ',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: size.height * .02),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * .03,
          ),
          Center(
            child: Container(
              height: size.height * .07,
              width: size.width * .9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: meuveFonce, width: 1)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: fournisseurBloc.shopWholeSaler,
                  style: TextStyle(
                      fontWeight: FontWeight.w300, fontSize: size.height * .02),
                  decoration: InputDecoration(
                    hintText: 'name shop ',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: size.height * .02),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * .1,
          ),
          Center(
            child: Container(
              width: size.width * .9,
              height: size.height * .07,
              child: BtnBorderRound(
                haveBg: true,
                bgActif: true,
                titre: fournisseurBloc.loading ? "Loading ..." : "Save",
                onTap: () async {
                  await fournisseurBloc.addWholeSaler();
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
