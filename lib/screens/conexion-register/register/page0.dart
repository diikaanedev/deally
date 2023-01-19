import 'package:deally/blocs/application-bloc.dart';
import 'package:deally/blocs/auth-bloc.dart';
import 'package:deally/utils/colors-by-dii.dart';
import 'package:deally/widgets/btn/btn-broder-round.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PageORegister extends StatelessWidget {
  const PageORegister({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var appBlock = context.read<ApplicationBloc>();
    var userBloc = context.watch<UserBlock>();
    return SizedBox(
      height: size.height,
      child: Column(
        children: [
          SizedBox(
            height: size.height * .05,
          ),
          Row(
            children: [
              Spacer(),
              Icon(
                CupertinoIcons.person_alt_circle,
                size: size.width * .05,
                color: gris,
              ),
              SizedBox(
                width: 8,
              ),
              Container(
                width: size.width * .7,
                color: gris,
                height: 5,
              ),
              SizedBox(
                width: 8,
              ),
              Icon(
                CupertinoIcons.flag,
                size: size.width * .05,
                color: gris,
              ),
              Spacer(),
            ],
          ),
          SizedBox(
            height: size.height * .02,
          ),
          Row(
            children: [
              SizedBox(
                width: size.width * .1,
              ),
              Text(
                appBlock.langue == 1 ? '1. My Account' : '1. Mon compte',
                style: TextStyle(fontSize: size.width * .03, color: gris),
              ),
              SizedBox(
                width: size.width * .03,
              ),
              Text(
                appBlock.langue == 1
                    ? '2. My informations'
                    : '2. Mes informations',
                style: TextStyle(fontSize: size.width * .03, color: gris),
              ),
              SizedBox(
                width: size.width * .05,
              ),
            ],
          ),
          SizedBox(
            height: size.height * .05,
          ),
          Container(
            width: size.width,
            color: gris,
            height: 5,
          ),
          SizedBox(
            height: size.height * .03,
          ),
          Row(
            children: [
              SizedBox(
                width: size.width * .07,
              ),
              Text(
                appBlock.langue == 1
                    ? "Register as :"
                    : "Inscrivez-vous en tant que :",
                style: TextStyle(
                    fontSize: size.width * .04,
                    fontWeight: FontWeight.w300,
                    color: meuveFonce),
              )
            ],
          ),
          SizedBox(
            height: size.height * .07,
          ),
          Row(
            children: [
              SizedBox(
                width: size.width * .03,
              ),
              Container(
                height: size.height * .06,
                width: size.width * .5,
                child: BtnBorderRound(
                  haveBg: userBloc.role == 'fournisseur',
                  titre: appBlock.langue == 1 ? "Supplier" : "Fournisseur",
                  centerText: true,
                  onTap: () => userBloc.setRole("fournisseur"),
                ),
              )
            ],
          ),
          SizedBox(
            height: size.height * .03,
          ),
          Row(
            children: [
              SizedBox(
                width: size.width * .03,
              ),
              Container(
                height: size.height * .06,
                width: size.width * .5,
                child: BtnBorderRound(
                  haveBg: userBloc.role == 'commercant',
                  centerText: true,
                  titre: appBlock.langue == 1 ? "Cusomer" : "Commercant",
                  onTap: () => userBloc.setRole("commercant"),
                ),
              )
            ],
          ),
          SizedBox(
            height: size.height * .2,
          ),
          Row(
            children: [
              SizedBox(
                width: size.width * .03,
              ),
              Container(
                height: size.height * .06,
                width: size.width * .94,
                child: BtnBorderRound(
                  haveBg: true,
                  bgActif: userBloc.role != "",
                  onTap: () {
                    print(userBloc.role != "");
                    if (userBloc.role != "") {
                      userBloc.incrementPageRegister();
                    }
                  },
                  titre: appBlock.langue == 1 ? 'Next' : 'Suivant',
                ),
              )
            ],
          ),
          SizedBox(height: size.height * .05),
        ],
      ),
    );
  }
}
